import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../l10n/app_localizations.dart';

/// Die neun Lebensbereiche der Bedarfsermittlung in der Eingliederungshilfe
/// (§ 118 SGB IX) entsprechen den Kapiteln d1–d9 der ICF-Komponente
/// „Aktivitäten und Partizipation". Diese Seite bietet den direkten Einstieg
/// über diese Gliederung.
class LifeAreasPage extends ConsumerWidget {
  const LifeAreasPage({super.key});

  static const _chapters = [
    'd1',
    'd2',
    'd3',
    'd4',
    'd5',
    'd6',
    'd7',
    'd8',
    'd9',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dataService = ref.watch(icfDataServiceProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.lifeAreasTitle)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: EdgeInsets.fromLTRB(
                16, 16, 16, 16 + MediaQuery.paddingOf(context).bottom),
            children: [
              Card(
                color: theme.colorScheme.primaryContainer
                    .withValues(alpha: 0.4),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    l10n.lifeAreasIntro,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              for (var i = 0; i < _chapters.length; i++)
                _buildAreaCard(context, l10n, theme, dataService.codes,
                    index: i),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAreaCard(BuildContext context, AppLocalizations l10n,
      ThemeData theme, Map<String, String> codes,
      {required int index}) {
    final chapter = _chapters[index];
    final title = codes[chapter] ?? chapter;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
          child: Text(
            '${index + 1}',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(chapter),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/chapter/$chapter'),
      ),
    );
  }
}
