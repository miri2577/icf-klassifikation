import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/icf_providers.dart';
import '../l10n/app_localizations.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          // --- Darstellung ---
          _SectionHeader(title: l10n.appearance),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(l10n.themeMode),
            subtitle: Text(_themeModeLabel(themeMode, l10n)),
            trailing: SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: const Icon(Icons.light_mode, size: 18),
                  tooltip: l10n.lightMode,
                ),
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: const Icon(Icons.settings_brightness, size: 18),
                  tooltip: l10n.systemMode,
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: const Icon(Icons.dark_mode, size: 18),
                  tooltip: l10n.darkMode,
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (modes) {
                ref
                    .read(themeModeProvider.notifier)
                    .setThemeMode(modes.first);
              },
            ),
          ),

          const Divider(),

          // --- Sprache ---
          _SectionHeader(title: l10n.language),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.language),
            trailing: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'de', label: Text('DE')),
                ButtonSegment(value: 'en', label: Text('EN')),
              ],
              selected: {locale.languageCode},
              onSelectionChanged: (values) {
                ref
                    .read(localeProvider.notifier)
                    .setLocale(Locale(values.first));
              },
            ),
          ),

          const Divider(),

          // --- Daten ---
          _SectionHeader(title: l10n.dataSection),
          ListTile(
            leading: const Icon(Icons.upload_outlined),
            title: Text(l10n.exportData),
            onTap: () => _exportData(ref),
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: Text(l10n.importData),
            onTap: () => _importData(context, ref, l10n),
          ),

          const Divider(),

          // --- Über ---
          _SectionHeader(title: l10n.about),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.impressum),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/impressum'),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l10n.privacyPolicyTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/privacy-policy'),
          ),
          ListTile(
            leading: const Icon(Icons.gavel_outlined),
            title: Text(l10n.termsOfServiceTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/terms-of-service'),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l10n.licenses),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: 'ICF Klassifikation',
                applicationVersion: '1.5.0',
                applicationIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/icon/app_icon.png',
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
                applicationLegalese:
                    '\u00a9 2024-2026. ICF \u00a9 WHO.\n'
                    'Deutsche Fassung: BfArM/DIMDI.',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: Text(l10n.version),
            subtitle: const Text('1.5.0'),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Future<void> _exportData(WidgetRef ref) async {
    final service = ref.read(collectionsServiceProvider);
    final favorites = ref.read(favoritesProvider);
    final jsonString = service.exportJson(favorites);
    final dir = await getTemporaryDirectory();
    final now = DateTime.now();
    final stamp =
        '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
    final file = File('${dir.path}/icf_export_$stamp.json');
    await file.writeAsString(jsonString);
    await Share.shareXFiles(
        [XFile(file.path, mimeType: 'application/json')]);
  }

  Future<void> _importData(
      BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final messenger = ScaffoldMessenger.of(context);
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: true,
    );
    final data = result?.files.firstOrNull?.bytes;
    if (data == null) return;
    try {
      final service = ref.read(collectionsServiceProvider);
      final (count, favorites) =
          await service.importJson(utf8.decode(data));
      // Favoriten zusammenführen
      final notifier = ref.read(favoritesProvider.notifier);
      for (final code in favorites) {
        if (!ref.read(favoritesProvider).contains(code)) {
          await notifier.toggle(code);
        }
      }
      ref.read(collectionsProvider.notifier).reload();
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.importSuccess(count))),
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.importError)),
      );
    }
  }

  String _themeModeLabel(ThemeMode mode, AppLocalizations l10n) {
    switch (mode) {
      case ThemeMode.light:
        return l10n.lightMode;
      case ThemeMode.dark:
        return l10n.darkMode;
      case ThemeMode.system:
        return l10n.systemMode;
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
