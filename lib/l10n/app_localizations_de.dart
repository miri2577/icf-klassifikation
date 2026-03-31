// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'ICF Klassifikation';

  @override
  String get searchHint => 'Code oder Begriff suchen...';

  @override
  String get noResults => 'Keine Ergebnisse gefunden';

  @override
  String get searchResults => 'Suchergebnisse';

  @override
  String get bodyFunctions => 'Körperfunktionen';

  @override
  String get bodyStructures => 'Körperstrukturen';

  @override
  String get activitiesParticipation => 'Aktivitäten & Partizipation';

  @override
  String get environmentalFactors => 'Umweltfaktoren';

  @override
  String get chapters => 'Kapitel';

  @override
  String get categories => 'Kategorien';

  @override
  String get subCategories => 'Unterkategorien';

  @override
  String get description => 'Beschreibung';

  @override
  String get inclusions => 'Inkl.';

  @override
  String get exclusions => 'Exkl.';

  @override
  String get hierarchy => 'Hierarchie';

  @override
  String get qualifierScale => 'Beurteilungsmerkmale';

  @override
  String get qualifierScaleEnvironment => 'Beurteilungsmerkmale (Umwelt)';

  @override
  String get qualifierBuilder => 'Qualifier-Builder';

  @override
  String get selectQualifier => 'Qualifier auswählen:';

  @override
  String get copyCode => 'Code kopieren';

  @override
  String codeCopied(String code) {
    return '$code kopiert';
  }

  @override
  String get share => 'Teilen';

  @override
  String get favorites => 'Favoriten';

  @override
  String get addToFavorites => 'Zu Favoriten hinzufügen';

  @override
  String get removeFromFavorites => 'Aus Favoriten entfernen';

  @override
  String get noFavorites => 'Keine Favoriten';

  @override
  String get noFavoritesHint =>
      'Tippen Sie auf das Herz-Symbol, um Codes zu speichern';

  @override
  String get recentlyViewed => 'Zuletzt angesehen';

  @override
  String get noHistory => 'Noch keine Codes angesehen';

  @override
  String get clearHistory => 'Verlauf löschen';

  @override
  String get clearHistoryConfirm => 'Möchten Sie den gesamten Verlauf löschen?';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get exportPdf => 'Als PDF exportieren';

  @override
  String get favoritesPdfTitle => 'ICF Favoriten - Zusammenstellung';

  @override
  String get settings => 'Einstellungen';

  @override
  String get appearance => 'Darstellung';

  @override
  String get themeMode => 'Design';

  @override
  String get lightMode => 'Hell';

  @override
  String get darkMode => 'Dunkel';

  @override
  String get systemMode => 'System';

  @override
  String get language => 'Sprache';

  @override
  String get about => 'Über die App';

  @override
  String get impressum => 'Impressum & Datenschutz';

  @override
  String get impressumSubtitle =>
      'Nachschlagewerk für die Internationale Klassifikation der Funktionsfähigkeit, Behinderung und Gesundheit';

  @override
  String get impressumLegal => 'Angaben gemäß DDG';

  @override
  String get responsiblePerson => 'Verantwortlich:';

  @override
  String get address => 'Anschrift:';

  @override
  String get email => 'E-Mail:';

  @override
  String get website => 'Web:';

  @override
  String get impressumDdgNote =>
      'Angaben gemäß § 5 Digitale-Dienste-Gesetz (DDG). Inhaltlich verantwortlich gemäß § 18 Abs. 2 Medienstaatsvertrag (MStV).';

  @override
  String get medicalDeviceNotice => 'Hinweis zu Medizinprodukten';

  @override
  String get medicalDeviceNoticeText =>
      'Diese App ist kein Medizinprodukt im Sinne der EU-Verordnung 2017/745 (MDR). Sie dient ausschließlich als Nachschlagewerk und Informationsquelle zur ICF-Klassifikation. Die App stellt keine Diagnosen, gibt keine Therapieempfehlungen und trifft keine klinischen Entscheidungen. Sie ersetzt in keinem Fall die fachliche Einschätzung durch qualifiziertes Gesundheitspersonal.';

  @override
  String get privacyFullText =>
      'Diese App erhebt, verarbeitet und speichert keine personenbezogenen Daten im Sinne der DSGVO. Alle Daten (Favoriten, Verlauf, Einstellungen) werden ausschließlich lokal auf Ihrem Gerät gespeichert und zu keinem Zeitpunkt an Dritte oder externe Server übermittelt. Es werden keine Analyse-, Tracking- oder Werbedienste eingesetzt. Es erfolgt keine Weitergabe von Daten an Dritte. Bei Löschung der App werden alle lokal gespeicherten Daten entfernt.';

  @override
  String get licenses => 'Open-Source-Lizenzen';

  @override
  String get version => 'Version';

  @override
  String get dataSource => 'Datenquelle';

  @override
  String get classification => 'Klassifikation:';

  @override
  String get publisher => 'Herausgeber:';

  @override
  String get germanTranslation => 'Deutsche Fassung:';

  @override
  String get dataVersion => 'Datenversion:';

  @override
  String get disclaimer => 'Haftungsausschluss';

  @override
  String get disclaimerText =>
      'Diese App dient ausschließlich als Nachschlagewerk und ersetzt keine professionelle medizinische Beratung oder klinische Beurteilung. Die dargestellten Inhalte basieren auf der ICF der WHO in der deutschen Übersetzung des BfArM. Für die Richtigkeit und Vollständigkeit wird keine Gewähr übernommen.';

  @override
  String get copyright => 'Urheberrecht';

  @override
  String get copyrightText =>
      'Die ICF ist geistiges Eigentum der Weltgesundheitsorganisation (WHO). Die deutsche Übersetzung wurde vom Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM, ehemals DIMDI) erstellt und veröffentlicht. Die Nutzung der ICF-Inhalte in dieser App erfolgt zu Informationszwecken.';

  @override
  String get all => 'Alle';

  @override
  String get barrier => 'Barriere';

  @override
  String get facilitator => 'Förderfaktor';

  @override
  String get privacyTitle => 'Datenschutz';

  @override
  String get privacyText =>
      'Diese App speichert Ihre Favoriten und den Verlauf ausschließlich lokal auf Ihrem Gerät. Es werden keine Daten an externe Server übertragen. Es erfolgt keine Analyse Ihres Nutzungsverhaltens.';

  @override
  String get privacyAccept => 'Verstanden';

  @override
  String get guideTitle => 'ICF-Leitfaden';

  @override
  String get guideWhatIsIcf => 'Was ist die ICF?';

  @override
  String get guideWhatIsIcfText =>
      'Die ICF (International Classification of Functioning, Disability and Health) ist die internationale Klassifikation der Funktionsfähigkeit, Behinderung und Gesundheit der Weltgesundheitsorganisation (WHO). Sie bietet eine einheitliche Sprache und einen Rahmen zur Beschreibung von Gesundheit und mit Gesundheit zusammenhängenden Zuständen.\n\nAnders als die ICD (Internationale Klassifikation der Krankheiten), die Diagnosen klassifiziert, beschreibt die ICF die Auswirkungen von Gesundheitsproblemen auf das tägliche Leben eines Menschen.';

  @override
  String get guideWhatFor => 'Wofür wird die ICF verwendet?';

  @override
  String get guideWhatForText =>
      'Die ICF wird in vielen Bereichen des Gesundheits- und Sozialwesens eingesetzt:';

  @override
  String get guideUse1 =>
      'Rehabilitation: Dokumentation von Funktionseinschränkungen und Therapiezielen';

  @override
  String get guideUse2 =>
      'Sozialmedizinische Begutachtung: Feststellung von Teilhabeeinschränkungen';

  @override
  String get guideUse3 => 'Pflege: Einschätzung des Hilfebedarfs';

  @override
  String get guideUse4 =>
      'Forschung: Vergleichbare Beschreibung von Gesundheitszuständen';

  @override
  String get guideUse5 =>
      'Gesundheitspolitik: Planung und Evaluation von Versorgungsangeboten';

  @override
  String get guideStructure => 'Aufbau der ICF';

  @override
  String get guideStructureText =>
      'Die ICF ist in vier Domänen gegliedert. Jede Domäne hat Kapitel, Kategorien und Unterkategorien:';

  @override
  String get guideDomainB =>
      'Physiologische und psychologische Funktionen des Körpers';

  @override
  String get guideDomainS =>
      'Anatomische Teile des Körpers (Organe, Gliedmaßen)';

  @override
  String get guideDomainD =>
      'Durchführung von Aufgaben und Handlungen im täglichen Leben';

  @override
  String get guideDomainE =>
      'Physische, soziale und einstellungsbezogene Umwelt';

  @override
  String get guideHowToRead => 'Wie liest man einen ICF-Code?';

  @override
  String get guideHowToReadText =>
      'Jeder ICF-Code besteht aus einem Buchstaben (Domäne) und Ziffern (Kapitel, Kategorie, Unterkategorie):';

  @override
  String get guideDomain => 'Domäne';

  @override
  String get guideChapter => 'Kapitel';

  @override
  String get guideCategory => 'Kategorie';

  @override
  String get guideSubCategory => 'Unterkategorie';

  @override
  String get guideCodeExample =>
      'b1140 = Orientierung zur Zeit\n(b = Körperfunktionen, 1 = Mentale Funktionen,\n14 = Orientierung, 0 = zur Zeit)';

  @override
  String get guideQualifiers => 'Beurteilungsmerkmale (Qualifier)';

  @override
  String get guideQualifiersText =>
      'Qualifier geben das Ausmaß eines Problems an. Sie werden mit einem Punkt an den Code angehängt:';

  @override
  String get guideQualifierExample => 'Beispiel:';

  @override
  String get guideQualifierExampleDesc =>
      'Funktionen der Gelenkbeweglichkeit (b710)\nmit mässig ausgeprägtem Problem (.2 = 25–49%)';

  @override
  String get guideEnvQualifiers => 'Umweltfaktoren kodieren';

  @override
  String get guideEnvQualifiersText =>
      'Umweltfaktoren können als Barriere (hinderlich) oder als Förderfaktor (unterstützend) wirken. Barrieren werden mit einem Punkt, Förderfaktoren mit einem Pluszeichen kodiert:';

  @override
  String get guideBarrierExample =>
      'e150.3 = Gebäudezugänglichkeit ist ein erhebliches Hindernis';

  @override
  String get guideFacilitatorExample =>
      'e120+4 = Mobilitätshilfen sind ein vollständiger Förderfaktor';

  @override
  String get guidePractice1Title => 'Beispiel: Knie-OP (Orthopädie)';

  @override
  String get guidePractice1Text =>
      'Ein 58-jähriger Patient nach Kniegelenksersatz in der Rehabilitation:';

  @override
  String get guidePractice1Code1 =>
      'Gelenkbeweglichkeit – mässig eingeschränkt';

  @override
  String get guidePractice1Code2 => 'Schmerzempfinden – leicht ausgeprägt';

  @override
  String get guidePractice1Code3 => 'Gehen – mässig eingeschränkt';

  @override
  String get guidePractice1Code4 => 'Sich waschen – kein Problem';

  @override
  String get guidePractice1Code5 =>
      'Mobilitätshilfen – erheblicher Förderfaktor';

  @override
  String get guidePractice1Code6 =>
      'Gesundheitsdienste – mässiger Förderfaktor';

  @override
  String get guidePractice2Title => 'Beispiel: Depression (Psychiatrie)';

  @override
  String get guidePractice2Text =>
      'Eine 34-jährige Patientin mit mittelschwerer depressiver Episode, seit 6 Monaten arbeitsunfähig:';

  @override
  String get guidePractice2Code1 =>
      'Antrieb und Energie – erheblich eingeschränkt';

  @override
  String get guidePractice2Code2 =>
      'Emotionale Funktionen – erheblich beeinträchtigt';

  @override
  String get guidePractice2Code3 => 'Schlaf – mässig gestört';

  @override
  String get guidePractice2Code4 => 'Mit Stress umgehen – mässig eingeschränkt';

  @override
  String get guidePractice2Code5 =>
      'Allgemeine interpersonelle Interaktionen – erheblich eingeschränkt';

  @override
  String get guidePractice2Code6 =>
      'Bezahlte Tätigkeit – voll ausgeprägt eingeschränkt';

  @override
  String get guidePractice2Code7 => 'Familie – erheblicher Förderfaktor';

  @override
  String get guidePractice2Code8 =>
      'Gesundheitsdienste – mässiger Förderfaktor';

  @override
  String get guidePractice2Code9 =>
      'Gesellschaftliche Einstellungen – mässige Barriere';

  @override
  String get guidePractice3Title => 'Beispiel: Schlaganfall (Neurologie)';

  @override
  String get guidePractice3Text =>
      'Ein 72-jähriger Patient 4 Wochen nach ischämischem Schlaganfall mit rechtsseitiger Hemiparese:';

  @override
  String get guidePractice3Code1 =>
      'Mentale Sprachfunktionen – mässig beeinträchtigt';

  @override
  String get guidePractice3Code2 =>
      'Muskelkraft – erheblich eingeschränkt (rechts)';

  @override
  String get guidePractice3Code3 => 'Artikulation – mässig beeinträchtigt';

  @override
  String get guidePractice3Code4 => 'Gehirnstruktur – erheblich geschädigt';

  @override
  String get guidePractice3Code5 => 'Sprechen – erheblich eingeschränkt';

  @override
  String get guidePractice3Code6 =>
      'Feinmotorischer Handgebrauch – erheblich eingeschränkt';

  @override
  String get guidePractice3Code7 => 'Essen – leicht eingeschränkt';

  @override
  String get guidePractice3Code8 =>
      'Hilfsmittel im Alltag – erheblicher Förderfaktor';

  @override
  String get guidePractice3Code9 =>
      'Pflegepersonen – vollständiger Förderfaktor';

  @override
  String get guidePractice3Code10 =>
      'Gesundheitsdienste – erheblicher Förderfaktor';

  @override
  String subCategoriesCount(int count) {
    return '$count Unterkategorien';
  }

  // --- Onboarding ---
  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingStart => 'Los geht\'s';

  @override
  String get onboardingWelcomeTitle => 'Willkommen bei\nICF Klassifikation';

  @override
  String get onboardingWelcomeText =>
      'Ihr umfassendes Nachschlagewerk für die Internationale Klassifikation der Funktionsfähigkeit, Behinderung und Gesundheit (ICF) der WHO – komplett offline verfügbar.';

  @override
  String get onboardingDomainsTitle => 'Vier Domänen';

  @override
  String get onboardingDomainsText =>
      'Die ICF ist in vier Bereiche gegliedert. Navigieren Sie einfach über die Tabs am unteren Bildschirmrand.';

  @override
  String get onboardingSearchTitle => 'Suche & Details';

  @override
  String get onboardingSearchText =>
      'Finden Sie schnell jeden ICF-Code über die Suchleiste – nach Code oder Begriff.';

  @override
  String get onboardingSearchTip1 =>
      'Tippen Sie auf einen Code, um Details, Beschreibungen und Hierarchie zu sehen';

  @override
  String get onboardingSearchTip2 =>
      'Inklusions- und Exklusionshinweise helfen bei der korrekten Zuordnung';

  @override
  String get onboardingQualifierTitle => 'Qualifier-Builder';

  @override
  String get onboardingQualifierText =>
      'Erstellen Sie ICF-Codes mit Beurteilungsmerkmalen direkt in der App – inklusive Schweregrad-Auswahl.';

  @override
  String get onboardingQualifierExample => 'Beispiel:';

  @override
  String get onboardingQualifierExampleDesc =>
      'b710.2 = Gelenkbeweglichkeit mit mäßig ausgeprägtem Problem (25–49%)';

  @override
  String get onboardingFavoritesTitle => 'Favoriten & Export';

  @override
  String get onboardingFavoritesText =>
      'Speichern Sie häufig verwendete Codes als Favoriten und exportieren Sie diese als PDF.';

  @override
  String get onboardingFavoritesTip1 =>
      'Tippen Sie auf das Herz-Symbol, um Codes zu speichern';

  @override
  String get onboardingFavoritesTip2 =>
      'Exportieren Sie Ihre Favoriten-Sammlung als PDF-Dokument';

  @override
  String get onboardingPrivacyNote =>
      '100% offline – Ihre Daten bleiben auf Ihrem Gerät';

  // --- Privacy Policy ---
  @override
  String get privacyPolicyTitle => 'Datenschutzerklärung';

  @override
  String get privacyPolicyLastUpdated => 'Stand: März 2026';

  @override
  String get privacyPolicyOverviewTitle => 'Überblick';

  @override
  String get privacyPolicyOverviewText =>
      'Der Schutz Ihrer persönlichen Daten ist uns ein wichtiges Anliegen. Diese Datenschutzerklärung informiert Sie darüber, wie die App „ICF Klassifikation" mit Ihren Daten umgeht. Verantwortlicher im Sinne der DSGVO ist Mirko Richter, Stillerzeile 29, 12587 Berlin.';

  @override
  String get privacyPolicyDataTitle => 'Lokale Datenspeicherung';

  @override
  String get privacyPolicyDataText =>
      'Die App speichert folgende Daten ausschließlich lokal auf Ihrem Gerät:\n\n• Favoriten: Von Ihnen gespeicherte ICF-Codes\n• Verlauf: Zuletzt angesehene Codes (max. 20 Einträge)\n• Einstellungen: Gewähltes Design (hell/dunkel/system) und Sprache (DE/EN)\n\nDiese Daten werden über SharedPreferences in der App-Sandbox Ihres Geräts gespeichert und sind für andere Apps nicht zugänglich. Bei Deinstallation der App werden alle Daten automatisch gelöscht.';

  @override
  String get privacyPolicyNoCollectionTitle => 'Keine Datenerhebung';

  @override
  String get privacyPolicyNoCollectionText =>
      'Diese App:\n\n• Erhebt keine personenbezogenen Daten\n• Überträgt keine Daten an externe Server\n• Verwendet keine Analyse- oder Tracking-Dienste\n• Setzt keine Cookies oder ähnliche Technologien ein\n• Zeigt keine Werbung an\n• Enthält keine Social-Media-Plugins\n\nDie App funktioniert vollständig offline. Eine Internetverbindung ist nicht erforderlich.';

  @override
  String get privacyPolicyPermissionsTitle => 'App-Berechtigungen';

  @override
  String get privacyPolicyPermissionsText =>
      'Die App benötigt keine besonderen Geräteberechtigungen. Lediglich für den PDF-Export und die Teilen-Funktion werden die üblichen System-Dialoge verwendet, die vom Betriebssystem bereitgestellt werden.';

  @override
  String get privacyPolicyChildrenTitle => 'Kinder und Jugendliche';

  @override
  String get privacyPolicyChildrenText =>
      'Da diese App keine personenbezogenen Daten erhebt, bestehen keine besonderen Risiken für Kinder und Jugendliche. Die App kann bedenkenlos von Personen jeden Alters genutzt werden.';

  @override
  String get privacyPolicyRightsTitle => 'Ihre Rechte (DSGVO)';

  @override
  String get privacyPolicyRightsText =>
      'Da keine personenbezogenen Daten erhoben werden, entfallen die typischen Betroffenenrechte nach Art. 15–21 DSGVO (Auskunft, Berichtigung, Löschung etc.) in der Praxis. Sollten Sie dennoch Fragen zum Datenschutz haben, können Sie sich jederzeit an uns wenden.';

  @override
  String get privacyPolicyContactTitle => 'Kontakt';

  @override
  String get privacyPolicyContactText =>
      'Bei Fragen zum Datenschutz wenden Sie sich bitte an:\n\nMirko Richter\nE-Mail: mirko.richter@eingliederungshilfe.cloud';

  // --- Terms of Service ---
  @override
  String get termsOfServiceTitle => 'Nutzungsbedingungen';

  @override
  String get termsLastUpdated => 'Stand: März 2026';

  @override
  String get termsAcceptanceTitle => 'Geltungsbereich';

  @override
  String get termsAcceptanceText =>
      'Mit der Nutzung der App „ICF Klassifikation" erklären Sie sich mit diesen Nutzungsbedingungen einverstanden. Die App wird von Mirko Richter, Stillerzeile 29, 12587 Berlin, bereitgestellt.';

  @override
  String get termsUsageTitle => 'Bestimmungsgemäße Nutzung';

  @override
  String get termsUsageText =>
      'Die App dient ausschließlich als Nachschlagewerk und Informationsquelle für die ICF-Klassifikation der WHO. Sie ist bestimmt für Fachkräfte im Gesundheits- und Sozialwesen, Studierende und Interessierte. Die Nutzung erfolgt auf eigene Verantwortung.';

  @override
  String get termsIntellectualPropertyTitle => 'Geistiges Eigentum';

  @override
  String get termsIntellectualPropertyText =>
      'Die ICF ist geistiges Eigentum der Weltgesundheitsorganisation (WHO). Die deutsche Übersetzung wurde vom Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM, ehemals DIMDI) erstellt. Die Nutzung der ICF-Inhalte in dieser App erfolgt zu Informations- und Nachschlagezwecken. Eine kommerzielle Weiterverwendung der Inhalte ist nicht gestattet.';

  @override
  String get termsMedicalDisclaimerTitle => 'Medizinischer Haftungsausschluss';

  @override
  String get termsMedicalDisclaimerText =>
      'Diese App ist kein Medizinprodukt im Sinne der EU-Verordnung 2017/745 (MDR). Sie stellt keine Diagnosen, gibt keine Therapieempfehlungen und trifft keine klinischen Entscheidungen. Die App ersetzt in keinem Fall die fachliche Einschätzung durch qualifiziertes Gesundheitspersonal. Bei gesundheitlichen Fragen wenden Sie sich an einen Arzt oder eine andere qualifizierte Fachkraft.';

  @override
  String get termsLiabilityTitle => 'Haftungsbeschränkung';

  @override
  String get termsLiabilityText =>
      'Die Inhalte der App werden mit größtmöglicher Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der bereitgestellten Informationen wird jedoch keine Gewähr übernommen. Die Nutzung der App erfolgt auf eigenes Risiko. Ansprüche auf Schadensersatz sind – soweit gesetzlich zulässig – ausgeschlossen.';

  @override
  String get termsChangesTitle => 'Änderungen';

  @override
  String get termsChangesText =>
      'Diese Nutzungsbedingungen können jederzeit angepasst werden. Änderungen treten mit der Veröffentlichung einer neuen App-Version in Kraft. Bei wesentlichen Änderungen wird im App-Update darauf hingewiesen.';

  @override
  String get termsContactTitle => 'Kontakt';

  @override
  String get termsContactText =>
      'Bei Fragen zu den Nutzungsbedingungen wenden Sie sich bitte an:\n\nMirko Richter\nE-Mail: mirko.richter@eingliederungshilfe.cloud';
}
