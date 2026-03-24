import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../utils/domain_utils.dart';
import '../l10n/app_localizations.dart';

class ChapterPage extends ConsumerWidget {
  final String chapterCode;

  const ChapterPage({super.key, required this.chapterCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dataService = ref.watch(icfDataServiceProvider);
    final chapterTitle = dataService.getTitle(chapterCode) ?? '';
    final color = DomainUtils.colorFor(chapterCode[0]);
    final categories = dataService.getCategoriesForChapter(chapterCode);

    return Scaffold(
      appBar: AppBar(
        title: Text('$chapterCode \u2013 $chapterTitle'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final subCategories = dataService.getSubCategories(cat.key);

          return Card(
            margin: const EdgeInsets.only(bottom: 4),
            child: ExpansionTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: color.withValues(alpha: 0.12),
                child: Text(
                  cat.key,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              title: Semantics(
                label: '${cat.key}: ${cat.value}',
                child: Text(
                  cat.value,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: subCategories.isNotEmpty
                  ? Text(l10n.subCategoriesCount(subCategories.length),
                      style: const TextStyle(fontSize: 12))
                  : null,
              children: subCategories.map((sub) {
                final indent = (sub.key.length - 4) * 16.0;
                return ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 24 + indent, right: 16),
                  leading: Text(
                    sub.key,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  title: Text(
                    sub.value,
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () => context.push('/code/${sub.key}'),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
