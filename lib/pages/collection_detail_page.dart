import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/code_collection.dart';
import '../providers/icf_providers.dart';
import '../services/collections_service.dart';
import '../services/pdf_export_service.dart';
import '../utils/domain_utils.dart';
import '../l10n/app_localizations.dart';

class CollectionDetailPage extends ConsumerWidget {
  final String collectionId;

  const CollectionDetailPage({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final collections = ref.watch(collectionsProvider);
    final dataService = ref.watch(icfDataServiceProvider);
    final collection = collections
        .where((c) => c.id == collectionId)
        .cast<CodeCollection?>()
        .firstOrNull;

    if (collection == null) {
      // Sammlung wurde gelöscht — zurück zur Übersicht.
      return Scaffold(
        appBar: AppBar(title: Text(l10n.collections)),
        body: const SizedBox.shrink(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(collection.name),
        actions: [
          if (collection.entries.isNotEmpty) ...[
            IconButton(
              icon: const Icon(Icons.picture_as_pdf_outlined),
              tooltip: l10n.exportPdf,
              onPressed: () => PdfExportService.exportCollection(
                collection: collection,
                titleOf: dataService.getTitle,
                details: dataService.details,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.table_chart_outlined),
              tooltip: l10n.exportCsv,
              onPressed: () => _shareCsv(collection, dataService.getTitle),
            ),
          ],
        ],
      ),
      body: collection.entries.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.folder_open,
                        size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(l10n.collectionEmpty,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Text(l10n.collectionEmptyHint,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.fromLTRB(
                  8, 8, 8, 8 + MediaQuery.paddingOf(context).bottom),
              itemCount: collection.entries.length,
              itemBuilder: (context, index) {
                final entry = collection.entries[index];
                final title = dataService.getTitle(entry.code) ?? entry.code;
                final color = DomainUtils.colorFor(entry.code[0]);
                return Dismissible(
                  key: Key('${collection.id}_${entry.code}'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Theme.of(context).colorScheme.error,
                    child: Icon(Icons.delete,
                        color: Theme.of(context).colorScheme.onError),
                  ),
                  onDismissed: (_) => ref
                      .read(collectionsProvider.notifier)
                      .removeEntry(collection.id, entry.code),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: color.withValues(alpha: 0.15),
                        child: Text(
                          entry.code[0].toUpperCase(),
                          style: TextStyle(
                              color: color, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(entry.qualifiedCode,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.primary,
                              )),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      subtitle: entry.note.isNotEmpty
                          ? Text(entry.note,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic))
                          : null,
                      trailing: IconButton(
                        icon: const Icon(Icons.edit_note),
                        tooltip: l10n.editEntry,
                        onPressed: () => _editEntry(
                            context, ref, l10n, collection.id, entry),
                      ),
                      onTap: () => context.push('/code/${entry.code}'),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<void> _editEntry(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    String collectionId,
    CollectionEntry entry,
  ) async {
    final noteController = TextEditingController(text: entry.note);
    final qualifierController = TextEditingController(text: entry.qualifier);

    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('${l10n.editEntry}: ${entry.code}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: qualifierController,
              decoration: const InputDecoration(
                labelText: 'Qualifier',
                hintText: '.2',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteController,
              autofocus: true,
              maxLines: 3,
              decoration: InputDecoration(labelText: l10n.note),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.save),
          ),
        ],
      ),
    );

    if (saved == true) {
      final qualifier = qualifierController.text.trim();
      final valid = qualifier.isEmpty ||
          RegExp(r'^[.+][0-9]{1,4}$').hasMatch(qualifier);
      await ref.read(collectionsProvider.notifier).updateEntry(
            collectionId,
            entry.code,
            entry.copyWith(
              qualifier: valid ? qualifier : entry.qualifier,
              note: noteController.text.trim(),
            ),
          );
    }
  }

  Future<void> _shareCsv(
      CodeCollection collection, String? Function(String) titleOf) async {
    final csv = CollectionsService.toCsv(collection, titleOf);
    final dir = await getTemporaryDirectory();
    final safeName = collection.name
        .replaceAll(RegExp(r'[^A-Za-z0-9äöüÄÖÜß _-]'), '')
        .replaceAll(' ', '_');
    final file = File('${dir.path}/icf_$safeName.csv');
    await file.writeAsString('﻿$csv');
    await Share.shareXFiles([XFile(file.path, mimeType: 'text/csv')]);
  }
}
