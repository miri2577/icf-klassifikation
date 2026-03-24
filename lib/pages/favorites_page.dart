import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../services/pdf_export_service.dart';
import '../utils/domain_utils.dart';
import '../l10n/app_localizations.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final favorites = ref.watch(favoritesProvider);
    final dataService = ref.watch(icfDataServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.favorites),
        actions: [
          if (favorites.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.picture_as_pdf),
              tooltip: l10n.exportPdf,
              onPressed: () {
                final codes = favorites
                    .map((code) => MapEntry(
                        code, dataService.getTitle(code) ?? code))
                    .toList();
                PdfExportService.exportCodes(
                  codes: codes,
                  details: dataService.details,
                  title: l10n.favoritesPdfTitle,
                );
              },
            ),
        ],
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.favorite_border,
                      size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(l10n.noFavorites,
                      style: const TextStyle(
                          fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(l10n.noFavoritesHint,
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final code = favorites[index];
                final title = dataService.getTitle(code) ?? code;
                final domain = code[0];
                final color = DomainUtils.colorFor(domain);

                return Dismissible(
                  key: Key(code),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) =>
                      ref.read(favoritesProvider.notifier).toggle(code),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: color.withValues(alpha: 0.15),
                        child: Text(
                          code,
                          style: TextStyle(
                            fontSize: code.length > 4 ? 9 : 11,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ),
                      title: Text(title),
                      subtitle: Text(code,
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w500)),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(favoritesProvider.notifier)
                            .toggle(code),
                      ),
                      onTap: () => context.push('/code/$code'),
                    ),
                  ),
                );
              },
            ),
    );
  }

}
