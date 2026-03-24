import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/icf_providers.dart';

class ChapterCard extends ConsumerWidget {
  final String code;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ChapterCard({
    super.key,
    required this.code,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataService = ref.watch(icfDataServiceProvider);
    final childCount = dataService
        .getCategoriesForChapter(code)
        .length;

    return Semantics(
      button: true,
      label: '$code: $title, $childCount Kategorien',
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.15),
            child: Text(
              code.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 14,
              ),
            ),
          ),
          title: Text(title,
              style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text('$childCount Kategorien'),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }
}
