// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ICF Classification';

  @override
  String get searchHint => 'Search code or term...';

  @override
  String get noResults => 'No results found';

  @override
  String get searchResults => 'search results';

  @override
  String get bodyFunctions => 'Body Functions';

  @override
  String get bodyStructures => 'Body Structures';

  @override
  String get activitiesParticipation => 'Activities & Participation';

  @override
  String get environmentalFactors => 'Environmental Factors';

  @override
  String get chapters => 'Chapters';

  @override
  String get categories => 'Categories';

  @override
  String get subCategories => 'Sub-categories';

  @override
  String get description => 'Description';

  @override
  String get inclusions => 'Incl.';

  @override
  String get exclusions => 'Excl.';

  @override
  String get hierarchy => 'Hierarchy';

  @override
  String get qualifierScale => 'Qualifier Scale';

  @override
  String get qualifierScaleEnvironment => 'Qualifier Scale (Environment)';

  @override
  String get qualifierBuilder => 'Qualifier Builder';

  @override
  String get selectQualifier => 'Select qualifier:';

  @override
  String get copyCode => 'Copy code';

  @override
  String codeCopied(String code) {
    return '$code copied';
  }

  @override
  String get share => 'Share';

  @override
  String get favorites => 'Favorites';

  @override
  String get addToFavorites => 'Add to favorites';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get noFavorites => 'No favorites';

  @override
  String get noFavoritesHint => 'Tap the heart icon to save codes';

  @override
  String get recentlyViewed => 'Recently Viewed';

  @override
  String get noHistory => 'No codes viewed yet';

  @override
  String get clearHistory => 'Clear history';

  @override
  String get clearHistoryConfirm => 'Do you want to clear the entire history?';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get exportPdf => 'Export as PDF';

  @override
  String get favoritesPdfTitle => 'ICF Favorites - Compilation';

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeMode => 'Theme';

  @override
  String get lightMode => 'Light';

  @override
  String get darkMode => 'Dark';

  @override
  String get systemMode => 'System';

  @override
  String get language => 'Language';

  @override
  String get about => 'About';

  @override
  String get impressum => 'Legal Notice & Privacy';

  @override
  String get impressumSubtitle =>
      'Reference app for the International Classification of Functioning, Disability and Health';

  @override
  String get impressumLegal => 'Legal Information (DDG)';

  @override
  String get responsiblePerson => 'Responsible:';

  @override
  String get address => 'Address:';

  @override
  String get email => 'Email:';

  @override
  String get website => 'Web:';

  @override
  String get impressumDdgNote =>
      'Information pursuant to § 5 German Digital Services Act (DDG). Editorially responsible pursuant to § 18 (2) Interstate Media Treaty (MStV).';

  @override
  String get medicalDeviceNotice => 'Medical Device Notice';

  @override
  String get medicalDeviceNoticeText =>
      'This app is not a medical device within the meaning of EU Regulation 2017/745 (MDR). It serves exclusively as a reference tool and information source for the ICF classification. The app does not make diagnoses, give therapy recommendations, or make clinical decisions. It does not replace professional assessment by qualified healthcare personnel.';

  @override
  String get privacyFullText =>
      'This app does not collect, process, or store any personal data as defined by the GDPR. All data (favorites, history, settings) is stored exclusively locally on your device and is never transmitted to third parties or external servers. No analytics, tracking, or advertising services are used. No data is shared with third parties. When the app is deleted, all locally stored data is removed.';

  @override
  String get licenses => 'Open Source Licenses';

  @override
  String get version => 'Version';

  @override
  String get dataSource => 'Data Source';

  @override
  String get classification => 'Classification:';

  @override
  String get publisher => 'Publisher:';

  @override
  String get germanTranslation => 'German version:';

  @override
  String get dataVersion => 'Data version:';

  @override
  String get disclaimer => 'Disclaimer';

  @override
  String get disclaimerText =>
      'This app serves solely as a reference tool and does not replace professional medical advice or clinical assessment. The content is based on the WHO ICF in the German translation by BfArM. No guarantee is given for the accuracy and completeness of the information.';

  @override
  String get copyright => 'Copyright';

  @override
  String get copyrightText =>
      'The ICF is the intellectual property of the World Health Organization (WHO). The German translation was produced and published by the Federal Institute for Drugs and Medical Devices (BfArM, formerly DIMDI). The use of ICF content in this app is for informational purposes.';

  @override
  String get all => 'All';

  @override
  String get barrier => 'Barrier';

  @override
  String get facilitator => 'Facilitator';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyText =>
      'This app stores your favorites and history locally on your device only. No data is transmitted to external servers. No usage analytics are collected.';

  @override
  String get privacyAccept => 'Understood';

  @override
  String get guideTitle => 'ICF Guide';

  @override
  String get guideWhatIsIcf => 'What is the ICF?';

  @override
  String get guideWhatIsIcfText =>
      'The ICF (International Classification of Functioning, Disability and Health) is the WHO\'s international classification for describing health and health-related states. It provides a unified language and framework for describing functioning, disability and health.\n\nUnlike the ICD (International Classification of Diseases), which classifies diagnoses, the ICF describes the impact of health conditions on a person\'s daily life.';

  @override
  String get guideWhatFor => 'What is the ICF used for?';

  @override
  String get guideWhatForText =>
      'The ICF is used in many areas of health and social services:';

  @override
  String get guideUse1 =>
      'Rehabilitation: Documenting functional limitations and therapy goals';

  @override
  String get guideUse2 =>
      'Social medicine: Assessing participation restrictions';

  @override
  String get guideUse3 => 'Care: Evaluating support needs';

  @override
  String get guideUse4 =>
      'Research: Comparable description of health conditions';

  @override
  String get guideUse5 =>
      'Health policy: Planning and evaluating healthcare services';

  @override
  String get guideStructure => 'Structure of the ICF';

  @override
  String get guideStructureText =>
      'The ICF is organized into four domains. Each domain has chapters, categories and sub-categories:';

  @override
  String get guideDomainB => 'Physiological and psychological body functions';

  @override
  String get guideDomainS => 'Anatomical parts of the body (organs, limbs)';

  @override
  String get guideDomainD => 'Execution of tasks and actions in daily life';

  @override
  String get guideDomainE => 'Physical, social and attitudinal environment';

  @override
  String get guideHowToRead => 'How to read an ICF code?';

  @override
  String get guideHowToReadText =>
      'Each ICF code consists of a letter (domain) and digits (chapter, category, sub-category):';

  @override
  String get guideDomain => 'Domain';

  @override
  String get guideChapter => 'Chapter';

  @override
  String get guideCategory => 'Category';

  @override
  String get guideSubCategory => 'Sub-cat.';

  @override
  String get guideCodeExample =>
      'b1140 = Orientation to time\n(b = Body Functions, 1 = Mental Functions,\n14 = Orientation, 0 = to time)';

  @override
  String get guideQualifiers => 'Qualifiers';

  @override
  String get guideQualifiersText =>
      'Qualifiers indicate the severity of a problem. They are appended to the code with a dot:';

  @override
  String get guideQualifierExample => 'Example:';

  @override
  String get guideQualifierExampleDesc =>
      'Mobility of joint functions (b710)\nwith moderate problem (.2 = 25–49%)';

  @override
  String get guideEnvQualifiers => 'Coding Environmental Factors';

  @override
  String get guideEnvQualifiersText =>
      'Environmental factors can act as barriers (hindering) or facilitators (supporting). Barriers are coded with a dot, facilitators with a plus sign:';

  @override
  String get guideBarrierExample =>
      'e150.3 = Building accessibility is a severe barrier';

  @override
  String get guideFacilitatorExample =>
      'e120+4 = Mobility aids are a complete facilitator';

  @override
  String get guidePractice1Title => 'Example: Knee Surgery (Orthopaedics)';

  @override
  String get guidePractice1Text =>
      'A 58-year-old patient after knee replacement in rehabilitation:';

  @override
  String get guidePractice1Code1 => 'Joint mobility – moderate problem';

  @override
  String get guidePractice1Code2 => 'Pain sensation – mild problem';

  @override
  String get guidePractice1Code3 => 'Walking – moderate problem';

  @override
  String get guidePractice1Code4 => 'Washing oneself – no problem';

  @override
  String get guidePractice1Code5 => 'Mobility aids – severe facilitator';

  @override
  String get guidePractice1Code6 => 'Health services – moderate facilitator';

  @override
  String get guidePractice2Title => 'Example: Depression (Psychiatry)';

  @override
  String get guidePractice2Text =>
      'A 34-year-old patient with moderate depressive episode, unable to work for 6 months:';

  @override
  String get guidePractice2Code1 => 'Energy and drive – severe problem';

  @override
  String get guidePractice2Code2 => 'Emotional functions – severe problem';

  @override
  String get guidePractice2Code3 => 'Sleep – moderate problem';

  @override
  String get guidePractice2Code4 => 'Handling stress – moderate problem';

  @override
  String get guidePractice2Code5 =>
      'General interpersonal interactions – severe problem';

  @override
  String get guidePractice2Code6 =>
      'Remunerative employment – complete problem';

  @override
  String get guidePractice2Code7 => 'Family – severe facilitator';

  @override
  String get guidePractice2Code8 => 'Health services – moderate facilitator';

  @override
  String get guidePractice2Code9 => 'Societal attitudes – moderate barrier';

  @override
  String get guidePractice3Title => 'Example: Stroke (Neurology)';

  @override
  String get guidePractice3Text =>
      'A 72-year-old patient 4 weeks after ischaemic stroke with right-sided hemiparesis:';

  @override
  String get guidePractice3Code1 =>
      'Mental functions of language – moderate problem';

  @override
  String get guidePractice3Code2 =>
      'Muscle power – severe problem (right side)';

  @override
  String get guidePractice3Code3 => 'Articulation – moderate problem';

  @override
  String get guidePractice3Code4 => 'Brain structure – severe impairment';

  @override
  String get guidePractice3Code5 => 'Speaking – severe problem';

  @override
  String get guidePractice3Code6 => 'Fine hand use – severe problem';

  @override
  String get guidePractice3Code7 => 'Eating – mild problem';

  @override
  String get guidePractice3Code8 =>
      'Assistive products for daily living – severe facilitator';

  @override
  String get guidePractice3Code9 =>
      'Personal care providers – complete facilitator';

  @override
  String get guidePractice3Code10 => 'Health services – severe facilitator';

  @override
  String subCategoriesCount(int count) {
    return '$count sub-categories';
  }

  // --- Onboarding ---
  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingStart => 'Get Started';

  @override
  String get onboardingWelcomeTitle => 'Welcome to\nICF Classification';

  @override
  String get onboardingWelcomeText =>
      'Your comprehensive reference for the International Classification of Functioning, Disability and Health (ICF) by the WHO – fully available offline.';

  @override
  String get onboardingDomainsTitle => 'Four Domains';

  @override
  String get onboardingDomainsText =>
      'The ICF is organized into four areas. Navigate easily via the tabs at the bottom of the screen.';

  @override
  String get onboardingSearchTitle => 'Search & Details';

  @override
  String get onboardingSearchText =>
      'Quickly find any ICF code via the search bar – by code or keyword.';

  @override
  String get onboardingSearchTip1 =>
      'Tap on a code to see details, descriptions and hierarchy';

  @override
  String get onboardingSearchTip2 =>
      'Inclusion and exclusion notes help with correct classification';

  @override
  String get onboardingQualifierTitle => 'Qualifier Builder';

  @override
  String get onboardingQualifierText =>
      'Build ICF codes with qualifiers directly in the app – including severity selection.';

  @override
  String get onboardingQualifierExample => 'Example:';

  @override
  String get onboardingQualifierExampleDesc =>
      'b710.2 = Mobility of joint functions with moderate problem (25–49%)';

  @override
  String get onboardingFavoritesTitle => 'Favorites & Export';

  @override
  String get onboardingFavoritesText =>
      'Save frequently used codes as favorites and export them as PDF.';

  @override
  String get onboardingFavoritesTip1 =>
      'Tap the heart icon to save codes';

  @override
  String get onboardingFavoritesTip2 =>
      'Export your favorites collection as a PDF document';

  @override
  String get onboardingPrivacyNote =>
      '100% offline – your data stays on your device';

  // --- Privacy Policy ---
  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyLastUpdated => 'Last updated: March 2026';

  @override
  String get privacyPolicyOverviewTitle => 'Overview';

  @override
  String get privacyPolicyOverviewText =>
      'Protecting your personal data is important to us. This privacy policy explains how the app "ICF Classification" handles your data. The data controller under GDPR is Mirko Richter, Stillerzeile 29, 12587 Berlin, Germany.';

  @override
  String get privacyPolicyDataTitle => 'Local Data Storage';

  @override
  String get privacyPolicyDataText =>
      'The app stores the following data exclusively on your device:\n\n• Favorites: ICF codes you have saved\n• History: Recently viewed codes (max. 20 entries)\n• Settings: Selected theme (light/dark/system) and language (DE/EN)\n\nThis data is stored via SharedPreferences in your device\'s app sandbox and is not accessible by other apps. All data is automatically deleted when the app is uninstalled.';

  @override
  String get privacyPolicyNoCollectionTitle => 'No Data Collection';

  @override
  String get privacyPolicyNoCollectionText =>
      'This app:\n\n• Does not collect any personal data\n• Does not transmit data to external servers\n• Does not use analytics or tracking services\n• Does not use cookies or similar technologies\n• Does not display advertisements\n• Does not contain social media plugins\n\nThe app works completely offline. No internet connection is required.';

  @override
  String get privacyPolicyPermissionsTitle => 'App Permissions';

  @override
  String get privacyPolicyPermissionsText =>
      'The app does not require any special device permissions. Only for PDF export and the share function are the standard system dialogs provided by the operating system used.';

  @override
  String get privacyPolicyChildrenTitle => 'Children';

  @override
  String get privacyPolicyChildrenText =>
      'Since this app does not collect any personal data, there are no special risks for children. The app can safely be used by people of any age.';

  @override
  String get privacyPolicyRightsTitle => 'Your Rights (GDPR)';

  @override
  String get privacyPolicyRightsText =>
      'Since no personal data is collected, the typical data subject rights under Art. 15–21 GDPR (access, rectification, erasure, etc.) do not apply in practice. If you have any questions about data protection, you can contact us at any time.';

  @override
  String get privacyPolicyContactTitle => 'Contact';

  @override
  String get privacyPolicyContactText =>
      'For data protection inquiries, please contact:\n\nMirko Richter\nEmail: mirko.richter@eingliederungshilfe.cloud';

  // --- Terms of Service ---
  @override
  String get termsOfServiceTitle => 'Terms of Service';

  @override
  String get termsLastUpdated => 'Last updated: March 2026';

  @override
  String get termsAcceptanceTitle => 'Scope';

  @override
  String get termsAcceptanceText =>
      'By using the app "ICF Classification", you agree to these terms of service. The app is provided by Mirko Richter, Stillerzeile 29, 12587 Berlin, Germany.';

  @override
  String get termsUsageTitle => 'Intended Use';

  @override
  String get termsUsageText =>
      'The app serves exclusively as a reference tool and information source for the WHO ICF classification. It is intended for healthcare and social service professionals, students and interested parties. Use is at your own responsibility.';

  @override
  String get termsIntellectualPropertyTitle => 'Intellectual Property';

  @override
  String get termsIntellectualPropertyText =>
      'The ICF is the intellectual property of the World Health Organization (WHO). The German translation was produced by the Federal Institute for Drugs and Medical Devices (BfArM, formerly DIMDI). The use of ICF content in this app is for informational and reference purposes. Commercial redistribution of the content is not permitted.';

  @override
  String get termsMedicalDisclaimerTitle => 'Medical Disclaimer';

  @override
  String get termsMedicalDisclaimerText =>
      'This app is not a medical device within the meaning of EU Regulation 2017/745 (MDR). It does not make diagnoses, give therapy recommendations, or make clinical decisions. The app does not replace professional assessment by qualified healthcare personnel. For health-related questions, consult a doctor or other qualified professional.';

  @override
  String get termsLiabilityTitle => 'Limitation of Liability';

  @override
  String get termsLiabilityText =>
      'The content of the app is created with the greatest possible care. However, no guarantee is given for the accuracy, completeness and timeliness of the information provided. Use of the app is at your own risk. Claims for damages are excluded to the extent permitted by law.';

  @override
  String get termsChangesTitle => 'Changes';

  @override
  String get termsChangesText =>
      'These terms of service may be updated at any time. Changes take effect with the release of a new app version. Significant changes will be noted in the app update.';

  @override
  String get termsContactTitle => 'Contact';

  @override
  String get termsContactText =>
      'For questions about these terms of service, please contact:\n\nMirko Richter\nEmail: mirko.richter@eingliederungshilfe.cloud';
}
