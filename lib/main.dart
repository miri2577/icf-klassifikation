import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/icf_providers.dart';
import 'router.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const IcfApp(),
    ),
  );
}

class IcfApp extends ConsumerWidget {
  const IcfApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataLoaded = ref.watch(icfDataLoadedProvider);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'ICF Klassifikation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF009CDE),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: const Color(0xFF009CDE),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      routerConfig: appRouter,
      builder: (context, child) {
        return dataLoaded.when(
          data: (_) => child!,
          loading: () => const Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('ICF Daten werden geladen...'),
                ],
              ),
            ),
          ),
          error: (err, _) => Scaffold(
            body: Center(
              child: Text('Fehler beim Laden: $err'),
            ),
          ),
        );
      },
    );
  }
}
