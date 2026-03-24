import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../utils/domain_utils.dart';
import '../l10n/app_localizations.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final results = ref.watch(searchResultsProvider);
    final domainFilter = ref.watch(searchDomainFilterProvider);

    final filtered = domainFilter == null
        ? results
        : results.where((e) => e.key.startsWith(domainFilter)).toList();

    return Column(
      children: [
        // Domain filter chips
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              FilterChip(
                label: Text(l10n.all),
                selected: domainFilter == null,
                onSelected: (_) =>
                    ref.read(searchDomainFilterProvider.notifier).state = null,
              ),
              const SizedBox(width: 6),
              ...DomainUtils.keys.map((key) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      avatar: Icon(DomainUtils.iconFor(key), size: 16),
                      label: Text(key.toUpperCase()),
                      selected: domainFilter == key,
                      selectedColor:
                          DomainUtils.colorFor(key).withValues(alpha: 0.2),
                      onSelected: (_) => ref
                          .read(searchDomainFilterProvider.notifier)
                          .state = domainFilter == key ? null : key,
                    ),
                  )),
            ],
          ),
        ),

        // Results
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.search_off,
                          size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(l10n.noResults,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.grey)),
                    ],
                  ),
                )
              : Semantics(
                  label: '${filtered.length} ${l10n.searchResults}',
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 4),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final entry = filtered[index];
                      final color = DomainUtils.colorFor(entry.key[0]);

                      return Semantics(
                        label: '${entry.key}: ${entry.value}',
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                color.withValues(alpha: 0.15),
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                fontSize:
                                    entry.key.length > 4 ? 9 : 11,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ),
                          title: Text(entry.value),
                          subtitle: Text(entry.key,
                              style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500)),
                          onTap: () =>
                              context.push('/code/${entry.key}'),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
