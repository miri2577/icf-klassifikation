import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/code_collection.dart';
import '../providers/icf_providers.dart';
import '../l10n/app_localizations.dart';

/// Bottom-Sheet zur Auswahl einer Sammlung, in die [code] (mit optionalem
/// [qualifier]-Suffix) aufgenommen wird. Bietet auch das Anlegen einer
/// neuen Sammlung an.
Future<void> showAddToCollectionSheet(
  BuildContext context,
  WidgetRef ref, {
  required String code,
  String qualifier = '',
}) async {
  final l10n = AppLocalizations.of(context)!;
  final messenger = ScaffoldMessenger.of(context);

  Future<void> addTo(CodeCollection collection) async {
    await ref.read(collectionsProvider.notifier).addEntry(
          collection.id,
          CollectionEntry(code: code, qualifier: qualifier),
        );
    messenger.showSnackBar(
      SnackBar(
        content: Text(l10n.addedToCollection(collection.name)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) {
      return Consumer(
        builder: (context, sheetRef, _) {
          final collections = sheetRef.watch(collectionsProvider);
          return SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    '${l10n.addToCollection}: $code$qualifier',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ...collections.map((c) => ListTile(
                      leading: const Icon(Icons.folder_outlined),
                      title: Text(c.name),
                      subtitle: Text(l10n.entriesCount(c.entries.length)),
                      onTap: () async {
                        Navigator.of(sheetContext).pop();
                        await addTo(c);
                      },
                    )),
                ListTile(
                  leading: const Icon(Icons.create_new_folder_outlined),
                  title: Text(l10n.newCollection),
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    final name = await promptCollectionName(context, l10n);
                    if (name == null || name.trim().isEmpty) return;
                    final collection = await ref
                        .read(collectionsProvider.notifier)
                        .create(name.trim());
                    await addTo(collection);
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      );
    },
  );
}

/// Dialog zur Eingabe eines Sammlungsnamens (Anlegen oder Umbenennen).
Future<String?> promptCollectionName(
    BuildContext context, AppLocalizations l10n,
    {String initial = ''}) {
  final controller = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(initial.isEmpty ? l10n.newCollection : l10n.renameCollection),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(labelText: l10n.collectionName),
            onSubmitted: (value) =>
                Navigator.of(dialogContext).pop(value),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.collectionPrivacyHint,
            style: Theme.of(dialogContext).textTheme.bodySmall?.copyWith(
                  color: Theme.of(dialogContext).colorScheme.outline,
                ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () =>
              Navigator.of(dialogContext).pop(controller.text),
          child: Text(
              initial.isEmpty ? l10n.createCollection : l10n.save),
        ),
      ],
    ),
  );
}
