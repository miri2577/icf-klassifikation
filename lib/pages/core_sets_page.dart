import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/icf_providers.dart';
import '../services/icf_data_service.dart';
import '../utils/domain_utils.dart';
import '../l10n/app_localizations.dart';

/// Übersicht der mitgelieferten ICF Core Sets — kuratierte, publizierte
/// Kategorienlisten als Einstieg in die Dokumentation. Kein Ersatz für die
/// individuelle Bedarfsermittlung (dort zählen die konkreten Kontextfaktoren).
class CoreSetsPage extends ConsumerWidget {
  const CoreSetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dataService = ref.watch(icfDataServiceProvider);
    final theme = Theme.of(context);
    final sets = dataService.coreSets;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.coreSetsTitle)),
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
                    l10n.coreSetsIntro,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              for (final set in sets)
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          theme.colorScheme.primary.withValues(alpha: 0.15),
                      child: Text(
                        '${set.codes.length}',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    title: Text(set.name),
                    subtitle: Text(set.description,
                        maxLines: 3, overflow: TextOverflow.ellipsis),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/coresets/${set.id}'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Detailansicht eines Core Sets: alle Kategorien mit Titel aus dem
/// Datenbestand, tappbar zur Code-Detailseite.
class CoreSetDetailPage extends ConsumerWidget {
  final String setId;

  const CoreSetDetailPage({super.key, required this.setId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dataService = ref.watch(icfDataServiceProvider);
    final theme = Theme.of(context);
    final set = dataService.coreSets.where((s) => s.id == setId).firstOrNull;

    if (set == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.coreSetsTitle)),
        body: Center(child: Text(setId)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(set.name)),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(set.description,
                          style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      Text(
                        '${l10n.coreSetSource}: ${set.source}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              for (final code in set.codes)
                _buildCodeCard(context, theme, dataService, code),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeCard(BuildContext context, ThemeData theme,
      IcfDataService dataService, String code) {
    final title = dataService.codes[code] ?? '';
    final domain = code[0];
    final color = DomainUtils.colorFor(domain);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Text(
            domain.toUpperCase(),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(code,
            style: const TextStyle(fontFamily: 'monospace')),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/code/$code'),
      ),
    );
  }
}
