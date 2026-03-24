# ICF App — Verbesserungsplan V2

## Kritisch

- [x] 1. Hardcoded deutsche Strings in `chapter_page.dart` lokalisieren
- [x] 2. Domain-Farben in shared Utility extrahieren (`DomainUtils`)
- [x] 3. Dead Code entfernen (`icf_codes.dart`, `icf_details.dart`)
- [x] 4. Fehlende Detailbeschreibungen für 448 Codes ergänzt (jetzt 1417/1417)
- [x] 5. Sprach-Fallback: DataService fällt graceful auf DE zurück

## Empfehlenswert

- [x] 6. Cross-References: ICF-Codes in Inkl./Exkl. sind tippbare Links (`CodeLinkText`)
- [x] 7. Suchfilter nach Domain (FilterChips B/S/D/E)
- [x] 8. Responsive Design: `maxWidth: 800` auf Detail-Seite
- [x] 9. Datenschutz-Hinweis beim ersten App-Start
- [x] 10. Qualifier-Builder: Barriere vs. Förderfaktor per SegmentedButton getrennt
