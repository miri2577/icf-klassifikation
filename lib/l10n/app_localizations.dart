import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In de, this message translates to:
  /// **'ICF Klassifikation'**
  String get appTitle;

  /// No description provided for @searchHint.
  ///
  /// In de, this message translates to:
  /// **'Code oder Begriff suchen...'**
  String get searchHint;

  /// No description provided for @noResults.
  ///
  /// In de, this message translates to:
  /// **'Keine Ergebnisse gefunden'**
  String get noResults;

  /// No description provided for @searchResults.
  ///
  /// In de, this message translates to:
  /// **'Suchergebnisse'**
  String get searchResults;

  /// No description provided for @bodyFunctions.
  ///
  /// In de, this message translates to:
  /// **'Körperfunktionen'**
  String get bodyFunctions;

  /// No description provided for @bodyStructures.
  ///
  /// In de, this message translates to:
  /// **'Körperstrukturen'**
  String get bodyStructures;

  /// No description provided for @activitiesParticipation.
  ///
  /// In de, this message translates to:
  /// **'Aktivitäten & Partizipation'**
  String get activitiesParticipation;

  /// No description provided for @environmentalFactors.
  ///
  /// In de, this message translates to:
  /// **'Umweltfaktoren'**
  String get environmentalFactors;

  /// No description provided for @chapters.
  ///
  /// In de, this message translates to:
  /// **'Kapitel'**
  String get chapters;

  /// No description provided for @categories.
  ///
  /// In de, this message translates to:
  /// **'Kategorien'**
  String get categories;

  /// No description provided for @subCategories.
  ///
  /// In de, this message translates to:
  /// **'Unterkategorien'**
  String get subCategories;

  /// No description provided for @description.
  ///
  /// In de, this message translates to:
  /// **'Beschreibung'**
  String get description;

  /// No description provided for @inclusions.
  ///
  /// In de, this message translates to:
  /// **'Inkl.'**
  String get inclusions;

  /// No description provided for @exclusions.
  ///
  /// In de, this message translates to:
  /// **'Exkl.'**
  String get exclusions;

  /// No description provided for @hierarchy.
  ///
  /// In de, this message translates to:
  /// **'Hierarchie'**
  String get hierarchy;

  /// No description provided for @qualifierScale.
  ///
  /// In de, this message translates to:
  /// **'Beurteilungsmerkmale'**
  String get qualifierScale;

  /// No description provided for @qualifierScaleEnvironment.
  ///
  /// In de, this message translates to:
  /// **'Beurteilungsmerkmale (Umwelt)'**
  String get qualifierScaleEnvironment;

  /// No description provided for @qualifierBuilder.
  ///
  /// In de, this message translates to:
  /// **'Qualifier-Builder'**
  String get qualifierBuilder;

  /// No description provided for @selectQualifier.
  ///
  /// In de, this message translates to:
  /// **'Qualifier auswählen:'**
  String get selectQualifier;

  /// No description provided for @copyCode.
  ///
  /// In de, this message translates to:
  /// **'Code kopieren'**
  String get copyCode;

  /// No description provided for @codeCopied.
  ///
  /// In de, this message translates to:
  /// **'{code} kopiert'**
  String codeCopied(String code);

  /// No description provided for @share.
  ///
  /// In de, this message translates to:
  /// **'Teilen'**
  String get share;

  /// No description provided for @favorites.
  ///
  /// In de, this message translates to:
  /// **'Favoriten'**
  String get favorites;

  /// No description provided for @addToFavorites.
  ///
  /// In de, this message translates to:
  /// **'Zu Favoriten hinzufügen'**
  String get addToFavorites;

  /// No description provided for @removeFromFavorites.
  ///
  /// In de, this message translates to:
  /// **'Aus Favoriten entfernen'**
  String get removeFromFavorites;

  /// No description provided for @noFavorites.
  ///
  /// In de, this message translates to:
  /// **'Keine Favoriten'**
  String get noFavorites;

  /// No description provided for @noFavoritesHint.
  ///
  /// In de, this message translates to:
  /// **'Tippen Sie auf das Herz-Symbol, um Codes zu speichern'**
  String get noFavoritesHint;

  /// No description provided for @recentlyViewed.
  ///
  /// In de, this message translates to:
  /// **'Zuletzt angesehen'**
  String get recentlyViewed;

  /// No description provided for @noHistory.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Codes angesehen'**
  String get noHistory;

  /// No description provided for @clearHistory.
  ///
  /// In de, this message translates to:
  /// **'Verlauf löschen'**
  String get clearHistory;

  /// No description provided for @clearHistoryConfirm.
  ///
  /// In de, this message translates to:
  /// **'Möchten Sie den gesamten Verlauf löschen?'**
  String get clearHistoryConfirm;

  /// No description provided for @cancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get delete;

  /// No description provided for @exportPdf.
  ///
  /// In de, this message translates to:
  /// **'Als PDF exportieren'**
  String get exportPdf;

  /// No description provided for @favoritesPdfTitle.
  ///
  /// In de, this message translates to:
  /// **'ICF Favoriten - Zusammenstellung'**
  String get favoritesPdfTitle;

  /// No description provided for @settings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In de, this message translates to:
  /// **'Darstellung'**
  String get appearance;

  /// No description provided for @themeMode.
  ///
  /// In de, this message translates to:
  /// **'Design'**
  String get themeMode;

  /// No description provided for @lightMode.
  ///
  /// In de, this message translates to:
  /// **'Hell'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In de, this message translates to:
  /// **'Dunkel'**
  String get darkMode;

  /// No description provided for @systemMode.
  ///
  /// In de, this message translates to:
  /// **'System'**
  String get systemMode;

  /// No description provided for @language.
  ///
  /// In de, this message translates to:
  /// **'Sprache'**
  String get language;

  /// No description provided for @about.
  ///
  /// In de, this message translates to:
  /// **'Über die App'**
  String get about;

  /// No description provided for @impressum.
  ///
  /// In de, this message translates to:
  /// **'Impressum & Datenschutz'**
  String get impressum;

  /// No description provided for @impressumSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Nachschlagewerk für die Internationale Klassifikation der Funktionsfähigkeit, Behinderung und Gesundheit'**
  String get impressumSubtitle;

  /// No description provided for @impressumLegal.
  ///
  /// In de, this message translates to:
  /// **'Angaben gemäß DDG'**
  String get impressumLegal;

  /// No description provided for @responsiblePerson.
  ///
  /// In de, this message translates to:
  /// **'Verantwortlich:'**
  String get responsiblePerson;

  /// No description provided for @address.
  ///
  /// In de, this message translates to:
  /// **'Anschrift:'**
  String get address;

  /// No description provided for @email.
  ///
  /// In de, this message translates to:
  /// **'E-Mail:'**
  String get email;

  /// No description provided for @website.
  ///
  /// In de, this message translates to:
  /// **'Web:'**
  String get website;

  /// No description provided for @impressumDdgNote.
  ///
  /// In de, this message translates to:
  /// **'Angaben gemäß § 5 Digitale-Dienste-Gesetz (DDG). Inhaltlich verantwortlich gemäß § 18 Abs. 2 Medienstaatsvertrag (MStV).'**
  String get impressumDdgNote;

  /// No description provided for @medicalDeviceNotice.
  ///
  /// In de, this message translates to:
  /// **'Hinweis zu Medizinprodukten'**
  String get medicalDeviceNotice;

  /// No description provided for @medicalDeviceNoticeText.
  ///
  /// In de, this message translates to:
  /// **'Diese App ist kein Medizinprodukt im Sinne der EU-Verordnung 2017/745 (MDR). Sie dient ausschließlich als Nachschlagewerk und Informationsquelle zur ICF-Klassifikation. Die App stellt keine Diagnosen, gibt keine Therapieempfehlungen und trifft keine klinischen Entscheidungen. Sie ersetzt in keinem Fall die fachliche Einschätzung durch qualifiziertes Gesundheitspersonal.'**
  String get medicalDeviceNoticeText;

  /// No description provided for @privacyFullText.
  ///
  /// In de, this message translates to:
  /// **'Diese App erhebt, verarbeitet und speichert keine personenbezogenen Daten im Sinne der DSGVO. Alle Daten (Favoriten, Verlauf, Einstellungen) werden ausschließlich lokal auf Ihrem Gerät gespeichert und zu keinem Zeitpunkt an Dritte oder externe Server übermittelt. Es werden keine Analyse-, Tracking- oder Werbedienste eingesetzt. Es erfolgt keine Weitergabe von Daten an Dritte. Bei Löschung der App werden alle lokal gespeicherten Daten entfernt.'**
  String get privacyFullText;

  /// No description provided for @licenses.
  ///
  /// In de, this message translates to:
  /// **'Open-Source-Lizenzen'**
  String get licenses;

  /// No description provided for @version.
  ///
  /// In de, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @dataSource.
  ///
  /// In de, this message translates to:
  /// **'Datenquelle'**
  String get dataSource;

  /// No description provided for @classification.
  ///
  /// In de, this message translates to:
  /// **'Klassifikation:'**
  String get classification;

  /// No description provided for @publisher.
  ///
  /// In de, this message translates to:
  /// **'Herausgeber:'**
  String get publisher;

  /// No description provided for @germanTranslation.
  ///
  /// In de, this message translates to:
  /// **'Deutsche Fassung:'**
  String get germanTranslation;

  /// No description provided for @dataVersion.
  ///
  /// In de, this message translates to:
  /// **'Datenversion:'**
  String get dataVersion;

  /// No description provided for @disclaimer.
  ///
  /// In de, this message translates to:
  /// **'Haftungsausschluss'**
  String get disclaimer;

  /// No description provided for @disclaimerText.
  ///
  /// In de, this message translates to:
  /// **'Diese App dient ausschließlich als Nachschlagewerk und ersetzt keine professionelle medizinische Beratung oder klinische Beurteilung. Die dargestellten Inhalte basieren auf der ICF der WHO in der deutschen Übersetzung des BfArM. Für die Richtigkeit und Vollständigkeit wird keine Gewähr übernommen.'**
  String get disclaimerText;

  /// No description provided for @copyright.
  ///
  /// In de, this message translates to:
  /// **'Urheberrecht'**
  String get copyright;

  /// No description provided for @copyrightText.
  ///
  /// In de, this message translates to:
  /// **'Die ICF ist geistiges Eigentum der Weltgesundheitsorganisation (WHO). Die deutsche Übersetzung wurde vom Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM, ehemals DIMDI) erstellt und veröffentlicht. Die Nutzung der ICF-Inhalte in dieser App erfolgt zu Informationszwecken.'**
  String get copyrightText;

  /// No description provided for @all.
  ///
  /// In de, this message translates to:
  /// **'Alle'**
  String get all;

  /// No description provided for @barrier.
  ///
  /// In de, this message translates to:
  /// **'Barriere'**
  String get barrier;

  /// No description provided for @facilitator.
  ///
  /// In de, this message translates to:
  /// **'Förderfaktor'**
  String get facilitator;

  /// No description provided for @privacyTitle.
  ///
  /// In de, this message translates to:
  /// **'Datenschutz'**
  String get privacyTitle;

  /// No description provided for @privacyText.
  ///
  /// In de, this message translates to:
  /// **'Diese App speichert Ihre Favoriten und den Verlauf ausschließlich lokal auf Ihrem Gerät. Es werden keine Daten an externe Server übertragen. Es erfolgt keine Analyse Ihres Nutzungsverhaltens.'**
  String get privacyText;

  /// No description provided for @privacyAccept.
  ///
  /// In de, this message translates to:
  /// **'Verstanden'**
  String get privacyAccept;

  /// No description provided for @guideTitle.
  ///
  /// In de, this message translates to:
  /// **'ICF-Leitfaden'**
  String get guideTitle;

  /// No description provided for @guideWhatIsIcf.
  ///
  /// In de, this message translates to:
  /// **'Was ist die ICF?'**
  String get guideWhatIsIcf;

  /// No description provided for @guideWhatIsIcfText.
  ///
  /// In de, this message translates to:
  /// **'Die ICF (International Classification of Functioning, Disability and Health) ist die internationale Klassifikation der Funktionsfähigkeit, Behinderung und Gesundheit der Weltgesundheitsorganisation (WHO). Sie bietet eine einheitliche Sprache und einen Rahmen zur Beschreibung von Gesundheit und mit Gesundheit zusammenhängenden Zuständen.\n\nAnders als die ICD (Internationale Klassifikation der Krankheiten), die Diagnosen klassifiziert, beschreibt die ICF die Auswirkungen von Gesundheitsproblemen auf das tägliche Leben eines Menschen.'**
  String get guideWhatIsIcfText;

  /// No description provided for @guideWhatFor.
  ///
  /// In de, this message translates to:
  /// **'Wofür wird die ICF verwendet?'**
  String get guideWhatFor;

  /// No description provided for @guideWhatForText.
  ///
  /// In de, this message translates to:
  /// **'Die ICF wird in vielen Bereichen des Gesundheits- und Sozialwesens eingesetzt:'**
  String get guideWhatForText;

  /// No description provided for @guideUse1.
  ///
  /// In de, this message translates to:
  /// **'Rehabilitation: Dokumentation von Funktionseinschränkungen und Therapiezielen'**
  String get guideUse1;

  /// No description provided for @guideUse2.
  ///
  /// In de, this message translates to:
  /// **'Sozialmedizinische Begutachtung: Feststellung von Teilhabeeinschränkungen'**
  String get guideUse2;

  /// No description provided for @guideUse3.
  ///
  /// In de, this message translates to:
  /// **'Pflege: Einschätzung des Hilfebedarfs'**
  String get guideUse3;

  /// No description provided for @guideUse4.
  ///
  /// In de, this message translates to:
  /// **'Forschung: Vergleichbare Beschreibung von Gesundheitszuständen'**
  String get guideUse4;

  /// No description provided for @guideUse5.
  ///
  /// In de, this message translates to:
  /// **'Gesundheitspolitik: Planung und Evaluation von Versorgungsangeboten'**
  String get guideUse5;

  /// No description provided for @guideStructure.
  ///
  /// In de, this message translates to:
  /// **'Aufbau der ICF'**
  String get guideStructure;

  /// No description provided for @guideStructureText.
  ///
  /// In de, this message translates to:
  /// **'Die ICF ist in vier Domänen gegliedert. Jede Domäne hat Kapitel, Kategorien und Unterkategorien:'**
  String get guideStructureText;

  /// No description provided for @guideDomainB.
  ///
  /// In de, this message translates to:
  /// **'Physiologische und psychologische Funktionen des Körpers'**
  String get guideDomainB;

  /// No description provided for @guideDomainS.
  ///
  /// In de, this message translates to:
  /// **'Anatomische Teile des Körpers (Organe, Gliedmaßen)'**
  String get guideDomainS;

  /// No description provided for @guideDomainD.
  ///
  /// In de, this message translates to:
  /// **'Durchführung von Aufgaben und Handlungen im täglichen Leben'**
  String get guideDomainD;

  /// No description provided for @guideDomainE.
  ///
  /// In de, this message translates to:
  /// **'Physische, soziale und einstellungsbezogene Umwelt'**
  String get guideDomainE;

  /// No description provided for @guideHowToRead.
  ///
  /// In de, this message translates to:
  /// **'Wie liest man einen ICF-Code?'**
  String get guideHowToRead;

  /// No description provided for @guideHowToReadText.
  ///
  /// In de, this message translates to:
  /// **'Jeder ICF-Code besteht aus einem Buchstaben (Domäne) und Ziffern (Kapitel, Kategorie, Unterkategorie):'**
  String get guideHowToReadText;

  /// No description provided for @guideDomain.
  ///
  /// In de, this message translates to:
  /// **'Domäne'**
  String get guideDomain;

  /// No description provided for @guideChapter.
  ///
  /// In de, this message translates to:
  /// **'Kapitel'**
  String get guideChapter;

  /// No description provided for @guideCategory.
  ///
  /// In de, this message translates to:
  /// **'Kategorie'**
  String get guideCategory;

  /// No description provided for @guideSubCategory.
  ///
  /// In de, this message translates to:
  /// **'Unterkategorie'**
  String get guideSubCategory;

  /// No description provided for @guideCodeExample.
  ///
  /// In de, this message translates to:
  /// **'b1140 = Orientierung zur Zeit\n(b = Körperfunktionen, 1 = Mentale Funktionen,\n14 = Orientierung, 0 = zur Zeit)'**
  String get guideCodeExample;

  /// No description provided for @guideQualifiers.
  ///
  /// In de, this message translates to:
  /// **'Beurteilungsmerkmale (Qualifier)'**
  String get guideQualifiers;

  /// No description provided for @guideQualifiersText.
  ///
  /// In de, this message translates to:
  /// **'Qualifier geben das Ausmaß eines Problems an. Sie werden mit einem Punkt an den Code angehängt:'**
  String get guideQualifiersText;

  /// No description provided for @guideQualifierExample.
  ///
  /// In de, this message translates to:
  /// **'Beispiel:'**
  String get guideQualifierExample;

  /// No description provided for @guideQualifierExampleDesc.
  ///
  /// In de, this message translates to:
  /// **'Funktionen der Gelenkbeweglichkeit (b710)\nmit mässig ausgeprägtem Problem (.2 = 25–49%)'**
  String get guideQualifierExampleDesc;

  /// No description provided for @guideEnvQualifiers.
  ///
  /// In de, this message translates to:
  /// **'Umweltfaktoren kodieren'**
  String get guideEnvQualifiers;

  /// No description provided for @guideEnvQualifiersText.
  ///
  /// In de, this message translates to:
  /// **'Umweltfaktoren können als Barriere (hinderlich) oder als Förderfaktor (unterstützend) wirken. Barrieren werden mit einem Punkt, Förderfaktoren mit einem Pluszeichen kodiert:'**
  String get guideEnvQualifiersText;

  /// No description provided for @guideBarrierExample.
  ///
  /// In de, this message translates to:
  /// **'e150.3 = Gebäudezugänglichkeit ist ein erhebliches Hindernis'**
  String get guideBarrierExample;

  /// No description provided for @guideFacilitatorExample.
  ///
  /// In de, this message translates to:
  /// **'e120+4 = Mobilitätshilfen sind ein vollständiger Förderfaktor'**
  String get guideFacilitatorExample;

  /// No description provided for @guidePractice1Title.
  ///
  /// In de, this message translates to:
  /// **'Beispiel: Knie-OP (Orthopädie)'**
  String get guidePractice1Title;

  /// No description provided for @guidePractice1Text.
  ///
  /// In de, this message translates to:
  /// **'Ein 58-jähriger Patient nach Kniegelenksersatz in der Rehabilitation:'**
  String get guidePractice1Text;

  /// No description provided for @guidePractice1Code1.
  ///
  /// In de, this message translates to:
  /// **'Gelenkbeweglichkeit – mässig eingeschränkt'**
  String get guidePractice1Code1;

  /// No description provided for @guidePractice1Code2.
  ///
  /// In de, this message translates to:
  /// **'Schmerzempfinden – leicht ausgeprägt'**
  String get guidePractice1Code2;

  /// No description provided for @guidePractice1Code3.
  ///
  /// In de, this message translates to:
  /// **'Gehen – mässig eingeschränkt'**
  String get guidePractice1Code3;

  /// No description provided for @guidePractice1Code4.
  ///
  /// In de, this message translates to:
  /// **'Sich waschen – kein Problem'**
  String get guidePractice1Code4;

  /// No description provided for @guidePractice1Code5.
  ///
  /// In de, this message translates to:
  /// **'Mobilitätshilfen – erheblicher Förderfaktor'**
  String get guidePractice1Code5;

  /// No description provided for @guidePractice1Code6.
  ///
  /// In de, this message translates to:
  /// **'Gesundheitsdienste – mässiger Förderfaktor'**
  String get guidePractice1Code6;

  /// No description provided for @guidePractice2Title.
  ///
  /// In de, this message translates to:
  /// **'Beispiel: Depression (Psychiatrie)'**
  String get guidePractice2Title;

  /// No description provided for @guidePractice2Text.
  ///
  /// In de, this message translates to:
  /// **'Eine 34-jährige Patientin mit mittelschwerer depressiver Episode, seit 6 Monaten arbeitsunfähig:'**
  String get guidePractice2Text;

  /// No description provided for @guidePractice2Code1.
  ///
  /// In de, this message translates to:
  /// **'Antrieb und Energie – erheblich eingeschränkt'**
  String get guidePractice2Code1;

  /// No description provided for @guidePractice2Code2.
  ///
  /// In de, this message translates to:
  /// **'Emotionale Funktionen – erheblich beeinträchtigt'**
  String get guidePractice2Code2;

  /// No description provided for @guidePractice2Code3.
  ///
  /// In de, this message translates to:
  /// **'Schlaf – mässig gestört'**
  String get guidePractice2Code3;

  /// No description provided for @guidePractice2Code4.
  ///
  /// In de, this message translates to:
  /// **'Mit Stress umgehen – mässig eingeschränkt'**
  String get guidePractice2Code4;

  /// No description provided for @guidePractice2Code5.
  ///
  /// In de, this message translates to:
  /// **'Allgemeine interpersonelle Interaktionen – erheblich eingeschränkt'**
  String get guidePractice2Code5;

  /// No description provided for @guidePractice2Code6.
  ///
  /// In de, this message translates to:
  /// **'Bezahlte Tätigkeit – voll ausgeprägt eingeschränkt'**
  String get guidePractice2Code6;

  /// No description provided for @guidePractice2Code7.
  ///
  /// In de, this message translates to:
  /// **'Familie – erheblicher Förderfaktor'**
  String get guidePractice2Code7;

  /// No description provided for @guidePractice2Code8.
  ///
  /// In de, this message translates to:
  /// **'Gesundheitsdienste – mässiger Förderfaktor'**
  String get guidePractice2Code8;

  /// No description provided for @guidePractice2Code9.
  ///
  /// In de, this message translates to:
  /// **'Gesellschaftliche Einstellungen – mässige Barriere'**
  String get guidePractice2Code9;

  /// No description provided for @guidePractice3Title.
  ///
  /// In de, this message translates to:
  /// **'Beispiel: Schlaganfall (Neurologie)'**
  String get guidePractice3Title;

  /// No description provided for @guidePractice3Text.
  ///
  /// In de, this message translates to:
  /// **'Ein 72-jähriger Patient 4 Wochen nach ischämischem Schlaganfall mit rechtsseitiger Hemiparese:'**
  String get guidePractice3Text;

  /// No description provided for @guidePractice3Code1.
  ///
  /// In de, this message translates to:
  /// **'Mentale Sprachfunktionen – mässig beeinträchtigt'**
  String get guidePractice3Code1;

  /// No description provided for @guidePractice3Code2.
  ///
  /// In de, this message translates to:
  /// **'Muskelkraft – erheblich eingeschränkt (rechts)'**
  String get guidePractice3Code2;

  /// No description provided for @guidePractice3Code3.
  ///
  /// In de, this message translates to:
  /// **'Artikulation – mässig beeinträchtigt'**
  String get guidePractice3Code3;

  /// No description provided for @guidePractice3Code4.
  ///
  /// In de, this message translates to:
  /// **'Gehirnstruktur – erheblich geschädigt'**
  String get guidePractice3Code4;

  /// No description provided for @guidePractice3Code5.
  ///
  /// In de, this message translates to:
  /// **'Sprechen – erheblich eingeschränkt'**
  String get guidePractice3Code5;

  /// No description provided for @guidePractice3Code6.
  ///
  /// In de, this message translates to:
  /// **'Feinmotorischer Handgebrauch – erheblich eingeschränkt'**
  String get guidePractice3Code6;

  /// No description provided for @guidePractice3Code7.
  ///
  /// In de, this message translates to:
  /// **'Essen – leicht eingeschränkt'**
  String get guidePractice3Code7;

  /// No description provided for @guidePractice3Code8.
  ///
  /// In de, this message translates to:
  /// **'Hilfsmittel im Alltag – erheblicher Förderfaktor'**
  String get guidePractice3Code8;

  /// No description provided for @guidePractice3Code9.
  ///
  /// In de, this message translates to:
  /// **'Pflegepersonen – vollständiger Förderfaktor'**
  String get guidePractice3Code9;

  /// No description provided for @guidePractice3Code10.
  ///
  /// In de, this message translates to:
  /// **'Gesundheitsdienste – erheblicher Förderfaktor'**
  String get guidePractice3Code10;

  /// No description provided for @subCategoriesCount.
  ///
  /// In de, this message translates to:
  /// **'{count} Unterkategorien'**
  String subCategoriesCount(int count);

  /// No description provided for @onboardingSkip.
  ///
  /// In de, this message translates to:
  /// **'Überspringen'**
  String get onboardingSkip;

  /// No description provided for @onboardingStart.
  ///
  /// In de, this message translates to:
  /// **'Los geht\'s'**
  String get onboardingStart;

  /// No description provided for @onboardingNext.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get onboardingNext;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In de, this message translates to:
  /// **'Willkommen bei ICF Klassifikation'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeText.
  ///
  /// In de, this message translates to:
  /// **'Ihr digitales Nachschlagewerk für die Internationale Klassifikation der Funktionsfähigkeit, Behinderung und Gesundheit.'**
  String get onboardingWelcomeText;

  /// No description provided for @onboardingDomainsTitle.
  ///
  /// In de, this message translates to:
  /// **'Vier Domänen'**
  String get onboardingDomainsTitle;

  /// No description provided for @onboardingDomainsText.
  ///
  /// In de, this message translates to:
  /// **'Die ICF ist in vier Domänen gegliedert: Körperfunktionen (b), Körperstrukturen (s), Aktivitäten & Partizipation (d) und Umweltfaktoren (e).'**
  String get onboardingDomainsText;

  /// No description provided for @onboardingSearchTitle.
  ///
  /// In de, this message translates to:
  /// **'Schnelle Suche'**
  String get onboardingSearchTitle;

  /// No description provided for @onboardingSearchText.
  ///
  /// In de, this message translates to:
  /// **'Finden Sie jeden ICF-Code in Sekundenschnelle.'**
  String get onboardingSearchText;

  /// No description provided for @onboardingSearchTip1.
  ///
  /// In de, this message translates to:
  /// **'Suchen Sie nach Code (z.B. b710) oder Begriff'**
  String get onboardingSearchTip1;

  /// No description provided for @onboardingSearchTip2.
  ///
  /// In de, this message translates to:
  /// **'Filtern Sie nach Domäne über die Tabs'**
  String get onboardingSearchTip2;

  /// No description provided for @onboardingQualifierTitle.
  ///
  /// In de, this message translates to:
  /// **'Qualifier-Builder'**
  String get onboardingQualifierTitle;

  /// No description provided for @onboardingQualifierText.
  ///
  /// In de, this message translates to:
  /// **'Bauen Sie ICF-Codes mit Qualifiern interaktiv zusammen.'**
  String get onboardingQualifierText;

  /// No description provided for @onboardingQualifierExample.
  ///
  /// In de, this message translates to:
  /// **'b710.2'**
  String get onboardingQualifierExample;

  /// No description provided for @onboardingQualifierExampleDesc.
  ///
  /// In de, this message translates to:
  /// **'Funktionen der Gelenkbeweglichkeit – mäßig beeinträchtigt'**
  String get onboardingQualifierExampleDesc;

  /// No description provided for @onboardingFavoritesTitle.
  ///
  /// In de, this message translates to:
  /// **'Favoriten & Export'**
  String get onboardingFavoritesTitle;

  /// No description provided for @onboardingFavoritesText.
  ///
  /// In de, this message translates to:
  /// **'Speichern Sie häufig genutzte Codes und exportieren Sie sie als PDF.'**
  String get onboardingFavoritesText;

  /// No description provided for @onboardingFavoritesTip1.
  ///
  /// In de, this message translates to:
  /// **'Tippen Sie auf das Herz, um Codes zu speichern'**
  String get onboardingFavoritesTip1;

  /// No description provided for @onboardingFavoritesTip2.
  ///
  /// In de, this message translates to:
  /// **'Exportieren Sie Ihre Sammlung als PDF'**
  String get onboardingFavoritesTip2;

  /// No description provided for @onboardingPrivacyNote.
  ///
  /// In de, this message translates to:
  /// **'Alle Daten bleiben auf Ihrem Gerät. Kein Tracking, kein Internet nötig.'**
  String get onboardingPrivacyNote;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In de, this message translates to:
  /// **'Datenschutzerklärung'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In de, this message translates to:
  /// **'Stand: April 2026'**
  String get privacyPolicyLastUpdated;

  /// No description provided for @privacyPolicyOverviewTitle.
  ///
  /// In de, this message translates to:
  /// **'Überblick'**
  String get privacyPolicyOverviewTitle;

  /// No description provided for @privacyPolicyOverviewText.
  ///
  /// In de, this message translates to:
  /// **'Die ICF Klassifikation App respektiert Ihre Privatsphäre. Diese App erhebt, speichert und überträgt keine personenbezogenen Daten.'**
  String get privacyPolicyOverviewText;

  /// No description provided for @privacyPolicyNoCollectionTitle.
  ///
  /// In de, this message translates to:
  /// **'Keine Datenerhebung'**
  String get privacyPolicyNoCollectionTitle;

  /// No description provided for @privacyPolicyNoCollectionText.
  ///
  /// In de, this message translates to:
  /// **'Die App erhebt keinerlei personenbezogene Daten.'**
  String get privacyPolicyNoCollectionText;

  /// No description provided for @privacyPolicyDataTitle.
  ///
  /// In de, this message translates to:
  /// **'Lokale Datenspeicherung'**
  String get privacyPolicyDataTitle;

  /// No description provided for @privacyPolicyDataText.
  ///
  /// In de, this message translates to:
  /// **'Favoriten, Verlauf und Einstellungen werden ausschließlich lokal auf Ihrem Gerät gespeichert.'**
  String get privacyPolicyDataText;

  /// No description provided for @privacyPolicyPermissionsTitle.
  ///
  /// In de, this message translates to:
  /// **'Berechtigungen'**
  String get privacyPolicyPermissionsTitle;

  /// No description provided for @privacyPolicyPermissionsText.
  ///
  /// In de, this message translates to:
  /// **'Die App benötigt keine besonderen Berechtigungen. Sie funktioniert vollständig offline.'**
  String get privacyPolicyPermissionsText;

  /// No description provided for @privacyPolicyChildrenTitle.
  ///
  /// In de, this message translates to:
  /// **'Kinder'**
  String get privacyPolicyChildrenTitle;

  /// No description provided for @privacyPolicyChildrenText.
  ///
  /// In de, this message translates to:
  /// **'Die App richtet sich an Fachkräfte im Gesundheitswesen und erhebt keine Daten von Kindern.'**
  String get privacyPolicyChildrenText;

  /// No description provided for @privacyPolicyRightsTitle.
  ///
  /// In de, this message translates to:
  /// **'Ihre Rechte'**
  String get privacyPolicyRightsTitle;

  /// No description provided for @privacyPolicyRightsText.
  ///
  /// In de, this message translates to:
  /// **'Da keine personenbezogenen Daten erhoben werden, bestehen keine Ansprüche auf Auskunft, Berichtigung oder Löschung.'**
  String get privacyPolicyRightsText;

  /// No description provided for @privacyPolicyContactTitle.
  ///
  /// In de, this message translates to:
  /// **'Kontakt'**
  String get privacyPolicyContactTitle;

  /// No description provided for @privacyPolicyContactText.
  ///
  /// In de, this message translates to:
  /// **'mirko.richter@eingliederungshilfe.cloud'**
  String get privacyPolicyContactText;

  /// No description provided for @termsOfServiceTitle.
  ///
  /// In de, this message translates to:
  /// **'Nutzungsbedingungen'**
  String get termsOfServiceTitle;

  /// No description provided for @termsLastUpdated.
  ///
  /// In de, this message translates to:
  /// **'Stand: April 2026'**
  String get termsLastUpdated;

  /// No description provided for @termsAcceptanceTitle.
  ///
  /// In de, this message translates to:
  /// **'Nutzungsvereinbarung'**
  String get termsAcceptanceTitle;

  /// No description provided for @termsAcceptanceText.
  ///
  /// In de, this message translates to:
  /// **'Durch die Nutzung dieser App akzeptieren Sie diese Bedingungen.'**
  String get termsAcceptanceText;

  /// No description provided for @termsUsageTitle.
  ///
  /// In de, this message translates to:
  /// **'Bestimmungsgemäße Nutzung'**
  String get termsUsageTitle;

  /// No description provided for @termsUsageText.
  ///
  /// In de, this message translates to:
  /// **'Die App dient als Nachschlagewerk für die ICF-Klassifikation.'**
  String get termsUsageText;

  /// No description provided for @termsIntellectualPropertyTitle.
  ///
  /// In de, this message translates to:
  /// **'Geistiges Eigentum'**
  String get termsIntellectualPropertyTitle;

  /// No description provided for @termsIntellectualPropertyText.
  ///
  /// In de, this message translates to:
  /// **'Die ICF ist geistiges Eigentum der WHO. Die deutsche Fassung wurde vom BfArM veröffentlicht.'**
  String get termsIntellectualPropertyText;

  /// No description provided for @termsMedicalDisclaimerTitle.
  ///
  /// In de, this message translates to:
  /// **'Medizinischer Haftungsausschluss'**
  String get termsMedicalDisclaimerTitle;

  /// No description provided for @termsMedicalDisclaimerText.
  ///
  /// In de, this message translates to:
  /// **'Diese App ist kein Medizinprodukt im Sinne der EU-Verordnung 2017/745 (MDR).'**
  String get termsMedicalDisclaimerText;

  /// No description provided for @termsLiabilityTitle.
  ///
  /// In de, this message translates to:
  /// **'Haftung'**
  String get termsLiabilityTitle;

  /// No description provided for @termsLiabilityText.
  ///
  /// In de, this message translates to:
  /// **'Für die Richtigkeit und Vollständigkeit der Inhalte wird keine Gewähr übernommen.'**
  String get termsLiabilityText;

  /// No description provided for @termsChangesTitle.
  ///
  /// In de, this message translates to:
  /// **'Änderungen'**
  String get termsChangesTitle;

  /// No description provided for @termsChangesText.
  ///
  /// In de, this message translates to:
  /// **'Diese Bedingungen können bei Bedarf aktualisiert werden.'**
  String get termsChangesText;

  /// No description provided for @termsContactTitle.
  ///
  /// In de, this message translates to:
  /// **'Kontakt'**
  String get termsContactTitle;

  /// No description provided for @termsContactText.
  ///
  /// In de, this message translates to:
  /// **'Mirko Richter\nmirko.richter@eingliederungshilfe.cloud'**
  String get termsContactText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
