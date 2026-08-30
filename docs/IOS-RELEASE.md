# iOS-Release — Anleitung für den Mac

Stand: 2026-08-30, Version 1.4.0+5. Alles Windows-seitig Vorbereitbare ist
erledigt und gepusht:

- Bundle-ID: `cloud.eingliederungshilfe.icf` (in Xcode-Projekt gesetzt)
- Display-Name „ICF Klassifikation", `ITSAppUsesNonExemptEncryption=false`
- iOS-App-Icons ohne Alpha-Kanal generiert (App-Store-Anforderung)
- Deep-Link-Schema `icf://` in Info.plist (CFBundleURLTypes) + FlutterDeepLinkingEnabled
- Deployment Target: iOS 13.0

## 1. Mac einrichten

```bash
# Xcode aus dem Mac App Store installieren, dann:
sudo xcode-select -s /Applications/Xcode.app
sudo xcodebuild -license accept
xcodebuild -runFirstLaunch

# CocoaPods
brew install cocoapods        # oder: sudo gem install cocoapods

# Flutter (stable)
brew install --cask flutter   # oder Download von flutter.dev
flutter doctor                # alles für iOS muss grün sein

# Claude Code
npm install -g @anthropic-ai/claude-code   # oder: brew install claude-code
```

## 2. Projekt holen und starten

```bash
git clone https://github.com/miri2577/icf-klassifikation.git
cd icf-klassifikation
flutter pub get
cd ios && pod install && cd ..
open ios/Runner.xcworkspace    # WICHTIG: .xcworkspace, nicht .xcodeproj
```

Claude Code im Projektordner starten (`claude`) — der Projektkontext wird
über CLAUDE.md automatisch geladen. Erster Prompt z.B.:
„Lies docs/IOS-RELEASE.md und führe mich durch den iOS-Release."

## 3. Signing (einmalig)

In Xcode: Target **Runner** → **Signing & Capabilities**:
1. „Automatically manage signing" aktivieren
2. **Team**: deinen Apple-Developer-Account auswählen (ggf. vorher unter
   Xcode → Settings → Accounts mit der Apple-ID anmelden)
3. Xcode registriert die Bundle-ID automatisch im Developer-Portal

Kein Keystore wie bei Android — Zertifikate verwaltet Xcode/Apple.

## 4. Lokal testen

```bash
flutter run                    # Simulator oder angeschlossenes iPhone
```

Prüfen: Suche (auch „rollstuhl"), Sammlungen inkl. PDF/CSV-Export
(iOS-Share-Sheet), Qualifier-Builder, Dark Mode, iPad-Layout
(NavigationRail ab 900 px Breite), Deep Link:
`xcrun simctl openurl booted "icf://open/code/b280"`.

## 5. App Store Connect vorbereiten

1. https://appstoreconnect.apple.com → **Meine Apps** → **+** → **Neue App**
2. Plattform iOS, Name „ICF Klassifikation", Sprache Deutsch,
   Bundle-ID `cloud.eingliederungshilfe.icf`, SKU frei (z.B. `icf-app`)
3. **App-Datenschutz**: „Daten werden nicht erfasst" — stimmt wirklich
   (keine Netzwerkzugriffe, keine Tracker, alles lokal)
4. Assets aus dem Play-Store-Backup wiederverwenden:
   `Downloads/HiDrive-ICF-Keystore-BACKUP (1)/` enthält Icon 512px,
   Feature-Grafik und Screenshots (Screenshots müssen für iOS neu erstellt
   werden: 6,7"-iPhone Pflicht, iPad 13" falls iPad unterstützt bleibt —
   am schnellsten im Simulator mit Cmd+S)
5. Beschreibung/Keywords vom Play-Eintrag übernehmen

## 6. Build und Upload

```bash
flutter build ipa --release
```

Ergebnis: `build/ios/ipa/icf_app.ipa`. Upload wahlweise:
- **Transporter-App** (Mac App Store): .ipa reinziehen → Senden, oder
- Xcode: Window → Organizer → Archive → „Distribute App"

Danach in App Store Connect: Build dem Release zuordnen, Versionshinweise
eintragen (Texte siehe Play-Release 1.4.0), **Zur Prüfung einreichen**.

## 7. Review-Hinweise (App-spezifisch)

- **Medizin-Abgrenzung**: Im Review-Notizfeld klarstellen: reines
  Nachschlagewerk der WHO-Klassifikation für Fachkräfte, kein Medizinprodukt,
  keine Diagnose-/Therapiefunktion (die App enthält dazu bereits einen
  Hinweistext unter Einstellungen → Impressum).
- **Urheberrecht**: ICF © WHO, deutsche Fassung BfArM — Quellenangabe ist in
  der App enthalten; ggf. im Review-Feld erwähnen.
- In-App-Review nutzt SKStoreReviewController (in_app_review-Plugin) — konform.
- Guideline 4.2 (Mindestfunktionalität) ist mit Sammlungen, Qualifier-Builder,
  Suche und Export gut abgedeckt.

## Offene Punkte für die Mac-Session

- [ ] `pod install` erfolgreich? (erster Lauf erzeugt Podfile.lock → committen)
- [ ] iPad-Layout einmal real prüfen (NavigationRail)
- [ ] iOS-Screenshots erstellen
- [ ] Launch Screen prüfen (LaunchScreen.storyboard ist Flutter-Standard, weiß)
