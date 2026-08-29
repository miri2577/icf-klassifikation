import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../widgets/add_to_collection_sheet.dart';
import '../l10n/app_localizations.dart';

class CollectionsPage extends ConsumerWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final collections = ref.watch(collectionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.collections),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: Text(l10n.newCollection),
        onPressed: () async {
          final name = await promptCollectionName(context, l10n);
          if (name == null || name.trim().isEmpty) return;
          await ref
              .read(collectionsProvider.notifier)
              .create(name.trim());
        },
      ),
      body: collections.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.folder_open,
                        size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(l10n.noCollections,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Text(l10n.noCollectionsHint,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.fromLTRB(8, 8, 8,
                  88 + MediaQuery.paddingOf(context).bottom),
              itemCount: collections.length,
              itemBuilder: (context, index) {
                final collection = collections[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primaryContainer,
                      child: const Icon(Icons.folder_outlined),
                    ),
                    title: Text(collection.name,
                        style:
                            const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        l10n.entriesCount(collection.entries.length)),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) async {
                        switch (value) {
                          case 'rename':
                            final name = await promptCollectionName(
                                context, l10n,
                                initial: collection.name);
                            if (name != null && name.trim().isNotEmpty) {
                              await ref
                                  .read(collectionsProvider.notifier)
                                  .rename(collection.id, name.trim());
                            }
                          case 'delete':
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: Text(l10n.deleteCollection),
                                content: Text(l10n.deleteCollectionConfirm(
                                    collection.name)),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(
                                            dialogContext)
                                        .pop(false),
                                    child: Text(l10n.cancel),
                                  ),
                                  FilledButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext)
                                            .pop(true),
                                    child: Text(l10n.delete),
                                  ),
                                ],
                              ),
                            );
                            if (confirmed == true) {
                              await ref
                                  .read(collectionsProvider.notifier)
                                  .delete(collection.id);
                            }
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'rename',
                          child: ListTile(
                            leading: const Icon(Icons.edit_outlined),
                            title: Text(l10n.renameCollection),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: ListTile(
                            leading: const Icon(Icons.delete_outline),
                            title: Text(l10n.deleteCollection),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    onTap: () =>
                        context.push('/collections/${collection.id}'),
                  ),
                );
              },
            ),
    );
  }
}
