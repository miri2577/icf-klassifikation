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
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOnboarding());
  }

  @override
  void dispose() {
    _searchController.dispose();
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedIndex = ref.watch(selectedDomainIndexProvider);
    final dataService = ref.watch(icfDataServiceProvider);

    final domainNames = [
      l10n.bodyFunctions,
      l10n.bodyStructures,
      l10n.activitiesParticipation,
      l10n.environmentalFactors,
    ];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: searchQuery.isNotEmpty
            ? const SearchResults()
            : _buildDomainView(
                context, selectedIndex, domainNames, dataService),
        appBar: AppBar(
          title: Text(l10n.appTitle),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu_book),
              tooltip: l10n.guideTitle,
              onPressed: () => context.push('/guide'),
            ),
            IconButton(
              icon: const Icon(Icons.history),
              tooltip: l10n.recentlyViewed,
              onPressed: () => context.push('/history'),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              tooltip: l10n.favorites,
              onPressed: () => context.push('/favorites'),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: l10n.settings,
              onPressed: () => context.push('/settings'),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: SearchBar(
                controller: _searchController,
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
        bottomNavigationBar: searchQuery.isNotEmpty
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

  Widget _buildDomainView(
    BuildContext context,
    int selectedIndex,
    List<String> domainNames,
    dynamic dataService,
  ) {
    final domainKey = DomainUtils.keys[selectedIndex];
    final color = DomainUtils.colors[selectedIndex];
    final chapters = dataService.getChapters(domainKey);

    return ListView(
      padding: const EdgeInsets.all(16),
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
                          '${domainKey.toUpperCase()} \u2013 ${domainNames[selectedIndex]}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${chapters.length} ${AppLocalizations.of(context)!.chapters}',
                          style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
