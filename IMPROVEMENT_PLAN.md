# ICF App — Verbesserungsplan

## Priorität 1 — Quick Wins

- [x] 1. `_fixUmlauts()` entfernen (toter Code)
- [x] 2. Search-Debouncing einbauen (300ms Timer)
- [x] 3. `main.dart` aufteilen: `pages/`, `widgets/`, `models/`
- [x] 4. Copy-to-Clipboard für ICF-Codes
- [x] 5. Share-Button auf der Detail-Seite

## Priorität 2 — Wichtige Features

- [x] 6. Favoriten-System mit `shared_preferences`
- [x] 7. Zuletzt angesehen — History der letzten 20 Codes
- [x] 8. Daten als JSON-Asset statt Dart-Code — bessere Wartbarkeit, lazy loading
- [x] 9. Such-Optimierung: Index-Map vorberechnen statt lineare Suche
- [x] 10. GoRouter für deklarative Navigation + Deep Links (Web)

## Priorität 3 — Qualität & Professionalität

- [x] 11. Unit-Tests für IcfDetail, FavoritesService, HistoryService
- [x] 12. Widget-Tests für QualifierBuilder
- [x] 13. State Management mit Riverpod
- [x] 14. Custom App-Icon & Splash Screen
- [x] 15. Accessibility-Audit (Semantics Labels)

## Priorität 4 — Nice-to-Have

- [x] 16. Suchvorschläge / Autocomplete (integriert in Search)
- [x] 17. Qualifier-Eingabe: interaktiver Qualifier-Builder (z.B. `b110.3`)
- [x] 18. PDF-Export einer Code-Zusammenstellung (Favoriten-Export)
- [x] 19. Mehrsprachigkeit (i18n) — Englisch + Deutsch
- [x] 20. Animierte Übergänge zwischen Seiten (Slide + Fade Transitions)
