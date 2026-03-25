# ICF Klassifikation

Nachschlagewerk für die Internationale Klassifikation der Funktionsfähigkeit, Behinderung und Gesundheit (ICF) der Weltgesundheitsorganisation (WHO).

**[Web-App starten](https://eingliederungshilfe.cloud/icf/)** | **[Website](https://eingliederungshilfe.cloud)** | **[Download (macOS)](https://github.com/miri2577/icf-klassifikation/releases)**

## Features

- **1.417 ICF-Codes** mit Beschreibungen, Inklusionen und Exklusionen
- **Offizielle BfArM-Daten** (Deutsche Fassung 2005)
- **Suche** mit Domain-Filter (B/S/D/E)
- **Interaktiver Qualifier-Builder** — Codes wie `b710.2` oder `e120+3` zusammenbauen
- **Umweltfaktoren**: Barriere vs. Förderfaktor getrennt kodieren
- **Favoriten & Verlauf** — persistent auf dem Gerät
- **PDF-Export** der Favoriten-Zusammenstellung
- **Cross-References** — ICF-Codes in Inkl./Exkl. als tippbare Links
- **ICF-Leitfaden** mit Erklärung und 3 Praxisbeispielen (Orthopädie, Psychiatrie, Neurologie)
- **Deutsch & Englisch**
- **Hell/Dunkel/System-Modus**
- **100% Offline** — keine Internetverbindung nötig
- **Datenschutz** — keine Datenerhebung, kein Tracking, DSGVO-konform

## Plattformen

| Plattform | Status |
|-----------|--------|
| iOS | Verfügbar (App Store in Kürze) |
| Android | Verfügbar (Google Play in Kürze) |
| macOS | [Download](https://github.com/miri2577/icf-klassifikation/releases) |
| Web | [Web-App](https://eingliederungshilfe.cloud/icf/) |
| Windows | Build verfügbar |
| Linux | Build verfügbar |

## Screenshots

*Demnächst*

## Selbst bauen

```bash
# Voraussetzungen: Flutter SDK (>=3.9)
git clone https://github.com/miri2577/icf-klassifikation.git
cd icf-klassifikation
flutter pub get
flutter run
```

### Release-Builds

```bash
flutter build macos --release
flutter build ios --release
flutter build apk --release
flutter build web --release --base-href "/icf/"
```

## Datenquellen

- **ICF**: World Health Organization (WHO)
- **Deutsche Fassung**: Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM), ehemals DIMDI
- **Version**: ICF 2005

## Rechtliches

- **Kein Medizinprodukt** im Sinne der EU-Verordnung 2017/745 (MDR)
- Die App ersetzt keine professionelle medizinische Beratung
- [Impressum](https://eingliederungshilfe.cloud/impressum.html) | [Datenschutz](https://eingliederungshilfe.cloud/datenschutz.html)

## Lizenz

Die ICF ist geistiges Eigentum der WHO. Die deutsche Übersetzung wurde vom BfArM veröffentlicht.

## Kontakt

Mirko Richter — [mirko.richter@eingliederungshilfe.cloud](mailto:mirko.richter@eingliederungshilfe.cloud)

---

# ICF Classification (English)

Reference app for the International Classification of Functioning, Disability and Health (ICF) by the World Health Organization (WHO).

**[Launch Web App](https://eingliederungshilfe.cloud/icf/)** | **[Website](https://eingliederungshilfe.cloud)** | **[Download (macOS)](https://github.com/miri2577/icf-klassifikation/releases)**

## Features

- **1,417 ICF codes** with descriptions, inclusions and exclusions
- **Official BfArM data** (German version 2005)
- **Search** with domain filter (B/S/D/E)
- **Interactive Qualifier Builder** — build codes like `b710.2` or `e120+3`
- **Environmental factors**: Barrier vs. facilitator coding separated
- **Favorites & History** — persistent on device
- **PDF export** of favorites compilation
- **Cross-references** — ICF codes in incl./excl. as tappable links
- **ICF Guide** with explanation and 3 practical examples (orthopaedics, psychiatry, neurology)
- **German & English**
- **Light/Dark/System mode**
- **100% Offline** — no internet connection required
- **Privacy** — no data collection, no tracking, GDPR compliant

## Platforms

| Platform | Status |
|----------|--------|
| iOS | Available (App Store coming soon) |
| Android | Available (Google Play coming soon) |
| macOS | [Download](https://github.com/miri2577/icf-klassifikation/releases) |
| Web | [Web App](https://eingliederungshilfe.cloud/icf/) |
| Windows | Build available |
| Linux | Build available |

## Build from source

```bash
# Prerequisites: Flutter SDK (>=3.9)
git clone https://github.com/miri2577/icf-klassifikation.git
cd icf-klassifikation
flutter pub get
flutter run
```

## Data sources

- **ICF**: World Health Organization (WHO)
- **German version**: Federal Institute for Drugs and Medical Devices (BfArM), formerly DIMDI

## Legal

- **Not a medical device** under EU Regulation 2017/745 (MDR)
- This app does not replace professional medical advice
- [Legal Notice](https://eingliederungshilfe.cloud/impressum.html) | [Privacy Policy](https://eingliederungshilfe.cloud/datenschutz.html)

## Contact

Mirko Richter — [mirko.richter@eingliederungshilfe.cloud](mailto:mirko.richter@eingliederungshilfe.cloud)
