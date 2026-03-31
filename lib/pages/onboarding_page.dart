import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../utils/domain_utils.dart';
import '../l10n/app_localizations.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 4) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _complete() {
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setBool('onboarding_completed', true);
    prefs.setBool('privacy_accepted', true);
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isLastPage = _currentPage == 4;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: _complete,
                  child: Text(l10n.onboardingSkip),
                ),
              ),
            ),
            // Page content
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  _WelcomePage(l10n: l10n, theme: theme),
                  _DomainsPage(l10n: l10n, theme: theme),
                  _SearchPage(l10n: l10n, theme: theme),
                  _QualifierPage(l10n: l10n, theme: theme),
                  _FavoritesPage(l10n: l10n, theme: theme),
                ],
              ),
            ),
            // Dot indicators
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (i) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == i ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == i
                          ? theme.colorScheme.primary
                          : theme.colorScheme.primary.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: isLastPage ? _complete : _nextPage,
                  child: Text(
                    isLastPage
                        ? l10n.onboardingStart
                        : l10n.onboardingNext,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomePage extends StatelessWidget {
  final AppLocalizations l10n;
  final ThemeData theme;

  const _WelcomePage({required this.l10n, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/icon/app_icon.png',
              width: 120,
              height: 120,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            l10n.onboardingWelcomeTitle,
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.onboardingWelcomeText,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _DomainsPage extends StatelessWidget {
  final AppLocalizations l10n;
  final ThemeData theme;

  const _DomainsPage({required this.l10n, required this.theme});

  @override
  Widget build(BuildContext context) {
    final domainNames = [
      l10n.bodyFunctions,
      l10n.bodyStructures,
      l10n.activitiesParticipation,
      l10n.environmentalFactors,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category_outlined,
              size: 64, color: theme.colorScheme.primary),
          const SizedBox(height: 24),
          Text(
            l10n.onboardingDomainsTitle,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingDomainsText,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ...List.generate(4, (i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Card(
                color: DomainUtils.colors[i].withValues(alpha: 0.1),
                child: ListTile(
                  leading: Icon(DomainUtils.icons[i],
                      color: DomainUtils.colors[i]),
                  title: Text(
                    '${DomainUtils.keys[i].toUpperCase()} \u2013 ${domainNames[i]}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  dense: true,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _SearchPage extends StatelessWidget {
  final AppLocalizations l10n;
  final ThemeData theme;

  const _SearchPage({required this.l10n, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: theme.colorScheme.primary),
          const SizedBox(height: 24),
          Text(
            l10n.onboardingSearchTitle,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingSearchText,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.touch_app_outlined,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(child: Text(l10n.onboardingSearchTip1)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.info_outline,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(child: Text(l10n.onboardingSearchTip2)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QualifierPage extends StatelessWidget {
  final AppLocalizations l10n;
  final ThemeData theme;

  const _QualifierPage({required this.l10n, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.tune, size: 64, color: theme.colorScheme.primary),
          const SizedBox(height: 24),
          Text(
            l10n.onboardingQualifierTitle,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingQualifierText,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.onboardingQualifierExample,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.onboardingQualifierExampleDesc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoritesPage extends StatelessWidget {
  final AppLocalizations l10n;
  final ThemeData theme;

  const _FavoritesPage({required this.l10n, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_outline,
              size: 64, color: theme.colorScheme.primary),
          const SizedBox(height: 24),
          Text(
            l10n.onboardingFavoritesTitle,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingFavoritesText,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(child: Text(l10n.onboardingFavoritesTip1)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.picture_as_pdf,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(child: Text(l10n.onboardingFavoritesTip2)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.privacy_tip_outlined,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(child: Text(l10n.onboardingPrivacyNote)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
