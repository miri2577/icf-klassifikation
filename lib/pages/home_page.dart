import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../utils/domain_utils.dart';
import '../widgets/chapter_card.dart';
import '../widgets/search_results.dart';
import '../l10n/app_localizations.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchFocus.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOnboarding());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _checkOnboarding() {
    final prefs = ref.read(sharedPreferencesProvider);
    if (prefs.getBool('onboarding_completed') != true) {
      context.go('/onboarding');
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchQueryProvider.notifier).state = value;
    });
  }

  void _applyQuery(String query) {
    _searchController.text = query;
    ref.read(searchQueryProvider.notifier).state = query;
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedIndex = ref.watch(selectedDomainIndexProvider);
    final dataService = ref.watch(icfDataServiceProvider);
    final searchHistory = ref.watch(searchHistoryProvider);
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    final domainNames = [
      l10n.bodyFunctions,
      l10n.bodyStructures,
      l10n.activitiesParticipation,
      l10n.environmentalFactors,
    ];

    final showRecentSearches = searchQuery.isEmpty &&
        _searchFocus.hasFocus &&
        searchHistory.isNotEmpty;

    final Widget content = searchQuery.isNotEmpty
        ? const SearchResults()
        : showRecentSearches
            ? _buildRecentSearches(context, searchHistory)
            : _buildDomainView(
                context, selectedIndex, domainNames, dataService);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: isWide
            ? Row(
                children: [
                  NavigationRail(
                    selectedIndex: selectedIndex,
                    labelType: NavigationRailLabelType.all,
                    onDestinationSelected: (i) {
                      ref
                          .read(selectedDomainIndexProvider.notifier)
                          .state = i;
                      FocusScope.of(context).unfocus();
                    },
                    destinations: List.generate(
                      4,
                      (i) => NavigationRailDestination(
                        icon: Icon(DomainUtils.icons[i]),
                        label: Text(DomainUtils.keys[i].toUpperCase()),
                      ),
                    ),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(child: content),
                ],
              )
            : content,
        appBar: AppBar(
          title: Text(l10n.appTitle),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.folder_outlined),
              tooltip: l10n.collections,
              onPressed: () => context.push('/collections'),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              tooltip: l10n.favorites,
              onPressed: () => context.push('/favorites'),
            ),
            PopupMenuButton<String>(
              tooltip: l10n.moreMenu,
              onSelected: (route) => context.push(route),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: '/guide',
                  child: ListTile(
                    leading: const Icon(Icons.menu_book),
                    title: Text(l10n.guideTitle),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: '/history',
                  child: ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(l10n.recentlyViewed),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                PopupMenuItem(
                  value: '/settings',
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(l10n.settings),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: SearchBar(
                controller: _searchController,
                focusNode: _searchFocus,
                hintText: l10n.searchHint,
                leading: const Icon(Icons.search),
                trailing: [
                  if (searchQuery.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(searchQueryProvider.notifier).state = '';
                        FocusScope.of(context).unfocus();
                      },
                    ),
                ],
                onChanged: _onSearchChanged,
              ),
            ),
          ),
        ),
        bottomNavigationBar: searchQuery.isNotEmpty || isWide
            ? null
            : NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: (i) {
                  ref.read(selectedDomainIndexProvider.notifier).state = i;
                  FocusScope.of(context).unfocus();
                },
                destinations: List.generate(
                  4,
                  (i) => NavigationDestination(
                    icon: Icon(DomainUtils.icons[i]),
                    label: DomainUtils.keys[i].toUpperCase(),
                    tooltip: domainNames[i],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildRecentSearches(BuildContext context, List<String> history) {
    final l10n = AppLocalizations.of(context)!;
    return ListView(
      padding: EdgeInsets.fromLTRB(
          8, 8, 8, 8 + MediaQuery.paddingOf(context).bottom),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.recentSearches,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () =>
                    ref.read(searchHistoryProvider.notifier).clear(),
                child: Text(l10n.clearSearchHistory),
              ),
            ],
          ),
        ),
        ...history.map((query) => ListTile(
              leading: const Icon(Icons.history),
              title: Text(query),
              onTap: () => _applyQuery(query),
            )),
      ],
    );
  }

  Widget _buildDomainView(
    BuildContext context,
    int selectedIndex,
    List<String> domainNames,
    dynamic dataService,
  ) {
    final domainKey = DomainUtils.keys[selectedIndex];
    final color = DomainUtils.colors[selectedIndex];
    final chapters = dataService.getChapters(domainKey);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: ListView(
          padding: EdgeInsets.fromLTRB(
              16, 16, 16, 16 + MediaQuery.paddingOf(context).bottom),
          children: [
            Semantics(
              header: true,
              child: Card(
                color: color.withValues(alpha: 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(DomainUtils.icons[selectedIndex],
                          size: 48, color: color),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${domainKey.toUpperCase()} – ${domainNames[selectedIndex]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${chapters.length} ${AppLocalizations.of(context)!.chapters}',
                              style:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ...chapters.map((chapterCode) {
              final title = dataService.getTitle(chapterCode) ?? '';
              return ChapterCard(
                code: chapterCode,
                title: title,
                color: color,
                onTap: () => context.push('/chapter/$chapterCode'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
