# Offene Punkte

## Für 1.5.1 (beide Stores)

- [ ] **PDF: Sonderzeichen als leere Kästchen.** `lib/services/pdf_export_service.dart`
  nutzt die eingebaute Helvetica des `pdf`-Pakets (nur Latin-1). Dadurch fehlen
  `–` (U+2013, z. B. im Titel „d450 – Gehen") und `•` (U+2022, Inkl./Exkl.-Listen).
  Betrifft alle Plattformen und alle PDF-Exporte (Detailseite, Sammlungen,
  Favoriten), seit mindestens 1.4. Gefunden im Android-Test von 1.5.0 (2026-10-25).
  Fix: freie TTF (z. B. Noto Sans Regular + Bold) als Asset bündeln und in beiden
  PDF-Funktionen per `pw.ThemeData.withFont(...)` setzen — kein Netzwerkabruf
  (App bleibt 100 % offline).
- [ ] Nach dem Fix: Version auf 1.5.1 (pubspec + `settings_page.dart`), Android
  und iOS gemeinsam veröffentlichen.

## Noch ungetestet auf Android (1.5.0)

- [ ] JSON-Import der Sammlungen (file_picker 12, `readAsBytes`)
- [ ] Mehrstelliger Qualifier-Builder (d-/s-Codes)
