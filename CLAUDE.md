# ICF Klassifikation — Projektkontext

Flutter-App: Nachschlagewerk der WHO-ICF-Klassifikation (1417 Codes, de/en) für
Fachkräfte in Eingliederungshilfe/Reha. Im Google Play Store veröffentlicht
(com.icf.icf_app), iOS-Release in Vorbereitung — **siehe `docs/IOS-RELEASE.md`**.

## Architektur

- **State:** Riverpod (`lib/providers/icf_providers.dart` — alle Provider zentral)
- **Navigation:** go_router (`lib/router.dart`); Deep Links per Custom-Schema
  `icf://open/code/<code>` (Android: Manifest-Intent-Filter; iOS: CFBundleURLTypes)
- **Daten:** JSON-Assets in `assets/data/` (Codes, Details, Synonyme; je de + en,
  Fallback auf de). Kein Backend, keine Netzwerkzugriffe, keine Permissions —
  die App ist bewusst 100 % offline (Datenschutz-Verkaufsargument!).
- **Suche:** `IcfDataService.search()` — Relevanz-Ranking (Code > Titel-Wortanfang >
  Titel > Synonym > Detailtext), Umlaut-Normalisierung (ä→ae), Synonym-Lexikon
  `assets/data/icf_synonyms*.json` (jeder Code testvalidiert, s. `test/synonyms_test.dart`)
- **Sammlungen:** `CollectionsService` (SharedPreferences/JSON) — Codes mit
  Qualifier + Notiz, PDF/CSV-Export, JSON-Export/Import
- **l10n:** ARB in `lib/l10n/` (de = Template), `flutter gen-l10n` nach Änderungen

## Konventionen & Fallen

- Version in `pubspec.yaml` UND `lib/pages/settings_page.dart` (2 Stellen) pflegen
- Listen mit explizitem `padding:` brauchen `MediaQuery.paddingOf(context).bottom`
  im unteren Padding (Edge-to-Edge / Gestenleiste)
- App-Icons: Quelle `assets/icon/`, generiert mit `dart run flutter_launcher_icons`
  (Android adaptive+monochrome; iOS ohne Alpha via `remove_alpha_ios`)
- Splash-Bilder sind WebP (bewusst — PNGs waren 12 MB; nicht durch große PNGs ersetzen)
- Android-Signierung: `android/key.properties` (gitignored, liegt NICHT im Repo);
  ohne key.properties fällt der Release-Build auf Debug-Signierung zurück
- Nie ohne ausdrückliche Erlaubnis des Maintainers pushen

## Checks vor jedem Commit

```
flutter analyze   # muss 0 Issues sein
flutter test      # 29+ Tests, müssen grün sein
```
