import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart' show Share;
import '../providers/icf_providers.dart';
import '../widgets/qualifier_builder.dart';
import '../widgets/code_link_text.dart';
import '../widgets/add_to_collection_sheet.dart';
import '../l10n/app_localizations.dart';

class CodeDetailPage extends ConsumerWidget {
  final String code;

  const CodeDetailPage({super.key, required this.code});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dataService = ref.watch(icfDataServiceProvider);
    final title = dataService.getTitle(code) ?? code;
    final domain = code[0];
    final domainName = dataService.domains[domain] ?? '';
    final detail = dataService.getDetail(code);
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.contains(code);

    // Track history + In-App-Review-Zähler
    Future.microtask(() {
      ref.read(historyProvider.notifier).add(code);
      ref.read(reviewServiceProvider).onDetailViewed();
    });

    // Geschwister-Codes für Vor/Zurück-Navigation
    List<String> siblings = const [];
    if (code.length > 2) {
      final parent = dataService.getParentCode(code);
      if (parent != null && parent.length >= 2) {
        siblings = dataService.getChildren(parent);
      }
    }
    final siblingIndex = siblings.indexOf(code);
    final prevCode = siblingIndex > 0 ? siblings[siblingIndex - 1] : null;
    final nextCode = siblingIndex >= 0 && siblingIndex < siblings.length - 1
        ? siblings[siblingIndex + 1]
        : null;

    // Build breadcrumb
    final breadcrumbs = <MapEntry<String, String>>[];
    breadcrumbs.add(MapEntry(domain, domainName));

    if (code.length >= 2) {
      final chapterCode = code.substring(0, 2);
      final chapterTitle = dataService.getTitle(chapterCode);
      if (chapterTitle != null) {
        breadcrumbs.add(MapEntry(chapterCode, chapterTitle));
      }
    }
    if (code.length >= 4) {
      final catCode = code.substring(0, 4);
      final catTitle = dataService.getTitle(catCode);
      if (catTitle != null && catCode != code) {
        breadcrumbs.add(MapEntry(catCode, catTitle));
      }
    }
    if (code.length >= 5) {
      final subCode = code.substring(0, 5);
      final subTitle = dataService.getTitle(subCode);
      if (subTitle != null && subCode != code) {
        breadcrumbs.add(MapEntry(subCode, subTitle));
      }
    }

    // Get children
    final children = dataService.getChildren(code);

    // Qualifier scale
    final qualifiers = domain == 'e'
        ? dataService.environmentalQualifiers
        : dataService.qualifierScale;

    final shareText = '$code: $title'
        '${detail != null && detail.description.isNotEmpty ? '\n\n${detail.description}' : ''}'
        '\n\nIn der App öffnen: icf://open/code/$code';

    return Scaffold(
      appBar: AppBar(
        title: Text('$code \u2013 $title'),
        // Per Deep Link ge\u00f6ffnet: kein Stack zum Zur\u00fcckgehen -> Home-Button
        leading: context.canPop()
            ? null
            : IconButton(
                icon: const Icon(Icons.home_outlined),
                tooltip: l10n.appTitle,
                onPressed: () => context.go('/home'),
              ),
        actions: [
          // Copy button
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: l10n.copyCode,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: '$code: $title'));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.codeCopied(code)),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
          // Share button
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: l10n.share,
            onPressed: () => Share.share(shareText),
          ),
          // Favorite button
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            tooltip: isFavorite
                ? l10n.removeFromFavorites
                : l10n.addToFavorites,
            onPressed: () =>
                ref.read(favoritesProvider.notifier).toggle(code),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 16 + MediaQuery.paddingOf(context).bottom),
        children: [
          // Title card
          Semantics(
            header: true,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      code,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(title,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
            ),
          ),

          // Geschwister-Navigation
          if (prevCode != null || nextCode != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  if (prevCode != null)
                    TextButton.icon(
                      icon: const Icon(Icons.chevron_left),
                      label: Text(prevCode),
                      onPressed: () =>
                          context.pushReplacement('/code/$prevCode'),
                    ),
                  const Spacer(),
                  if (nextCode != null)
                    TextButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(Icons.chevron_right),
                      label: Text(nextCode),
                      onPressed: () =>
                          context.pushReplacement('/code/$nextCode'),
                    ),
                ],
              ),
            ),

          // Description
          if (detail != null && detail.description.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.description,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(detail.description,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
          ],

          // Inclusions
          if (detail != null && detail.inclusions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Card(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.add_circle_outline,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(l10n.inclusions,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...detail.inclusions.map((inc) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('  \u2022  '),
                              Expanded(child: CodeLinkText(inc)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],

          // Exclusions
          if (detail != null && detail.exclusions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Card(
              color: Theme.of(context)
                  .colorScheme
                  .errorContainer
                  .withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.remove_circle_outline,
                            size: 18,
                            color: Theme.of(context).colorScheme.error),
                        const SizedBox(width: 8),
                        Text(l10n.exclusions,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.error,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...detail.exclusions.map((exc) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('  \u2022  '),
                              Expanded(child: CodeLinkText(exc)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Hierarchy
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.hierarchy,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...breadcrumbs.asMap().entries.map((e) {
                    final indent = e.key * 20.0;
                    final crumbCode = e.value.key;
                    // Dom\u00e4nen-Buchstabe hat keine eigene Seite;
                    // Kapitel \u00f6ffnen die Kapitelseite, Rest die Detailseite.
                    final VoidCallback? onTap = crumbCode.length == 1
                        ? null
                        : crumbCode.length == 2
                            ? () => context.push('/chapter/$crumbCode')
                            : () => context.push('/code/$crumbCode');
                    return Padding(
                      padding: EdgeInsets.only(left: indent, top: 4),
                      child: InkWell(
                        onTap: onTap,
                        borderRadius: BorderRadius.circular(4),
                        child: Row(
                          children: [
                            if (e.key > 0)
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Text('\u2514 ',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            Text(
                              '$crumbCode: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: onTap != null
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                e.value.value,
                                style: onTap != null
                                    ? TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Children
          if (children.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.subCategories,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...children.map((childCode) {
                      final childTitle =
                          dataService.getTitle(childCode) ?? '';
                      return ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Text(childCode,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).colorScheme.primary,
                            )),
                        title: Text(childTitle),
                        trailing: const Icon(Icons.chevron_right,
                            size: 20),
                        onTap: () =>
                            context.push('/code/$childCode'),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],

          // Qualifier builder
          const SizedBox(height: 16),
          QualifierBuilder(
            key: ValueKey('qb_$code'),
            code: code,
            domain: domain,
            qualifiers: qualifiers,
            natureQualifiers:
                domain == 's' ? dataService.structureNatureQualifiers : const {},
            locationQualifiers: domain == 's'
                ? dataService.structureLocationQualifiers
                : const {},
            initialQualifier: ref.read(qualifierMemoryProvider).get(code),
            onQualifierChanged: (suffix) =>
                ref.read(qualifierMemoryProvider).set(code, suffix),
            onAddToCollection: (qualifiedCode, qualifier) =>
                showAddToCollectionSheet(context, ref,
                    code: code, qualifier: qualifier),
          ),

          // Static qualifier scale
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    domain == 'e'
                        ? l10n.qualifierScaleEnvironment
                        : l10n.qualifierScale,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (domain == 'e')
                    ..._buildEnvironmentalScale(context, qualifiers)
                  else
                    ...qualifiers.entries.map((q) => Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 24,
                                child: Text(
                                  q.key,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(q.value)),
                            ],
                          ),
                        )),
                ],
              ),
            ),
          ),
        ],
      ),
        ),
      ),
    );
  }

  List<Widget> _buildEnvironmentalScale(
      BuildContext context, Map<String, String> qualifiers) {
    final barriers = qualifiers.entries
        .where((e) => e.key.startsWith('barrier_'))
        .toList();
    final facilitators = qualifiers.entries
        .where((e) => e.key.startsWith('facilitator_'))
        .toList();

    return [
      Text('Barrieren (.)',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.error)),
      const SizedBox(height: 4),
      ...barriers.map((q) {
        final level = q.key.replaceAll('barrier_', '');
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 24,
                  child: Text('.$level',
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(width: 8),
              Expanded(child: Text(q.value)),
            ],
          ),
        );
      }),
      const SizedBox(height: 12),
      Text('Förderfaktoren (+)',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary)),
      const SizedBox(height: 4),
      ...facilitators.map((q) {
        final level = q.key.replaceAll('facilitator_', '');
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 24,
                  child: Text('+$level',
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(width: 8),
              Expanded(child: Text(q.value)),
            ],
          ),
        );
      }),
    ];
  }
}
