/// Complete ICF detailed descriptions for all codes
/// Source: BfArM ICF German version 2005
/// https://klassifikationen.bfarm.de/icf/icfhtml2005/

class IcfDetail {
  final String title;
  final String description;
  final List<String> inclusions;
  final List<String> exclusions;

  const IcfDetail({
    required this.title,
    this.description = '',
    this.inclusions = const [],
    this.exclusions = const [],
  });
}

const Map<String, IcfDetail> icfAllDetails = {

  // ===========================================================================
  // b - KOERPERFUNKTIONEN (Body Functions)
  // ===========================================================================


  // ===========================================================================
  // KAPITEL b1: MENTALE FUNKTIONEN
  // ===========================================================================

  // ---------------------------------------------------------------------------
  // Globale mentale Funktionen (b110-b139)
  // ---------------------------------------------------------------------------

  'b110': IcfDetail(
    title: 'Funktionen des Bewusstseins',
    description:
        'Allgemeine mentale Funktionen, die die bewusste Wahrnehmung und Wachheit einschliesslich Klarheit und Kontinuität des Wachheitszustandes betreffen.',
    inclusions: [
      'Funktionen, die Zustand, Kontinuität und Qualität des Bewusstseins betreffen',
      'Bewusstseinsverlust, Koma, vegetativer Status (Apallisches Syndrom)',
      'Dämmerzustand (Fugü), Trance, Besessenheit',
      'Drogeninduzierte Bewusstseinsveränderungen, Delir, Stupor',
    ],
    exclusions: [
      'Funktionen der Orientierung (b114)',
      'Funktionen der psychischen Energie und des Antriebs (b130)',
      'Funktionen des Schlafes (b134)',
    ],
  ),

  'b1100': IcfDetail(
    title: 'Bewusstseinszustand',
    description:
        'Mentale Funktionen, die sich bei Veränderung als Zustände wie Bewusstseinstrübung, Stupor oder Koma äussern.',
  ),

  'b1101': IcfDetail(
    title: 'Kontinuität des Bewusstseins',
    description:
        'Mentale Funktionen, die sich in Erhalt der Wachheit, Aufmerksamkeit und bewusster Wahrnehmung äussern und die bei einer Störung zu Dämmerzustand (Fugü), Trance oder ähnlichen Zuständen führen können.',
  ),

  'b1102': IcfDetail(
    title: 'Qualität des Bewusstseins',
    description:
        'Mentale Funktionen, die sich bei Veränderungen auf die Art des Empfindens von Wachheit, Aufmerksamkeit und bewusster Wahrnehmung auswirken, wie drogeninduzierte Bewusstseinsveränderungen oder ein Delir.',
  ),

  'b1108': IcfDetail(
    title: 'Funktionen des Bewusstseins, anders bezeichnet',
  ),

  'b1109': IcfDetail(
    title: 'Funktionen des Bewusstseins, nicht näher bezeichnet',
  ),

  // --- b114 Funktionen der Orientierung ---

  'b114': IcfDetail(
    title: 'Funktionen der Orientierung',
    description:
        'Allgemeine mentale Funktionen, die Selbstwahrnehmung, Ich-Bewusstsein und realistische Wahrnehmung anderer Personen sowie der Zeit und der Umgebung betreffen.',
    inclusions: [
      'Funktionen der Orientierung zu Zeit, Ort und Person',
      'Funktionen der Orientierung zur eigenen Person und zu anderen Personen',
      'Desorientierung zu Zeit, Ort und Person',
    ],
    exclusions: [
      'Funktionen des Bewusstseins (b110)',
      'Funktionen der Aufmerksamkeit (b140)',
      'Funktionen des Gedächtnisses (b144)',
    ],
  ),

  'b1140': IcfDetail(
    title: 'Orientierung zur Zeit',
    description:
        'Mentale Funktionen, die sich im bewussten Gewahrsein von Wochentag, Datum, Tag, Monat und Jahr äussern.',
  ),

  'b1141': IcfDetail(
    title: 'Orientierung zum Ort',
    description:
        'Mentale Funktionen, die sich im bewussten Gewahrsein der örtlichen Situation äussern, z.B. in welcher unmittelbaren Umgebung, in welcher Stadt oder in welchem Land man sich befindet.',
  ),

  'b1142': IcfDetail(
    title: 'Orientierung zur Person',
    description:
        'Mentale Funktionen, die sich im bewussten Gewahrsein der eigenen Identität und von Personen in der unmittelbaren Umgebung äussern.',
  ),

  'b11420': IcfDetail(
    title: 'Orientierung zum eigenen Selbst',
    description:
        'Mentale Funktionen, die sich im bewussten Gewahrsein der eigenen Identität äussern.',
  ),

  'b11421': IcfDetail(
    title: 'Orientierung zu anderen Personen',
    description:
        'Mentale Funktionen, die sich im bewussten Gewahrsein von Personen in der unmittelbaren Umgebung äussern.',
  ),

  'b11428': IcfDetail(
    title: 'Orientierung zu Personen, anders bezeichnet',
  ),

  'b11429': IcfDetail(
    title: 'Orientierung zu Personen, nicht näher bezeichnet',
  ),

  'b1148': IcfDetail(
    title: 'Funktionen der Orientierung, anders bezeichnet',
  ),

  'b1149': IcfDetail(
    title: 'Funktionen der Orientierung, nicht näher bezeichnet',
  ),

  // --- b117 Funktionen der Intelligenz ---

  'b117': IcfDetail(
    title: 'Funktionen der Intelligenz',
    description:
        'Allgemeine mentale Funktionen, die erforderlich sind, die verschiedenen mentalen Funktionen einschliesslich aller kognitiven Funktionen zu verstehen und konstruktiv zu integrieren sowie diese über die gesamte Lebensdaür hinweg fortzüntwickeln.',
    inclusions: [
      'Die Intelligenzentwicklung betreffende Funktionen',
      'Intellektülle und mentale Retardierung, Demenz',
    ],
    exclusions: [
      'Funktionen des Gedächtnisses (b144)',
      'Funktionen des Denkens (b160)',
      'Höhere kognitive Funktionen (b164)',
    ],
  ),

  // --- b122 Globale psychosoziale Funktionen ---

  'b122': IcfDetail(
    title: 'Globale psychosoziale Funktionen',
    description:
        'Sich über das gesamte Leben entwickelnde allgemeine mentale Funktionen, die für das Verständnis und die konstruktive Integration jener mentalen Funktionen erforderlich sind, die zur Bildung interpersoneller Fähigkeiten führen, welche für den Aufbau reziproker sozialer Interaktionen, die sinnvoll und zweckmässig sind, benötigt werden.',
    inclusions: [
      'Störungen wie bei Autismus',
    ],
  ),

  // --- b126 Funktionen von Temperament und Persoenlichkeit ---

  'b126': IcfDetail(
    title: 'Funktionen von Temperament und Persönlichkeit',
    description:
        'Allgemeine mentale Funktionen, die das anlagebedingte Naturell einer Person betreffen, individüll auf Situationen zu reagieren, einschliesslich der psychischen Charakteristika, die eine Person von einer anderen unterscheiden.',
    inclusions: [
      'Funktionen, die Extraversion, Introversion, Umgänglichkeit, Gewissenhaftigkeit betreffen',
      'Psychische und emotionale Stabilität, Offenheit gegenüber Erfahrungen',
      'Optimismus, Neugier, Vertraün und Zuverlässigkeit',
    ],
    exclusions: [
      'Funktionen der Intelligenz (b117)',
      'Funktionen der psychischen Energie und des Antriebs (b130)',
      'Psychomotorische Funktionen (b147)',
      'Emotionale Funktionen (b152)',
    ],
  ),

  'b1260': IcfDetail(
    title: 'Extraversion',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Kontaktfreudigkeit, Geselligkeit und (emotionale) Ausdrucksfähigkeit gekennzeichnet ist, im Gegensatz zu Schüchternheit, Zurückgezogenheit oder Gehemmtheit.',
  ),

  'b1261': IcfDetail(
    title: 'Umgänglichkeit',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Kooperationsbereitschaft, Freundschaftlichkeit und Zuvorkommenheit gekennzeichnet ist, im Gegensatz zu Unfreundlichkeit, Streitbarkeit und Aufsässigkeit.',
  ),

  'b1262': IcfDetail(
    title: 'Gewissenhaftigkeit',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Fleiss, Genauigkeit und Sorgfalt gekennzeichnet ist, im Gegensatz zu Faulheit, Unzuverlässigkeit und Verantwortungslosigkeit.',
  ),

  'b1263': IcfDetail(
    title: 'Psychische Stabilität',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Ausgeglichenheit, Ruhe und Gefasstheit gekennzeichnet ist, im Gegensatz zu Reizbarkeit, Besorgtheit, Unbeständigkeit und Launenhaftigkeit.',
  ),

  'b1264': IcfDetail(
    title: 'Offenheit gegenüber neün Erfahrungen',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Neugier, Vorstellungsvermögen und Suche nach Erfahrungen gekennzeichnet ist, im Gegensatz zu Abgestumpftheit, Unaufmerksamkeit und emotionaler Ausdruckslosigkeit.',
  ),

  'b1265': IcfDetail(
    title: 'Optimismus',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Heiterkeit, Lebhaftigkeit und Zuversichtlichkeit gekennzeichnet ist, im Gegensatz zu Niedergeschlagenheit, Trübsinn und Verzweiflung.',
  ),

  'b1266': IcfDetail(
    title: 'Selbstvertraün',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Selbstsicherheit, Mut und Durchsetzungsvermögen gekennzeichnet ist, im Gegensatz zu Zaghaftigkeit, Unsicherheit und Zurückhaltung.',
  ),

  'b1267': IcfDetail(
    title: 'Zuverlässigkeit',
    description:
        'Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Verlässlichkeit und Prinzipientreü gekennzeichnet ist, im Gegensatz zu Hinterlistigkeit und unsozialem Verhalten.',
  ),

  'b1268': IcfDetail(
    title: 'Funktionen von Temperament und Persönlichkeit, anders bezeichnet',
  ),

  'b1269': IcfDetail(
    title: 'Funktionen von Temperament und Persönlichkeit, nicht näher bezeichnet',
  ),

  // --- b130 Funktionen der psychischen Energie und des Antriebs ---

  'b130': IcfDetail(
    title: 'Funktionen der psychischen Energie und des Antriebs',
    description:
        'Allgemeine mentale Funktionen, die physiologische und psychologische Vorgänge betreffen, welche bei einer Person ein nachhaltiges Streben nach Befriedigung bestimmter Bedürfnisse und die Verfolgung allgemeiner Ziele verursachen.',
    inclusions: [
      'Funktionen, die psychische Energie, Motivation, Appetit betreffen',
      'Sucht (einschliesslich Sucht nach Substanzen, die zu einer Abhängigkeit führen)',
      'Impulskontrolle',
    ],
    exclusions: [
      'Funktionen des Bewusstseins (b110)',
      'Funktionen von Temperament und Persönlichkeit (b126)',
      'Funktionen des Schlafes (b134)',
      'Psychomotorische Funktionen (b147)',
      'Emotionale Funktionen (b152)',
    ],
  ),

  'b1300': IcfDetail(
    title: 'Ausmass der psychischen Energie',
    description:
        'Mentale Funktionen, die sich in Durchsetzungskraft und Durchhaltevermögen äussern.',
  ),

  'b1301': IcfDetail(
    title: 'Motivation',
    description:
        'Mentale Funktionen, die sich in einem Anreiz zu handeln und in einer bewussten oder unbewussten Antriebskraft zu Handlungen äussern.',
  ),

  'b1302': IcfDetail(
    title: 'Appetit',
    description:
        'Mentale Funktionen, die sich in einem natürlichen Verlangen oder einem Wunsch äussern, insbesondere das natürliche und wiederkehrende Verlangen nach Essen und Trinken.',
  ),

  'b1303': IcfDetail(
    title: 'Drang nach Suchtmitteln',
    description:
        'Mentale Funktionen, die sich in einem Drang äussern, Substanzen zu konsumieren einschliesslich solcher, die zu Missbrauch führen können.',
  ),

  'b1304': IcfDetail(
    title: 'Impulskontrolle',
    description:
        'Mentale Funktionen, die plötzliche intensive Handlungsimpulse regulieren und unterdrücken.',
  ),

  'b1308': IcfDetail(
    title: 'Funktionen der psychischen Energie und des Antriebs, anders bezeichnet',
  ),

  'b1309': IcfDetail(
    title: 'Funktionen der psychischen Energie und des Antriebs, nicht näher bezeichnet',
  ),

  // --- b134 Funktionen des Schlafes ---

  'b134': IcfDetail(
    title: 'Funktionen des Schlafes',
    description:
        'Allgemeine mentale Funktionen, die sich in einer periodischen, reversiblen und selektiven physischen und mentalen Loslösung von der unmittelbaren Umgebung äussern, und die von charakteristischen physiologischen Veränderungen begleitet sind.',
    inclusions: [
      'Funktionen, die Schlafdaür, Schlafbeginn betreffen',
      'Aufrechterhaltung des Schlafs, Schlafqualität, Schlafzyklus',
      'Insomnie, Hypersomnie, Narkolepsie',
    ],
    exclusions: [
      'Funktionen des Bewusstseins (b110)',
      'Funktionen der psychischen Energie und des Antriebs (b130)',
      'Funktionen der Aufmerksamkeit (b140)',
      'Psychomotorische Funktionen (b147)',
    ],
  ),

  'b1340': IcfDetail(
    title: 'Schlafdaür',
    description:
        'Mentale Funktionen, die an der Zeit, die im diurnalen oder circadianen Zyklus im Schlaf verbracht wird, beteiligt sind.',
  ),

  'b1341': IcfDetail(
    title: 'Schlafbeginn',
    description:
        'Mentale Funktionen, die sich in einem Übergang zwischen Wachheit und Schlaf äussern.',
  ),

  'b1342': IcfDetail(
    title: 'Aufrechterhaltung des Schlafes',
    description:
        'Mentale Funktionen, die sich im Durchschlafvermögen äussern.',
  ),

  'b1343': IcfDetail(
    title: 'Schlafqualität',
    description:
        'Mentale Funktionen, die sich in einem natürlichen Schlaf mit einer optimalen physischen und geistigen Erholung und Entspannung äussern.',
  ),

  'b1344': IcfDetail(
    title: 'Am Schlafzyklus beteiligte Funktionen',
    description:
        'Mentale Funktionen, die sich in Rapid Eye Movements (REM)-Schlaf (verbunden mit Träumen) und in Non-Rapid Eye Movement Sleep (NREM) äussern.',
  ),

  'b1348': IcfDetail(
    title: 'Funktionen des Schlafes, anders bezeichnet',
  ),

  'b1349': IcfDetail(
    title: 'Funktionen des Schlafes, nicht näher bezeichnet',
  ),

  'b139': IcfDetail(
    title: 'Globale mentale Funktionen, anders oder nicht näher bezeichnet',
  ),

  // ---------------------------------------------------------------------------
  // Spezifische mentale Funktionen (b140-b189)
  // ---------------------------------------------------------------------------

  // --- b140 Funktionen der Aufmerksamkeit ---

  'b140': IcfDetail(
    title: 'Funktionen der Aufmerksamkeit',
    description:
        'Spezifische mentale Funktionen, die die Fokussierung auf einen externen Reiz oder auf innere Vorgänge für eine geforderte Zeitspanne betreffen.',
    inclusions: [
      'Daüraufmerksamkeit',
      'Wechsel der Aufmerksamkeit',
      'Geteilte Aufmerksamkeit',
      'Mit anderen geteilte Aufmerksamkeit',
      'Konzentration',
      'Ablenkbarkeit',
    ],
    exclusions: [
      'Funktionen des Bewusstseins (b110)',
      'Funktionen der psychischen Energie und des Antriebs (b130)',
      'Funktionen des Schlafes (b134)',
      'Funktionen des Gedächtnisses (b144)',
      'Psychomotorische Funktionen (b147)',
      'Funktionen der Wahrnehmung (b156)',
    ],
  ),

  'b1400': IcfDetail(
    title: 'Daüraufmerksamkeit',
    description:
        'Mentale Funktionen, die sich in der Konzentration über eine geforderte Zeitspanne äussern.',
  ),

  'b1401': IcfDetail(
    title: 'Wechsel oder Lenkung der Aufmerksamkeit',
    description:
        'Mentale Funktionen, die die Umlenkung der Konzentration von einem Reiz auf einen anderen zulassen.',
  ),

  'b1402': IcfDetail(
    title: 'Geteilte Aufmerksamkeit',
    description:
        'Mentale Funktionen, die die gleichzeitige Fokussierung auf zwei oder mehr Reize zulassen.',
  ),

  'b1403': IcfDetail(
    title: 'Mit anderen geteilte Aufmerksamkeit',
    description:
        'Mentale Funktionen, die die Fokussierung auf denselben Reiz durch zwei oder mehr Personen zulassen, wenn z.B. ein Kind und ein Betreür sich gemeinsam auf ein Spielzeug konzentrieren.',
  ),

  'b1408': IcfDetail(
    title: 'Funktionen der Aufmerksamkeit, anders bezeichnet',
  ),

  'b1409': IcfDetail(
    title: 'Funktionen der Aufmerksamkeit, nicht näher bezeichnet',
  ),

  // --- b144 Funktionen des Gedaechtnisses ---

  'b144': IcfDetail(
    title: 'Funktionen des Gedächtnisses',
    description:
        'Spezifische mentale Funktionen, die die adäquate Registrierung, die Speicherung und den Abruf von Informationen betreffen.',
    inclusions: [
      'Kurzzeitgedächtnis und Langzeitgedächtnis',
      'Sofort-, Frisch- und Altgedächtnis',
      'Gedächtnisspanne und Abrufen',
      'Funktionen beim Wiedererkennen und Lernen',
      'Nominale, selektive und dissoziative Amnesie',
    ],
    exclusions: [
      'Funktionen des Bewusstseins (b110)',
      'Funktionen der Orientierung (b114)',
      'Funktionen der Intelligenz (b117)',
      'Funktionen der Aufmerksamkeit (b140)',
      'Funktionen der Wahrnehmung (b156)',
      'Funktionen des Denkens (b160)',
      'Höhere kognitive Funktionen (b164)',
      'Kognitiv-sprachliche Funktionen (b172)',
    ],
  ),

  'b1440': IcfDetail(
    title: 'Kurzzeitgedächtnis',
    description:
        'Mentale Funktionen, die sich in einer vorübergehenden, störbaren Gedächtnisspeicherung von etwa 30 Sekunden äussern. Aus diesem Speicher gehen Informationen verloren, wenn sie nicht im Langzeitgedächtnis verankert werden.',
  ),

  'b1441': IcfDetail(
    title: 'Langzeitgedächtnis',
    description:
        'Mentale Funktionen, die sich in einem Gedächtnissystem zur langzeitigen Übernahme von Informationen aus dem Kurzzeitgedächtnis und zum Abruf dieser Informationen äussern. Es gibt zwei unterschiedliche Formen des Langzeitgedächtnisses: ein autobiographisches (für Ereignisse der Vergangenheit) und semantisches (für Sprache und Sachverhalte).',
  ),

  'b1442': IcfDetail(
    title: 'Abrufen von Gedächtnisinhalten',
    description:
        'Spezifische mentale Funktionen, die das Erinnern von Informationen aus dem Langzeitgedächtnis und zur Überleitung ins Bewusstsein betreffen.',
  ),

  'b1448': IcfDetail(
    title: 'Funktionen des Gedächtnisses, anders bezeichnet',
  ),

  'b1449': IcfDetail(
    title: 'Funktionen des Gedächtnisses, nicht näher bezeichnet',
  ),

  // --- b147 Psychomotorische Funktionen ---

  'b147': IcfDetail(
    title: 'Psychomotorische Funktionen',
    description:
        'Spezifische mentale Funktionen, die die Kontrolle über motorische und psychologische Vorgänge auf körperlicher Ebene betreffen.',
    inclusions: [
      'Psychomotorische Kontrolle',
      'Psychomotorische Retardierung',
      'Erregung und Agitiertheit',
      'Katatonie, Negativismus, Ambitendenz',
      'Echopraxie und Echolalie',
      'Qualität der psychomotorischen Funktionen',
    ],
    exclusions: [
      'Funktionen des Bewusstseins (b110)',
      'Funktionen der Orientierung (b114)',
      'Funktionen der Intelligenz (b117)',
      'Funktionen der psychischen Energie und des Antriebs (b130)',
      'Funktionen der Aufmerksamkeit (b140)',
      'Kognitiv-sprachliche Funktionen (b167)',
      'Mentale Funktionen, die die Durchführung komplexer Bewegungshandlungen betreffen (b176)',
    ],
  ),

  'b1470': IcfDetail(
    title: 'Psychomotorische Kontrolle',
    description:
        'Mentale Funktionen, die Tempo des Verhaltens oder Reaktionszeiten regulieren und an denen sowohl motorische als auch psychologische Komponenten beteiligt sind. Störungen der Kontrolle führen zu einer psychomotorischen Retardierung (langsames Sprechen und Bewegen, Verminderung von Gestik und spontanen Bewegungen). Störungen der Kontrolle können auch zu psychomotorischer Erregung führen (überschiessendes Verhalten oder überschiessende kognitive Aktivitäten, die im Allgemeinen unproduktiv sind und auf einer inneren Anspannung beruhen, wie Klopfen mit den Füssen, ständiges Händereiben, agitiertes Verhalten und Ruhelosigkeit).',
  ),

  'b1471': IcfDetail(
    title: 'Qualität der psychomotorischen Funktionen',
    description:
        'Mentale Funktionen, die sich in einer angemessenen Abfolge und Art der Teilkomponenten nicht-verbalen Verhaltens äussern, wie Augen- und Handkoordination oder Gang.',
  ),

  'b1478': IcfDetail(
    title: 'Psychomotorische Funktionen, anders bezeichnet',
  ),

  'b1479': IcfDetail(
    title: 'Psychomotorische Funktionen, nicht näher bezeichnet',
  ),

  // --- b152 Emotionale Funktionen ---

  'b152': IcfDetail(
    title: 'Emotionale Funktionen',
    description:
        'Spezifische mentale Funktionen, die im Zusammenhang mit Gefühlen und den affektiven Komponenten von Bewusstseinsprozessen stehen.',
    inclusions: [
      '(Situations)Angemessenheit der Emotion',
      'Affektive Kontrolle und Schwingungsfähigkeit',
      'Affekt',
      'Traür, Glück, Liebe, Furcht, Ärger, Hass',
      'Anspannung, Angst, Freude, Sorgen',
      'Emotionale Labilität',
      'Affektverflachung',
    ],
    exclusions: [
      'Funktionen von Temperament und Persönlichkeit (b126)',
      'Funktionen der psychischen Energie und des Antriebs (b130)',
    ],
  ),

  'b1520': IcfDetail(
    title: '(Situations)Angemessenheit der Emotion',
    description:
        'Mentale Funktionen, die sich in der Übereinstimmung des Gefühls oder des Affektes mit der Situation äussern, wie Glücksgefühl, wenn man gute Nachrichten erhält.',
  ),

  'b1521': IcfDetail(
    title: 'Affektkontrolle',
    description:
        'Mentale Funktion, die Erleben und Ausdruck von Affekten kontrolliert.',
  ),

  'b1522': IcfDetail(
    title: 'Spannweite von Emotionen',
    description:
        'Mentale Funktionen, die sich im Spektrum von Gefühlsregungen oder Gefühlen äussern, wie Liebe, Hass, Angst, Sorgen, Freude, Furcht und Ärger.',
  ),

  'b1528': IcfDetail(
    title: 'Emotionale Funktionen, anders bezeichnet',
  ),

  'b1529': IcfDetail(
    title: 'Emotionale Funktionen, nicht näher bezeichnet',
  ),

  // --- b156 Funktionen der Wahrnehmung ---

  'b156': IcfDetail(
    title: 'Funktionen der Wahrnehmung',
    description:
        'Spezifische mentale Funktionen, die die Erkennung und Interpretation sensorischer Reize betreffen.',
    inclusions: [
      'Visülle Wahrnehmung',
      'Auditive Wahrnehmung',
      'Olfaktorische Wahrnehmung',
      'Gustatorische Wahrnehmung',
      'Taktile Wahrnehmung',
      'Räumlich-visülle Wahrnehmung',
      'Halluzination oder Illusion',
    ],
    exclusions: [
      'Funktionen des Bewusstseins (b110)',
      'Funktionen der Orientierung (b114)',
      'Funktionen der Aufmerksamkeit (b140)',
      'Funktionen des Gedächtnisses (b144)',
      'Kognitiv-sprachliche Funktionen (b167)',
      'Seh- und verwandte Funktionen (b210-b229)',
      'Hör- und Vestibularfunktionen (b230-b249)',
      'Weitere Sinnesfunktionen (b250-b279)',
    ],
  ),

  'b1560': IcfDetail(
    title: 'Auditive Wahrnehmung',
    description:
        'Mentale Funktionen, die an der Unterscheidung von Geräuschen, Tönen, Tonhöhe und anderen auditiven Reizen beteiligt sind.',
  ),

  'b1561': IcfDetail(
    title: 'Visülle Wahrnehmung',
    description:
        'Mentale Funktionen, die an der Unterscheidung von Form, Grösse, Farbe und anderen visüllen Reizen beteiligt sind.',
  ),

  'b1562': IcfDetail(
    title: 'Geruchswahrnehmung',
    description:
        'Mentale Funktionen, die an der Erkennung unterschiedlicher Gerüche beteiligt sind.',
  ),

  'b1563': IcfDetail(
    title: 'Geschmackswahrnehmung',
    description:
        'Mentale Funktionen, die an der Unterscheidung von Geschmackseigenschaften wie süss, saür, salzig und bitter auf der Zunge beteiligt sind.',
  ),

  'b1564': IcfDetail(
    title: 'Taktile Wahrnehmung',
    description:
        'Mentale Funktionen, die an der Differenzierung der Beschaffenheit von Oberflächen wie rau oder glatt durch Berührung beteiligt sind.',
  ),

  'b1565': IcfDetail(
    title: 'Räumlich-visülle Wahrnehmung',
    description:
        'Mentale Funktion, die am visüllen Erkennen von räumlichen Bezügen der Objekte in der Umgebung züinander oder zu einem selbst beteiligt sind.',
  ),

  'b1568': IcfDetail(
    title: 'Funktionen der Wahrnehmung, anders bezeichnet',
  ),

  'b1569': IcfDetail(
    title: 'Funktionen der Wahrnehmung, nicht näher bezeichnet',
  ),

  // --- b160 Funktionen des Denkens ---

  'b160': IcfDetail(
    title: 'Funktionen des Denkens',
    description:
        'Spezifische mentale Funktionen, die im Zusammenhang mit dem formalen und inhaltlichen Ablauf des Denkens stehen.',
    inclusions: [
      'Tempo des Denkens',
      'Form des Denkens',
      'Kontrolle des Denkens',
      'Inhalt des Denkens',
      'Zielgerichtetes und nicht zielgerichtetes Denken',
      'Logisches Denken',
      'Gedankendruck, Ideenflüechtigkeit',
      'Denkhemmung, inkohärentes Denken',
      'Vorbeidenken/Vorbeireden',
      'Umständliches Denken',
      'Wahn, Zwangsgedanken, Zwangshandlungen',
    ],
    exclusions: [
      'Funktionen der Intelligenz (b117)',
      'Funktionen des Gedächtnisses (b144)',
      'Psychomotorische Funktionen (b147)',
      'Funktionen der Wahrnehmung (b156)',
      'Höhere kognitive Funktionen (b164)',
      'Kognitiv-sprachliche Funktionen (b167)',
      'Das Rechnen betreffende Funktionen (b172)',
    ],
  ),

  'b1600': IcfDetail(
    title: 'Denktempo',
    description:
        'Mentale Funktionen, die sich in der Geschwindigkeit des Denkprozesses äussern.',
  ),

  'b1601': IcfDetail(
    title: 'Form des Denkens',
    description:
        'Mentale Funktionen, die Kohärenz und Logik des Denkprozesses gewährleisten (formales Denken).',
    inclusions: [
      'Perseveration',
      'Vorbeidenken/Vorbeireden',
      'Umständlichkeit',
    ],
  ),

  'b1602': IcfDetail(
    title: 'Inhalt des Denkens',
    description:
        'Mentale Funktionen, die Ideen und Inhalte im Denkprozess und das, was konzeptualisiert wird, betreffen (inhaltliches Denken).',
    inclusions: [
      'Wahn',
      'Überwertige Ideen',
      'Somatisierung',
    ],
  ),

  'b1603': IcfDetail(
    title: 'Kontrolle des Denkens',
    description:
        'Mentale Funktionen, die die willkürliche Kontrolle über das Denken beinhalten und die als solche von der Person selbst erkannt werden.',
    inclusions: [
      'Deja-vu-Erleben',
      'Zwang',
      'Gedankenbeeinflussung',
      'Gedankeneingebung',
    ],
  ),

  'b1608': IcfDetail(
    title: 'Funktionen des Denkens, anders bezeichnet',
  ),

  'b1609': IcfDetail(
    title: 'Funktionen des Denkens, nicht näher bezeichnet',
  ),

  // --- b164 Hoehere kognitive Funktionen ---

  'b164': IcfDetail(
    title: 'Höhere kognitive Funktionen',
    description:
        'Spezifische mentale Funktionen, die insbesondere von den Frontallappen des Gehirns abhängen, einschliesslich komplexe zielgerichtete Verhaltensweisen wie Entscheidungen treffen, abstrakt denken sowie einen Plan aufstellen und durchführen, mentale Flexibilität, sowie entscheiden, welche Verhaltensweisen unter welchen Umständen angemessen sind (häufig exekutive Funktionen genannt).',
    inclusions: [
      'Abstraktionsvermögen und Ordnen von Ideen',
      'Zeitmanagement',
      'Einsichts- und Urteilsvermögen',
      'Konzeptbildung',
      'Kategorisierung',
      'Kognitive Flexibilität',
    ],
    exclusions: [
      'Funktionen des Gedächtnisses (b144)',
      'Funktionen des Denkens (b160)',
      'Kognitiv-sprachliche Funktionen (b167)',
      'Das Rechnen betreffende Funktionen (b172)',
    ],
  ),

  'b1640': IcfDetail(
    title: 'Das Abstraktionsvermögen betreffende Funktionen',
    description:
        'Mentale Funktionen, die die Entwicklung von allgemeinen Vorstellungen, Qualitäten oder Charakteristiken betreffen, hervorgegangen aus und losgelöst von den konkreten Realitäten, spezifischen Gegenständen oder aktüllen Gegebenheiten.',
  ),

  'b1641': IcfDetail(
    title: 'Das Organisieren und Planen betreffende Funktionen',
    description:
        'Mentale Funktionen, die das Zusammenfügen von Teilen zu einem Ganzen und das Systematisieren betreffen; diese mentale Funktion trägt dazu bei, eine methodische Vorgehens- oder Handlungsweise zu entwickeln.',
  ),

  'b1642': IcfDetail(
    title: 'Das Zeitmanagement betreffende Funktionen',
    description:
        'Mentale Funktionen, die das Ordnen von Ereignissen in eine chronologische Reihenfolge und das Zuweisen von Zeiten zu Ereignissen und Aktivitäten betreffen.',
  ),

  'b1643': IcfDetail(
    title: 'Kognitive Flexibilität',
    description:
        'Mentale Funktionen, die das Ändern von Strategien oder Denkansätzen betreffen, insbesondere beim Problemlösen.',
  ),

  'b1644': IcfDetail(
    title: 'Das Einsichtsvermögen betreffende Funktionen',
    description:
        'Mentale Funktionen, die Bewusstsein und Verstehen der eigenen Person und des eigenen Verhaltens betreffen.',
  ),

  'b1645': IcfDetail(
    title: 'Das Urteilsvermögen betreffende Funktionen',
    description:
        'Mentale Funktionen, die daran beteiligt sind, zwischen verschiedenen Möglichkeiten zu unterscheiden und diese zu bewerten, wie solche, die an der Meinungsbildung beteiligt sind.',
  ),

  'b1646': IcfDetail(
    title: 'Das Problemlösungsvermögen betreffende Funktionen',
    description:
        'Mentale Funktionen, die Identifizieren, Analysieren und Integrieren nicht übereinstimmender oder sich widersprechender Informationen in eine Lösung betreffen.',
  ),

  'b1648': IcfDetail(
    title: 'Höhere kognitive Funktionen, anders bezeichnet',
  ),

  'b1649': IcfDetail(
    title: 'Höhere kognitive Funktionen, nicht näher bezeichnet',
  ),

  // --- b167 Kognitiv-sprachliche Funktionen ---

  'b167': IcfDetail(
    title: 'Kognitiv-sprachliche Funktionen',
    description:
        'Spezifische mentale Funktionen, die das Erkennen und Verwenden von Zeichen, Symbolen und anderen Teilbereichen einer Sprache betreffen.',
    inclusions: [
      'Verständnis und Entschlüsselung gesprochener Sprache',
      'Verständnis geschriebener Sprache',
      'Verständnis anderer Sprachformen wie Gebärdensprache',
      'Ausdrucksvermögen in gesprochener Form',
      'Ausdrucksvermögen in geschriebener Form',
      'Ausdrucksvermögen in anderer Sprachform',
      'Integratives Sprachvermögen',
      'Sensorische (rezeptive) Aphasie',
      'Motorische (expressive) Aphasie',
      'Broca-Aphasie',
      'Wernicke-Aphasie',
      'Leitungsaphasie',
    ],
    exclusions: [
      'Funktionen der Aufmerksamkeit (b140)',
      'Funktionen des Gedächtnisses (b144)',
      'Funktionen der Wahrnehmung (b156)',
      'Funktionen des Denkens (b160)',
      'Höhere kognitive Funktionen (b164)',
      'Das Rechnen betreffende Funktionen (b172)',
      'Mentale Funktionen bezüglich komplexer Bewegungshandlungen (b176)',
    ],
  ),

  'b1670': IcfDetail(
    title: 'Das Sprachverständnis betreffende Funktionen',
    description:
        'Spezifische mentale Funktionen, die Verstehen und Erfassen der Bedeutung von Mitteilungen in gesprochener, geschriebener, symbolisierter oder anderer Form betreffen.',
  ),

  'b16700': IcfDetail(
    title: 'Das Verständnis gesprochener Sprache betreffende Funktionen',
    description:
        'Mentale Funktionen, die Verstehen und Erfassen der Bedeutung von gesprochenen Mitteilungen betreffen.',
  ),

  'b16701': IcfDetail(
    title: 'Das Verständnis geschriebener Sprache betreffende Funktionen',
    description:
        'Mentale Funktionen, die Verstehen und Erfassen der Bedeutung von schriftlichen Mitteilungen betreffen.',
  ),

  'b16702': IcfDetail(
    title: 'Das Verständnis der Gebärdensprache betreffende Funktionen',
    description:
        'Mentale Funktionen, die das Verstehen und Erfassen der Bedeutung von Mitteilungen in Sprachen, die mittels Hand- und anderen Bewegungen erzeugte Zeichen benutzen, betreffen.',
  ),

  'b16708': IcfDetail(
    title: 'Das Sprachverständnis betreffende Funktionen, anders bezeichnet',
  ),

  'b16709': IcfDetail(
    title: 'Das Sprachverständnis betreffende Funktionen, nicht näher bezeichnet',
  ),

  'b1671': IcfDetail(
    title: 'Das sprachliche Ausdrucksvermögen betreffende Funktionen',
    description:
        'Spezifische mentale Funktionen, die notwendig sind, um sinnvolle Mitteilungen in gesprochener, geschriebener, symbolischer oder anderer Form zu produzieren.',
  ),

  'b16710': IcfDetail(
    title: 'Das lautsprachliche Ausdrucksvermögen betreffende Funktionen',
    description:
        'Mentale Funktionen, die notwendig sind, in der gesprochenen Sprache sinnvolle Mitteilungen auszudrücken.',
  ),

  'b16711': IcfDetail(
    title: 'Das schriftsprachliche Ausdrucksvermögen betreffende Funktionen',
    description:
        'Mentale Funktionen, die notwendig sind, schriftsprachlich sinnvolle Mitteilungen zu verfassen.',
  ),

  'b16712': IcfDetail(
    title: 'Das Ausdrucksvermögen in Gebärdensprache betreffende Funktionen',
    description:
        'Mentale Funktionen, die notwendig sind, sinnvolle Mitteilungen in Sprachen auszudrücken, die mittels Hand- und anderen Bewegungen erzeugte Zeichen verwenden.',
  ),

  'b16718': IcfDetail(
    title: 'Das sprachliche Ausdrucksvermögen betreffende Funktionen, anders bezeichnet',
  ),

  'b16719': IcfDetail(
    title: 'Das sprachliche Ausdrucksvermögen betreffende Funktionen, nicht näher bezeichnet',
  ),

  'b1672': IcfDetail(
    title: 'Integrative Sprachfunktionen',
    description:
        'Mentale Funktionen, die semantische und symbolische Bedeutung, grammatische Struktur und Inhalte ordnen, um Mitteilungen in gesprochener, geschriebener oder anderer Form produzieren zu können.',
  ),

  'b1678': IcfDetail(
    title: 'Kognitiv-sprachliche Funktionen, anders bezeichnet',
  ),

  'b1679': IcfDetail(
    title: 'Kognitiv-sprachliche Funktionen, nicht näher bezeichnet',
  ),

  // --- b172 Das Rechnen betreffende Funktionen ---

  'b172': IcfDetail(
    title: 'Das Rechnen betreffende Funktionen',
    description:
        'Spezifische mentale Funktionen, die Bestimmung, Abschätzung von und Umgang mit mathematischen Symbolen und Verfahren betreffen.',
    inclusions: [
      'Addition, Subtraktion und andere einfache mathematische Rechenarten',
      'Komplexe mathematische Operationen',
    ],
    exclusions: [
      'Funktionen der Aufmerksamkeit (b140)',
      'Funktionen des Gedächtnisses (b144)',
      'Funktionen des Denkens (b160)',
      'Höhere kognitive Funktionen (b164)',
      'Kognitiv-sprachliche Funktionen (b167)',
    ],
  ),

  'b1720': IcfDetail(
    title: 'Das einfache Rechnen betreffende Funktionen',
    description:
        'Mentale Funktionen, die Rechnen mit Zahlen betreffen, wie Addition, Subtraktion, Multiplikation und Division.',
  ),

  'b1721': IcfDetail(
    title: 'Das komplexe Rechnen betreffende Funktionen',
    description:
        'Mentale Funktionen, die Umsetzen von Textaufgaben in arithmetische Verfahren, Umsetzen von mathematischen Formeln in arithmetische Verfahren sowie andere komplexe Operationen im Zusammenhang mit Zahlen betreffen.',
  ),

  'b1728': IcfDetail(
    title: 'Das Rechnen betreffende Funktionen, anders bezeichnet',
  ),

  'b1729': IcfDetail(
    title: 'Das Rechnen betreffende Funktionen, nicht näher bezeichnet',
  ),

  // --- b176 Mentale Funktionen, die die Durchfuehrung komplexer Bewegungshandlungen betreffen ---

  'b176': IcfDetail(
    title: 'Mentale Funktionen, die die Durchführung komplexer Bewegungshandlungen betreffen',
    description:
        'Spezifische mentale Funktionen, die die Aufeinanderfolge und Koordination komplexer, zweckgerichteter Bewegungen betreffen.',
    inclusions: [
      'Ideatorische Apraxie',
      'Ideomotorische Apraxie',
      'Ankleide-Apraxie',
      'Okulomotorische Apraxie',
      'Sprech-Apraxie',
    ],
    exclusions: [
      'Psychomotorische Funktionen (b147)',
      'Höhere kognitive Funktionen (b164)',
    ],
  ),

  // --- b180 Die Selbstwahrnehmung und die Zeitwahrnehmung betreffende Funktionen ---

  'b180': IcfDetail(
    title: 'Die Selbstwahrnehmung und die Zeitwahrnehmung betreffende Funktionen',
    description:
        'Spezifische mentale Funktionen, die im Zusammenhang mit der bewussten Wahrnehmung der eigenen Identität, des eigenen Körpers, der eigenen Position in der eigenen realen Umwelt sowie der Zeit stehen.',
    inclusions: [
      'Selbsterfahrung',
      'Körperschema',
      'Zeitwahrnehmung',
    ],
  ),

  'b1800': IcfDetail(
    title: 'Selbstwahrnehmung',
    description:
        'Spezifische mentale Funktionen, die die bewusste Wahrnehmung der eigenen Identität und der eigenen Position in der eigenen realen Umwelt betreffen.',
    inclusions: [
      'Depersonalisation',
      'Realitätsverlust',
    ],
  ),

  'b1801': IcfDetail(
    title: 'Körperschema',
    description:
        'Spezifische mentale Funktionen, die im Zusammenhang mit dem Bild und dem Bewusstsein des eigenen Körpers stehen.',
    inclusions: [
      'Phantomgliedmasse',
      'Das Gefühl, zu dick oder zu dünn zu sein',
    ],
  ),

  'b1802': IcfDetail(
    title: 'Zeitwahrnehmung',
    description:
        'Spezifische mentale Funktionen, die die subjektive Wahrnehmung in Bezug auf Länge und Verlauf von Zeit betreffen.',
    inclusions: [
      'Jamais-vu-Erlebnisse',
      'Deja-vu-Erlebnisse',
    ],
  ),

  'b1808': IcfDetail(
    title: 'Die Selbstwahrnehmung und die Zeitwahrnehmung betreffende Funktionen, anders bezeichnet',
  ),

  'b1809': IcfDetail(
    title: 'Die Selbstwahrnehmung und die Zeitwahrnehmung betreffende Funktionen, nicht näher bezeichnet',
  ),

  'b189': IcfDetail(
    title: 'Spezielle mentale Funktionen, anders oder nicht näher bezeichnet',
  ),

  // ===========================================================================
  // KAPITEL b2: SINNESFUNKTIONEN UND SCHMERZ
  // ===========================================================================

  // ---------------------------------------------------------------------------
  // Seh- und verwandte Funktionen (b210-b229)
  // ---------------------------------------------------------------------------

  'b210': IcfDetail(
    title: 'Funktionen des Sehens (Sehsinn)',
    description:
        'Sinnesfunktionen bezüglich der Wahrnehmung von Licht sowie von Form, Grösse, Gestalt und Farbe des visüllen Reizes.',
    inclusions: [
      'Sehschärfe-Funktionen',
      'Gesichtsfeldwirkungen',
      'Sehvermögens-Qualität',
      'Licht- und Farbwahrnehmung',
      'Sehschärfe bei Weit- und Nahsicht',
      'Monokulares und binokulares Sehen',
      'Bildqualität',
      'Kurzsichtigkeit, Weitsichtigkeit, Hornhautverkrümmung',
      'Hemianopsie, Farbenblindheit, Tunnelsehen',
      'Gesichtsfeldausfälle, Diplopie, Nachtblindheit',
    ],
    exclusions: [
      'Wahrnehmungsfunktionen (b156)',
    ],
  ),

  'b2100': IcfDetail(
    title: 'Die Sehschärfe (Visus) betreffende Funktionen',
    description:
        'Sehfunktionen, die die beidäugige (binokulare) und einäugige (monokulare) Wahrnehmung von Formen und Konturen im Nah- und Fernbereich betreffen.',
  ),

  'b21000': IcfDetail(
    title: 'Binokulare (beidäugige) Sehschärfe in der Ferne',
    description:
        'Sehfunktionen, die die Wahrnehmung von Grösse, Form und Kontur eines entfernten Objektes mit beiden Augen betreffen.',
  ),

  'b21001': IcfDetail(
    title: 'Monokulare (einäugige) Sehschärfe in der Ferne',
    description:
        'Sehfunktionen, die die Wahrnehmung von Grösse, Form und Kontur eines entfernten Objektes entweder mit dem rechten oder mit dem linken Auge betreffen.',
  ),

  'b21002': IcfDetail(
    title: 'Sehschärfe im Nahbereich bei beidäugigem (binokularem) Sehen',
    description:
        'Sehfunktionen, die die Wahrnehmung von Grösse, Form und Kontur eines nahen Objektes mit beiden Augen betreffen.',
  ),

  'b21003': IcfDetail(
    title: 'Sehschärfe im Nahbereich bei einäugigem (monokularem) Sehen',
    description:
        'Sehfunktionen, die die Wahrnehmung von Grösse, Form und Kontur eines nahen Objektes entweder mit dem rechten oder mit dem linken Auge betreffen.',
  ),

  'b21008': IcfDetail(
    title: 'Die Sehschärfe (Visus) betreffende Funktionen, anders bezeichnet',
  ),

  'b21009': IcfDetail(
    title: 'Die Sehschärfe (Visus) betreffende Funktionen, nicht näher bezeichnet',
  ),

  'b2101': IcfDetail(
    title: 'Das Gesichtsfeld betreffende Funktionen',
    description:
        'Sehfunktionen, die sich auf den gesamten Bereich, der mit fixiertem Blick gesehen werden kann, beziehen.',
    inclusions: [
      'Gesichtsfeldausfall',
      'Tunnelblick',
      'Anopsien',
    ],
  ),

  'b2102': IcfDetail(
    title: 'Qualität des Sehvermögens',
    description:
        'Sehfunktionen, die an Lichtempfindung, Farbsehvermögen, Kontrastempfindung und allgemeiner Bildqualität beteiligt sind.',
  ),

  'b21020': IcfDetail(
    title: 'Lichtempfindung (Lichtsinn)',
    description:
        'Sehfunktionen, die die Wahrnehmung einer geringen Lichtintensität (Helligkeitsminimum) und eines minimalen Helligkeitskontrasts betreffen.',
    inclusions: [
      'Hell-Dunkeladaptationsfunktionen',
      'Nachtblindheit',
      'Photophobie (Lichtscheu)',
    ],
  ),

  'b21021': IcfDetail(
    title: 'Farbsehvermögen (Farbsinn)',
    description:
        'Sehfunktionen, die das Unterscheiden und Vergleichen von Farben betreffen.',
  ),

  'b21022': IcfDetail(
    title: 'Kontrastempfindung',
    description:
        'Sehfunktionen, die die Unterscheidung eines Objekts vom Hintergrund mit der geringsten Leuchtdichte betreffen.',
  ),

  'b21023': IcfDetail(
    title: 'Visülle Bildqualität',
    description:
        'Sehfunktionen, die an der Qualität des Bildes beteiligt sind.',
    inclusions: [
      'Streulicht-Wahrnehmung',
      'Beeinträchtigte intraokulare Bildqualität',
      'Mouches volantes',
      'Schleier',
      'Bildverzerrung',
      'Sehen von Sternen und Blitzen',
    ],
  ),

  'b21028': IcfDetail(
    title: 'Qualität des Sehvermögens, anders bezeichnet',
  ),

  'b21029': IcfDetail(
    title: 'Qualität des Sehvermögens, nicht näher bezeichnet',
  ),

  'b2108': IcfDetail(
    title: 'Funktionen des Sehens, anders bezeichnet',
  ),

  'b2109': IcfDetail(
    title: 'Funktionen des Sehens, nicht näher bezeichnet',
  ),

  // --- b215 Funktionen von Strukturen, die in Verbindung mit dem Auge stehen ---

  'b215': IcfDetail(
    title: 'Funktionen von Strukturen, die in Verbindung mit dem Auge stehen',
    description:
        'Funktionen der Strukturen im Auge und um das Auge herum, die das Sehen ermöglichen.',
    inclusions: [
      'Innere Augenmuskelfunktion',
      'Augenlidfunktionen',
      'Äussere Augenmuskeln',
      'Willkürliche Augenbewegungen',
      'Augenfolgebewegungen',
      'Augenfixierungsfähigkeit',
      'Tränendrücenfunktion',
      'Akkomodationsfähigkeit',
      'Pupillenreaktion',
      'Nystagmus, Xerophthalmie, Ptosis',
    ],
    exclusions: [
      'Sehfunktionen (b210)',
    ],
  ),

  'b2150': IcfDetail(
    title: 'Funktionen der Augeninnenmuskeln',
    description:
        'Funktionen, die die Muskeln im Auge betreffen, welche Form und Grösse der Pupille und der Linse regulieren.',
    inclusions: [
      'Akkomodationsfunktionen',
      'Pupillenreaktion',
    ],
  ),

  'b2151': IcfDetail(
    title: 'Funktionen des Augenlids',
    description:
        'Funktionen des Augenlids, wie zum Beispiel der Schutzreflex.',
  ),

  'b2152': IcfDetail(
    title: 'Funktionen der externen Augenmuskeln',
    description:
        'Funktionen, die die Muskeln betreffen, welche benutzt werden, um die Blickrichtung zu ändern, um ein sich durch das Gesichtsfeld bewegendes Objekt mit den Augen zu verfolgen.',
    inclusions: [
      'Nystagmus',
      'Koordination beider Augen',
    ],
  ),

  'b2153': IcfDetail(
    title: 'Funktionen der Tränendrüsen',
    description:
        'Funktionen der Tränendrüsen und Tränengänge.',
  ),

  'b2158': IcfDetail(
    title: 'Funktionen von Strukturen, die in Verbindung mit dem Auge stehen, anders bezeichnet',
  ),

  'b2159': IcfDetail(
    title: 'Funktionen von Strukturen, die in Verbindung mit dem Auge stehen, nicht näher bezeichnet',
  ),

  // --- b220 Mit dem Auge und angrenzenden Strukturen verbundene Empfindungen ---

  'b220': IcfDetail(
    title: 'Mit dem Auge und angrenzenden Strukturen verbundene Empfindungen',
    description:
        'Empfindungen von Augenermüdung, von trockenen, juckenden Augen oder ähnliche Gefühle.',
    inclusions: [
      'Druckempfindung hinter dem Auge',
      'Fremdkörpergefühl',
      'Augenüberanstrengung',
      'Augenbrennen',
      'Augenreizung',
    ],
    exclusions: [
      'Schmerz (b280)',
    ],
  ),

  'b229': IcfDetail(
    title: 'Seh- und verwandte Funktionen, anders oder nicht näher bezeichnet',
  ),

  // ---------------------------------------------------------------------------
  // Hoer- und Vestibularfunktionen (b230-b249)
  // ---------------------------------------------------------------------------

  'b230': IcfDetail(
    title: 'Funktionen des Hörens (Hörsinn)',
    description:
        'Sinnesfunktionen bezüglich der Wahrnehmung von Tönen oder Geräuschen und der Unterscheidung von deren Herkunftsort, Tonhöhe, Lautstärke und Qualität.',
    inclusions: [
      'Funktionen des Hörens, akustische Differenzierung',
      'Ortung der Geräuschqülle, Richtungshören, Spracherkennung',
      'Funktionsstörungen wie Taubheit, Schwerhörigkeit',
    ],
    exclusions: [
      'Funktionen der Wahrnehmung (b156)',
      'Kognitiv-sprachliche Funktionen (b167)',
    ],
  ),

  'b2300': IcfDetail(
    title: 'Schallwahrnehmung',
    description:
        'Sinnesfunktionen, die die Wahrnehmung von Tönen oder Geräuschen betreffen.',
  ),

  'b2301': IcfDetail(
    title: 'Auditive Differenzierung',
    description:
        'Sinnesfunktionen, die die Wahrnehmung von Tönen oder Geräuschen betreffen, deren Abgrenzung von Hintergrundgeräuschen, binaurale Synthese, Trennung und Mischung von Tönen und Geräuschen.',
  ),

  'b2302': IcfDetail(
    title: 'Ortung der Schallqülle',
    description:
        'Sinnesfunktionen, die die Feststellung der örtlichen Herkunft eines Tones oder Geräusches betreffen.',
  ),

  'b2303': IcfDetail(
    title: 'Richtungshören',
    description:
        'Sinnesfunktionen, die die Unterscheidung, ob ein Ton von rechts oder von links kommt, betreffen.',
  ),

  'b2304': IcfDetail(
    title: 'Sprachdifferenzierung',
    description:
        'Sinnesfunktionen, die das Erkennen gesprochener Sprache und deren Unterscheidung von anderen Geräuschen betreffen.',
  ),

  'b2308': IcfDetail(
    title: 'Funktionen des Hörens, anders bezeichnet',
  ),

  'b2309': IcfDetail(
    title: 'Funktionen des Hörens, nicht näher bezeichnet',
  ),

  // --- b235 Vestibulaere Funktionen ---

  'b235': IcfDetail(
    title: 'Vestibuläre Funktionen',
    description:
        'Sinnesfunktionen des Innenohrs, die Lage, Gleichgewicht und Bewegung betreffen.',
    inclusions: [
      'Funktionen, die die Position und den Lagesinn sowie das Körpergleichgewicht betreffen',
    ],
    exclusions: [
      'Mit den Hör- und vestibulären Funktionen verbundene Empfindungen (b240)',
    ],
  ),

  'b2350': IcfDetail(
    title: 'Vestibulärer Lagesinn',
    description:
        'Sinnesfunktionen des Innenohrs, die die Feststellung der Körperausrichtung im Raum betreffen.',
  ),

  'b2351': IcfDetail(
    title: 'Gleichgewichtssinn',
    description:
        'Sinnesfunktionen des Innenohrs, die die Feststellung des Körpergleichgewichts betreffen.',
  ),

  'b2352': IcfDetail(
    title: 'Vestibulärer Bewegungssinn',
    description:
        'Sinnesfunktionen des Innenohrs, die die Feststellung der Körperbewegung im Raum, der Richtung und Geschwindigkeit betreffen.',
  ),

  'b2358': IcfDetail(
    title: 'Vestibuläre Funktionen, anders bezeichnet',
  ),

  'b2359': IcfDetail(
    title: 'Vestibuläre Funktionen, nicht näher bezeichnet',
  ),

  // --- b240 Mit den Hoer- und vestibulären Funktionen verbundene Empfindungen ---

  'b240': IcfDetail(
    title: 'Mit den Hör- und vestibulären Funktionen verbundene Empfindungen',
    description:
        'Schwindelgefühl, Gefühl des Fallens, Ohrgeräusche (Tinnitus) und Schwindel (Vertigo).',
    inclusions: [
      'Ohrenklingeln, Reizgefühl im Ohr, Druck im Ohr',
      'Übelkeit in Verbindung mit Schwindelgefühl oder Schwindel (Vertigo)',
    ],
    exclusions: [
      'Vestibuläre Funktionen (b235)',
      'Schmerz (b280)',
    ],
  ),

  'b2400': IcfDetail(
    title: 'Ohrgeräusche oder Tinnitus',
    description:
        'Empfindung von tiefen, rauschenden, pfeifenden oder klingelnden Geräuschen im Ohr.',
  ),

  'b2401': IcfDetail(
    title: 'Schwindelgefühl',
    description:
        'Gefühl von Bewegung, an der man selbst oder seine Umgebung beteiligt ist; Gefühl, sich zu drehen, zu schwanken oder zu kippen.',
  ),

  'b2402': IcfDetail(
    title: 'Gefühl des Fallens',
    description:
        'Gefühl, den Boden unter den Füssen zu verlieren und zu fallen.',
  ),

  'b2403': IcfDetail(
    title: 'Übelkeit in Verbindung mit Schwindelgefühl oder Schwindel (Vertigo)',
    description:
        'Gefühl, sich übergeben zu müssen, ausgelöst durch Schwindelgefühl oder Schwindel.',
  ),

  'b2404': IcfDetail(
    title: 'Reizgefühl im Ohr',
    description:
        'Juckreiz oder ähnliche Empfindungen im Ohr.',
  ),

  'b2405': IcfDetail(
    title: 'Druck im Ohr',
    description:
        'Gefühl von Ohrdruck.',
  ),

  'b2408': IcfDetail(
    title: 'Mit den Hör- und vestibulären Funktionen verbundene Empfindungen, anders bezeichnet',
  ),

  'b2409': IcfDetail(
    title: 'Mit den Hör- und vestibulären Funktionen verbundene Empfindungen, nicht näher bezeichnet',
  ),

  'b249': IcfDetail(
    title: 'Hör- und Vestibularfunktionen, anders oder nicht näher bezeichnet',
  ),

  // ---------------------------------------------------------------------------
  // Weitere Sinnesfunktionen (b250-b279)
  // ---------------------------------------------------------------------------

  'b250': IcfDetail(
    title: 'Funktionen des Schmeckens (Geschmackssinn)',
    description:
        'Sinnesfunktionen, die die Wahrnehmung der Geschmacksqualitäten bitter, süss, saür und salzig betreffen.',
    inclusions: [
      'Funktionen des Schmeckens, des Geschmackssinns',
      'Funktionsstörungen wie Verlust des Geschmacksvermögens (Ageusie)',
      'Verminderung des Geschmacksvermögens (Hypogeusie)',
    ],
  ),

  'b255': IcfDetail(
    title: 'Funktionen des Riechens (Geruchssinn)',
    description:
        'Sinnesfunktionen, die die Wahrnehmung von Gerüchen und Düften betreffen.',
    inclusions: [
      'Funktionen des Riechens',
      'Funktionsstörungen wie fehlendes Geruchsvermögen (Anosmie)',
      'Vermindertes Geruchsvermögen (Hyposmie)',
    ],
  ),

  'b260': IcfDetail(
    title: 'Die Propriozeption betreffende Funktionen',
    description:
        'Sinnesfunktionen, die die Wahrnehmung der Position der einzelnen Körperteile in Relation zum Körper betreffen.',
    inclusions: [
      'Funktionen der Wahrnehmung der Körperposition (Statästhesie)',
      'Wahrnehmung einer Körperbewegung (Kinästhesie)',
    ],
    exclusions: [
      'Vestibuläre Funktionen (b235)',
      'Mit den Funktionen der Muskeln und der Bewegung in Zusammenhang stehende Empfindungen (b780)',
    ],
  ),

  'b265': IcfDetail(
    title: 'Funktionen des Tastens (Tastsinn)',
    description:
        'Sinnesfunktionen, die das Erkennen von Oberflächen sowie deren Beschaffenheit oder Qualität betreffen.',
    inclusions: [
      'Funktionen des Tastens',
      'Funktionsstörungen wie Taubheitsgefühle',
      'Berührungsunempfindlichkeit (Anästhesie)',
      'Kribbelparästhesien',
      'Missempfindungen (Parästhesien)',
      'Überempfindlichkeiten (Hyperästhesien)',
    ],
    exclusions: [
      'Sinnesfunktionen bezüglich Temperatur und anderer Reize (b270)',
    ],
  ),

  'b270': IcfDetail(
    title: 'Sinnesfunktionen bezüglich Temperatur und anderer Reize',
    description:
        'Sinnesfunktionen, die die Wahrnehmung von Temperatur, Vibration, Druck und schädigenden Reizen betreffen.',
    inclusions: [
      'Funktionen bezüglich Temperaturempfinden',
      'Vibrationen, Erschütterungen oder Schwingungen',
      'Oberflächlicher Druck',
      'Tiefer Druck',
      'Brennen oder schädigende Reize',
    ],
    exclusions: [
      'Funktionen des Tastens (Tastsinn) (b265)',
    ],
  ),

  'b2700': IcfDetail(
    title: 'Temperaturempfinden',
    description:
        'Sinnesfunktionen, die die Wahrnehmung von kalt und heiss betreffen.',
  ),

  'b2701': IcfDetail(
    title: 'Vibrationsempfinden',
    description:
        'Sinnesfunktionen, die die Wahrnehmung von Erschütterungen oder Schwingungen betreffen.',
  ),

  'b2702': IcfDetail(
    title: 'Druck- und Berührungsempfinden',
    description:
        'Sinnesfunktionen, die die Wahrnehmung von Druck auf die Haut betreffen.',
    inclusions: [
      'Berührungsempfindlichkeit',
      'Taubheit',
      'Verringerte Empfindlichkeit (Hypästhesie)',
      'Gesteigerte Empfindlichkeit (Hyperästhesie)',
      'Kribbelparästhesien',
      'Jucken',
    ],
  ),

  'b2703': IcfDetail(
    title: 'Wahrnehmung schädigender Reize',
    description:
        'Sinnesfunktionen, die die Wahrnehmung schmerzhafter oder unangenehmer Reize betreffen.',
    inclusions: [
      'Herabgesetztes oder gesteigertes Schmerzempfinden (Hypalgesie, Hyperpathie)',
      'Verändertes Schmerzempfinden (Allodynie)',
      'Aufgehobenes Schmerzempfinden (Analgesie)',
      'Schmerzhafte Empfindungslosigkeit (Anästhesia dolorosa)',
    ],
  ),

  'b2708': IcfDetail(
    title: 'Sinnesfunktionen bezüglich Temperatur und anderer Reize, anders bezeichnet',
  ),

  'b2709': IcfDetail(
    title: 'Sinnesfunktionen bezüglich Temperatur und anderer Reize, nicht näher bezeichnet',
  ),

  'b279': IcfDetail(
    title: 'Weitere Sinnesfunktionen, anders oder nicht näher bezeichnet',
  ),

  // ---------------------------------------------------------------------------
  // Schmerz (b280-b289)
  // ---------------------------------------------------------------------------

  'b280': IcfDetail(
    title: 'Schmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt.',
    inclusions: [
      'Allgemeiner oder umschriebener Schmerz in einem oder mehreren Körperteilen',
      'Schmerz in einem Dermatom',
      'Stechender, brennender, dumpfer, quälender Schmerz',
      'Muskelschmerz (Myalgie)',
      'Aufgehobene Schmerzempfindung (Analgesie)',
      'Gesteigerte Schmerzempfindung (Hyperalgesie)',
    ],
  ),

  'b2800': IcfDetail(
    title: 'Generalisierter Schmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, am oder im gesamten Körper.',
  ),

  'b2801': IcfDetail(
    title: 'Schmerz in einem Körperteil',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in einem bestimmten Körperteil oder in Körperteilen.',
  ),

  'b28010': IcfDetail(
    title: 'Kopf- und Nackenschmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in Kopf oder Nacken.',
  ),

  'b28011': IcfDetail(
    title: 'Brustschmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in der Brust.',
  ),

  'b28012': IcfDetail(
    title: 'Magen- oder Bauchschmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in Magen oder Bauch.',
  ),

  'b28013': IcfDetail(
    title: 'Rückenschmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, im Rücken.',
  ),

  'b28014': IcfDetail(
    title: 'Schmerz in den oberen Gliedmassen',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in einem oder beiden oberen Gliedmassen, einschliesslich der Hände.',
  ),

  'b28015': IcfDetail(
    title: 'Schmerz in den unteren Gliedmassen',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in einem oder beiden unteren Gliedmassen.',
  ),

  'b28016': IcfDetail(
    title: 'Gelenkschmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in einem oder mehreren Gelenken einschliesslich kleiner und grosser.',
    inclusions: [
      'Hüftschmerz',
      'Schulterschmerz',
    ],
  ),

  'b28018': IcfDetail(
    title: 'Schmerz in einem Körperteil, anders bezeichnet',
  ),

  'b28019': IcfDetail(
    title: 'Schmerz in einem Körperteil, nicht näher bezeichnet',
  ),

  'b2802': IcfDetail(
    title: 'Schmerz in mehreren Körperteilen',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in mehreren Körperteilen.',
  ),

  'b2803': IcfDetail(
    title: 'In ein Dermatom ausstrahlender Schmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in einem von derselben Nervenwurzel versorgten Hautareal.',
  ),

  'b2804': IcfDetail(
    title: 'In ein Hautsegment oder ein Hautareal ausstrahlender Schmerz',
    description:
        'Empfinden eines unangenehmen Gefühls, das mögliche oder tatsächliche Schäden einer Körperstruktur anzeigt, in nicht von derselben Nervenwurzel versorgten Hautgebieten verschiedener Körperteile.',
  ),

  'b289': IcfDetail(
    title: 'Schmerz, anders oder nicht näher bezeichnet',
  ),

  // ===========================================================================
  // KAPITEL b3: STIMM- UND SPRECHFUNKTIONEN
  // ===========================================================================

  'b310': IcfDetail(
    title: 'Funktionen der Stimme',
    description:
        'Funktionen, die die Bildung verschiedener Laute während der Luftpassage durch den Kehlkopf betreffen.',
    inclusions: [
      'Funktionen der Stimmerzeugung und -qualität',
      'Funktionen der Phonation, der Tonhöhe, der Lautstärke und anderer Stimmqualitäten',
      'Funktionsstörungen wie bei Aphonie, Dysphonie, Heiserkeit, Hypernasalität, Hyponasalität',
    ],
    exclusions: [
      'Kognitiv-sprachliche Funktionen (b167)',
      'Artikulationsfunktionen (b320)',
    ],
  ),

  'b3100': IcfDetail(
    title: 'Stimmbildung',
    description:
        'Funktionen, die die Lautbildung durch die Koordination von Kehlkopf und umgebenden Muskeln mit dem Atmungssystem betreffen.',
    inclusions: [
      'Funktionen der Phonation, Lautstärke',
      'Funktionsstörungen bei Aphonie',
    ],
  ),

  'b3101': IcfDetail(
    title: 'Stimmqualität',
    description:
        'Funktionen, die die Prägung der Stimmcharakteristika betreffen, einschliesslich Tonhöhe, Resonanz und andere Merkmale.',
    inclusions: [
      'Funktionen der Tonhöhe (hoch oder tief)',
      'Funktionsstörungen wie Hypernasalität, Hyponasalität, Dysphonie, Heiserkeit, Rauigkeit',
    ],
  ),

  'b3108': IcfDetail(
    title: 'Stimmfunktionen, anders bezeichnet',
  ),

  'b3109': IcfDetail(
    title: 'Stimmfunktionen, nicht näher bezeichnet',
  ),

  // --- b320 Artikulationsfunktionen ---

  'b320': IcfDetail(
    title: 'Artikulationsfunktionen',
    description:
        'Funktionen, die die Bildung der Sprechlaute betreffen.',
    inclusions: [
      'Funktionen, die Aussprache und Lautartikulation betreffen',
      'Funktionsstörungen wie spastische, ataktische, schlaffe Dysarthrie; Anarthrie',
    ],
    exclusions: [
      'Kognitiv-sprachliche Funktionen (b167)',
      'Funktionen der Stimme (b310)',
    ],
  ),

  // --- b330 Funktionen des Redeflusses und Sprechrhythmus ---

  'b330': IcfDetail(
    title: 'Funktionen des Redeflusses und Sprechrhythmus',
    description:
        'Funktionen, die die Ausprägung des Sprechflusses und -tempos betreffen.',
    inclusions: [
      'Funktionen des Flusses, des Rhythmus, der Geschwindigkeit und Melodie des Sprechens',
      'Prosodie und Intonation',
      'Funktionsstörungen wie Stottern, Stammeln, Poltern, Bradylalie und Tachylalie',
    ],
    exclusions: [
      'Kognitiv-sprachliche Funktionen (b167)',
      'Funktionen der Stimme (b310)',
      'Artikulationsfunktionen (b320)',
    ],
  ),

  'b3300': IcfDetail(
    title: 'Sprechflüssigkeit',
    description:
        'Funktionen, die die Erzeugung eines gleichmässigen, kontinuierlichen Sprechflusses betreffen.',
    inclusions: [
      'Funktionen der gleichmässigen Sprachverbindung',
      'Funktionsstörungen wie Stottern, Stammeln, Poltern, Redeflussstörung, Wiederholung von Lauten, Wörtern oder Wortteilen, unregelmässige Sprechunterbrechungen',
    ],
  ),

  'b3301': IcfDetail(
    title: 'Sprechrhythmus',
    description:
        'Funktionen, die die Modulation sowie das Geschwindigkeits- und Betonungsmuster beim Sprechen betreffen.',
    inclusions: [
      'Funktionsstörungen wie stereotyper oder repetitiver Sprechrhythmus',
    ],
  ),

  'b3302': IcfDetail(
    title: 'Sprechtempo',
    description:
        'Funktionen, die die Sprechgeschwindigkeit betreffen.',
    inclusions: [
      'Funktionsstörungen wie Bradylalie, Tachylalie',
    ],
  ),

  'b3303': IcfDetail(
    title: 'Melodik des Sprechens',
    description:
        'Funktionen, die die Modulation der Tonhöhe beim Sprechen betreffen.',
    inclusions: [
      'Prosodie, Intonation; Melodie des Sprechens',
      'Funktionsstörungen wie monotones Sprechen',
    ],
  ),

  'b3308': IcfDetail(
    title: 'Funktionen des Redeflusses und des Sprechrhythmus, anders bezeichnet',
  ),

  'b3309': IcfDetail(
    title: 'Funktionen des Redeflusses und des Sprechrhythmus, nicht näher bezeichnet',
  ),

  // --- b340 Alternative stimmliche Aeusserungen ---

  'b340': IcfDetail(
    title: 'Alternative stimmliche Äusserungen',
    description:
        'Funktionen, die die Erzeugung anderer Arten stimmlicher Äusserungen betreffen.',
    inclusions: [
      'Funktionen, die die Erzeugung von Tönen und die Variation lautlicher Äusserungen betreffen, wie beim Singen, Sprechgesang, Plappern, Summen',
      'Lautes Weinen und Schreien',
    ],
    exclusions: [
      'Kognitiv-sprachliche Funktionen (b167)',
      'Funktionen der Stimme (b310)',
      'Artikulationsfunktionen (b320)',
      'Funktionen des Redeflusses und des Sprechrhythmus (b330)',
    ],
  ),

  'b3400': IcfDetail(
    title: 'Erzeugung von Tönen',
    description:
        'Funktionen, die die Bildung von musikbezogenen stimmlichen Äusserungen betreffen.',
    inclusions: [
      'Halten, modulieren und beenden einzelner oder gebundener stimmlicher Äusserungen mit Variation der Tonhöhe wie beim Singen, Summen und Sprechgesang',
    ],
  ),

  'b3401': IcfDetail(
    title: 'Erzeugung einer Variation von stimmlichen Äusserungen',
    description:
        'Funktionen, die die Erzeugung einer vielfältigen Stimmgebung betreffen.',
    inclusions: [
      'Funktionen des Lallens bei Kindern',
    ],
  ),

  'b3408': IcfDetail(
    title: 'Alternative stimmliche Äusserungen, anders bezeichnet',
  ),

  'b3409': IcfDetail(
    title: 'Alternative stimmliche Äusserungen, nicht näher bezeichnet',
  ),

  'b398': IcfDetail(
    title: 'Stimm- und Sprechfunktionen, anders bezeichnet',
  ),

  'b399': IcfDetail(
    title: 'Stimm- und Sprechfunktionen, nicht näher bezeichnet',
  ),

  // ===========================================================================
  // KAPITEL b4: FUNKTIONEN DES KARDIOVASKULAEREN, HAEMATOLOGISCHEN,
  //             IMMUN- UND ATMUNGSSYSTEMS
  // ===========================================================================

  // ---------------------------------------------------------------------------
  // Funktionen des kardiovaskulaeren Systems (b410-b429)
  // ---------------------------------------------------------------------------

  'b410': IcfDetail(
    title: 'Herzfunktionen',
    description:
        'Pumpfunktionen des Herzens zur Sicherstellung der Blutzufuhr zum Körper.',
    inclusions: [
      'Herzfreqünz, Herzrhythmus, Herzminutenvolumen',
      'Kontraktionskraft der Ventrikel',
      'Herzklappenfunktion, Lungenkreislauf, Füllungsdynamik',
      'Herzinsuffizienz, Kardiomyopathie, Myokarditis, Koronarinsuffizienz',
      'Tachykardie, Bradykardie, Herzrhythmusstörungen',
    ],
    exclusions: [
      'Blutgefässfunktionen (b415)',
      'Blutdruckfunktionen (b420)',
      'Funktionen der kardiorespiratorischen Belastbarkeit (b455)',
    ],
  ),

  'b4100': IcfDetail(
    title: 'Herzfreqünz',
    description:
        'Funktionen bezüglich der Herzschläge pro Minute.',
    inclusions: [
      'Zu hohe Herzfreqünz (Tachykardie)',
      'Zu niedrige Herzfreqünz (Bradykardie)',
    ],
  ),

  'b4101': IcfDetail(
    title: 'Herzrhythmus',
    description:
        'Funktionen bezüglich der Regelmässigkeit des Herzschlags.',
    inclusions: [
      'Arrhythmien',
    ],
  ),

  'b4102': IcfDetail(
    title: 'Kontraktionskraft der Ventrikel',
    description:
        'Funktionen, die das Blutvolumen betreffen, das von den Ventrikeln gepumpt wird.',
    inclusions: [
      'Vermindertes Herzminutenvolumen',
    ],
  ),

  'b4103': IcfDetail(
    title: 'Blutzufuhr zum Herzen',
    description:
        'Funktionen, die das Blutvolumen betreffen, das dem Herzmuskel verfügbar steht.',
    inclusions: [
      'Koronare Ischämie',
    ],
  ),

  'b4108': IcfDetail(
    title: 'Herzfunktionen, anders bezeichnet',
  ),

  'b4109': IcfDetail(
    title: 'Herzfunktionen, nicht näher bezeichnet',
  ),

  // --- b415 Blutgefaessfunktionen ---

  'b415': IcfDetail(
    title: 'Blutgefässfunktionen',
    description:
        'Funktionen, die den Bluttransport durch den Körper betreffen.',
    inclusions: [
      'Arterien, Kapillaren, Venen',
      'Vasomotorik',
      'Pulmonale Arterien, Kapillaren, Venen',
      'Venenklappen',
      'Arterienverschluss/-stenose, Atherosklerose, Arteriosklerose',
      'Thrombömbolie, Varizen',
    ],
    exclusions: [
      'Herzfunktionen (b410)',
      'Blutdruckfunktionen (b420)',
      'Funktionen des hämatologischen Systems (b430)',
      'Funktionen der kardiorespiratorischen Belastbarkeit (b455)',
    ],
  ),

  'b4150': IcfDetail(
    title: 'Funktionen der Arterien',
    description:
        'Funktionen bezüglich des Blutflusses in den Arterien.',
    inclusions: [
      'Arteriendilatation',
      'Arterienstenose, Claudicatio intermittens',
    ],
  ),

  'b4151': IcfDetail(
    title: 'Funktionen der Kapillaren',
    description:
        'Funktionen bezüglich des Blutflusses in den Kapillaren.',
  ),

  'b4152': IcfDetail(
    title: 'Funktionen der Venen',
    description:
        'Funktionen bezüglich des Blutflusses in den Venen und Funktionen der Venenklappen.',
    inclusions: [
      'Venendilatation',
      'Venenstenosen',
      'Venenklappeninsuffizienz, Varikosis',
    ],
  ),

  'b4158': IcfDetail(
    title: 'Funktionen der Blutgefässe, anders bezeichnet',
  ),

  'b4159': IcfDetail(
    title: 'Funktionen der Blutgefässe, nicht näher bezeichnet',
  ),

  // --- b420 Blutdruckfunktionen ---

  'b420': IcfDetail(
    title: 'Blutdruckfunktionen',
    description:
        'Funktionen, die die Aufrechterhaltung des arteriellen Blutdrucks betreffen.',
    inclusions: [
      'Blutdruckstabilität',
      'Erhöhter und erniedrigter Blutdruck',
      'Hypotonie, Hypertonie, orthostatischer Blutdruckabfall',
    ],
    exclusions: [
      'Herzfunktionen (b410)',
      'Blutgefässfunktionen (b415)',
      'Funktionen der kardiorespiratorischen Belastbarkeit (b455)',
    ],
  ),

  'b4200': IcfDetail(
    title: 'Erhöhter Blutdruck',
    description:
        'Funktionen, die den systolischen oder diastolischen Blutdruckanstieg über die Altersnorm betreffen.',
  ),

  'b4201': IcfDetail(
    title: 'Erniedrigter Blutdruck',
    description:
        'Funktionen bezüglich eines systolischen oder diastolischen Blutdruckabfalls unter die Altersnorm.',
  ),

  'b4202': IcfDetail(
    title: 'Aufrechterhaltung des Blutdrucks',
    description:
        'Funktionen bezüglich der Aufrechterhaltung eines angemessenen Blutdrucks bei Veränderungen im Körper.',
  ),

  'b4208': IcfDetail(
    title: 'Funktionen des Blutdrucks, anders bezeichnet',
  ),

  'b4209': IcfDetail(
    title: 'Funktionen des Blutdrucks, nicht näher bezeichnet',
  ),

  'b429': IcfDetail(
    title: 'Funktionen des kardiovaskulären Systems, anders oder nicht näher bezeichnet',
  ),

  // ---------------------------------------------------------------------------
  // Funktionen des haematologischen und Immunsystems (b430-b439)
  // ---------------------------------------------------------------------------

  'b430': IcfDetail(
    title: 'Funktionen des hämatologischen Systems',
    description:
        'Funktionen, die die Blutbildung, den Saürstoff- und Metaboliten-Transport sowie die Blutgerinnung betreffen.',
    inclusions: [
      'Funktionen der Blutbildung und des Knochenmarks',
      'Saürstofftransportfunktion des Blutes',
      'Blutzellen-bezogene Milzfunktionen',
      'Metaboliten-Transportfunktion des Blutes',
      'Blutgerinnung',
      'Funktionsstörungen wie Anämie, Hämophilie und andere Gerinnungsstörungen',
    ],
    exclusions: [
      'Funktionen des kardiovaskulären Systems (b410-b429)',
      'Funktionen des Immunsystems (b435)',
      'Funktionen der kardiorespiratorischen Belastbarkeit (b455)',
    ],
  ),

  'b4300': IcfDetail(
    title: 'Hämatopöse',
    description:
        'Funktionen bezüglich der Blutbildung und ihrer gesamten Bestandteile.',
  ),

  'b4301': IcfDetail(
    title: 'Saürstofftransportfunktion des Blutes',
    description:
        'Funktionen des Blutes bezüglich der Fähigkeit, Saürstoff zu transportieren.',
  ),

  'b4302': IcfDetail(
    title: 'Metabolittransport des Blutes',
    description:
        'Funktionen, die die Metabolittransport-Kapazität betreffen.',
  ),

  'b4303': IcfDetail(
    title: 'Gerinnungsfunktionen des Blutes',
    description:
        'Funktionen bezüglich der Blutgerinnung wie bei einer Verletzung oder Wunde.',
  ),

  'b4308': IcfDetail(
    title: 'Funktionen des hämatologischen Systems, anders bezeichnet',
  ),

  'b4309': IcfDetail(
    title: 'Funktionen des hämatologischen Systems, nicht näher bezeichnet',
  ),

  // --- b435 Funktionen des Immunsystems ---

  'b435': IcfDetail(
    title: 'Funktionen des Immunsystems',
    description:
        'Schutzfunktionen des Körpers mittels spezifischer oder unspezifischer Immunantwort gegen Fremdsubstanzen, einschliesslich Infektionen.',
    inclusions: [
      'Immunantwort (spezifisch und unspezifisch)',
      'Hypersensibilität',
      'Funktionen der Lymphknoten und -gefässe',
      'Funktionen der zellulären und nicht-zellulären Immunität',
      'Reaktion auf Immunisierung',
      'Funktionsstörungen wie Autoimmunität, allergische Reaktionen, Lymphadenitis, Lymphödem',
    ],
    exclusions: [
      'Funktionen des hämatologischen Systems (b430)',
    ],
  ),

  'b4350': IcfDetail(
    title: 'Immunantwort',
    description:
        'Funktionen der Körperreaktionen, die die Sensibilisierung gegenüber Fremdsubstanzen einschliesslich Infektionen betreffen.',
  ),

  'b43500': IcfDetail(
    title: 'Spezifische Immunantwort',
    description:
        'Funktionen der Körperreaktionen, die die Sensibilisierung gegenüber einer spezifischen Fremdsubstanz betreffen.',
  ),

  'b43501': IcfDetail(
    title: 'Unspezifische Immunantwort',
    description:
        'Funktionen der allgemeinen Körperreaktionen, die die Sensibilisierung gegenüber Fremdsubstanzen einschliesslich Infektionen betreffen.',
  ),

  'b43508': IcfDetail(
    title: 'Immunantwort, anders bezeichnet',
  ),

  'b43509': IcfDetail(
    title: 'Immunantwort, nicht näher bezeichnet',
  ),

  'b4351': IcfDetail(
    title: 'Hypersensibilitäts-Reaktionen',
    description:
        'Funktionen der Körperreaktionen, die eine erhöhte Sensibilisierung gegen Fremdsubstanzen betreffen, wie bei Sensibilisierung gegenüber verschiedenen Antigenen.',
    inclusions: [
      'Funktionsstörungen wie Hypersensibilitäten oder allergische Reaktionen',
    ],
    exclusions: [
      'Nahrungsmittelverträglichkeit (b5153)',
    ],
  ),

  'b4352': IcfDetail(
    title: 'Funktionen der Lymphgefässe',
    description:
        'Funktionen, die die Gefässkanäle für den Lymphtransport betreffen.',
  ),

  'b4353': IcfDetail(
    title: 'Funktionen der Lymphknoten',
    description:
        'Funktionen, die die Lymphknoten im Verlauf der Lymphgefässe betreffen.',
  ),

  'b4358': IcfDetail(
    title: 'Funktionen des Immunsystems, anders bezeichnet',
  ),

  'b4359': IcfDetail(
    title: 'Funktionen des Immunsystems, nicht näher bezeichnet',
  ),

  'b439': IcfDetail(
    title: 'Funktionen des hämatologischen und Immunsystems, anders oder nicht näher bezeichnet',
  ),

  // ---------------------------------------------------------------------------
  // Funktionen des Atmungssystems (b440-b449)
  // ---------------------------------------------------------------------------

  'b440': IcfDetail(
    title: 'Atmungsfunktionen',
    description:
        'Funktionen, die Inspiration, Gasaustausch zwischen Luft und Blut sowie Exspiration betreffen.',
    inclusions: [
      'Funktionen der Atemfreqünz, des Atemrhythmus und der Atemtiefe',
      'Funktionsstörungen wie Apnö',
      'Hyperventilation',
      'Unregelmässige Atmung',
      'Paradoxe Atmung',
      'Pulmonales Emphysem',
      'Bronchospasmus',
    ],
    exclusions: [
      'Funktionen der Atemmuskulatur (b445)',
      'Weitere Atmungsfunktionen (b450)',
      'Funktionen der kardiorespiratorischen Belastbarkeit (b455)',
    ],
  ),

  'b4400': IcfDetail(
    title: 'Atemfreqünz',
    description:
        'Funktionen, die die Anzahl der Atemzüge pro Minute betreffen.',
    inclusions: [
      'Tachypnö (zu hohe Atemfreqünz)',
      'Bradypnö (zu niedrige Atemfreqünz)',
    ],
  ),

  'b4401': IcfDetail(
    title: 'Atemrhythmus',
    description:
        'Funktionen, die die Periodizität und Regelmässigkeit der Atmung betreffen.',
    inclusions: [
      'Unregelmässige Atmung',
    ],
  ),

  'b4402': IcfDetail(
    title: 'Atemtiefe',
    description:
        'Funktionen, die die Lungenkapazität während der Atembewegung betreffen.',
    inclusions: [
      'Oberflächliche oder flache Atmung',
    ],
  ),

  'b4408': IcfDetail(
    title: 'Atmungsfunktionen, anders bezeichnet',
  ),

  'b4409': IcfDetail(
    title: 'Atmungsfunktionen, nicht näher bezeichnet',
  ),

  // --- b445 Funktionen der Atemmuskulatur ---

  'b445': IcfDetail(
    title: 'Funktionen der Atemmuskulatur',
    description:
        'Funktionen, die die an der Atmung beteiligten Muskeln betreffen.',
    inclusions: [
      'Funktionen der thorakalen Atemmuskeln',
      'Funktionen des Zwerchfells',
      'Funktionen der Atemhilfsmuskulatur',
    ],
    exclusions: [
      'Atmungsfunktionen (b440)',
      'Weitere Atmungsfunktionen (b450)',
      'Funktionen der kardiorespiratorischen Belastbarkeit (b455)',
    ],
  ),

  'b4450': IcfDetail(
    title: 'Funktionen der thorakalen Atemmuskeln',
    description:
        'Funktionen der thorakalen Muskeln, die an der Atmung beteiligt sind.',
  ),

  'b4451': IcfDetail(
    title: 'Funktionen des Zwerchfells',
    description:
        'Funktionen des Zwerchfells, die an der Atmung beteiligt sind.',
  ),

  'b4452': IcfDetail(
    title: 'Funktionen der Atemhilfsmuskulatur',
    description:
        'Funktionen der Hilfsmuskeln, die beim Atmen beteiligt sind.',
  ),

  'b4458': IcfDetail(
    title: 'Atemmuskelfunktionen, anders bezeichnet',
  ),

  'b4459': IcfDetail(
    title: 'Atemmuskelfunktionen, nicht näher bezeichnet',
  ),

  'b449': IcfDetail(
    title: 'Funktionen des Atmungssystems, anders oder nicht näher bezeichnet',
  ),

  // ---------------------------------------------------------------------------
  // Weitere Funktionen des Atmungssystems und Empfindungen (b450-b469)
  // ---------------------------------------------------------------------------

  'b450': IcfDetail(
    title: 'Weitere Atmungsfunktionen',
    description:
        'Weitere Funktionen, die die Atmung betreffen, wie Husten, Niesen und Gähnen.',
    inclusions: [
      'Funktionen, die Keuchen, Giemen und Mundatmung betreffen',
    ],
  ),

  'b455': IcfDetail(
    title: 'Funktionen der kardiorespiratorischen Belastbarkeit',
    description:
        'Funktionen, die die Kapazität des respiratorischen und kardiovaskulären Systems zur Erbringung von Ausdaürleistungen betreffen.',
    inclusions: [
      'Funktionen der Ausdaürleistung, der äroben Kapazität, Belastbarkeit und Ermüdbarkeit',
    ],
    exclusions: [
      'Funktionen des kardiovaskulären Systems (b410-b429)',
      'Funktionen des hämatologischen Systems (b430)',
      'Atmungsfunktionen (b440)',
      'Funktionen der Atemmuskulatur (b445)',
      'Weitere Atmungsfunktionen (b450)',
    ],
  ),

  'b4550': IcfDetail(
    title: 'Allgemeine Ausdaürleistung',
    description:
        'Funktionen, die die allgemeine Toleranzschwelle für physische Belastungen oder Ausdaür betreffen.',
  ),

  'b4551': IcfDetail(
    title: 'Ärobe Kapazität',
    description:
        'Funktionen, die die Belastungsgrenze des äroben Stoffwechsels betreffen.',
  ),

  'b4552': IcfDetail(
    title: 'Ermüdbarkeit',
    description:
        'Funktionen, die die Ermüdbarkeit bei jedem Belastungsgrad betreffen.',
  ),

  'b4558': IcfDetail(
    title: 'Kardiorespiratorische Belastbarkeit, anders bezeichnet',
  ),

  'b4559': IcfDetail(
    title: 'Kardiorespiratorische Belastbarkeit, nicht näher bezeichnet',
  ),

  // --- b460 Mit dem kardiovaskulaeren und Atmungssystem verbundene Empfindungen ---

  'b460': IcfDetail(
    title: 'Mit dem kardiovaskulären und Atmungssystem verbundene Empfindungen',
    description:
        'Empfindungen wie bei Aussetzen des Herzschlages, Herzklopfen, Kurzatmigkeit.',
    inclusions: [
      'Empfindung von Brustenge, Gefühl von unregelmässigem Herzschlag, Dyspnö, Luftnot',
      'Erstickungsgefühle, Würgegefühl, Keuchen',
    ],
    exclusions: [
      'Schmerz (b280)',
    ],
  ),

  'b469': IcfDetail(
    title: 'Weitere Funktionen und Empfindungen des kardiovaskulären und Atmungssystems, anders oder nicht näher bezeichnet',
  ),


  // --- b5-b8 ---
  'b510': IcfDetail(
  title: 'Funktionen der Nahrungsaufnahme',
  description: 'Funktionen, die im Zusammenhang mit der Aufnahme und der Bearbeitung fester oder flüssiger Stoffe in den Körper durch den Mund stehen',
  inclusions: [
    'Saug-, Kau-, Beiß-, Mundspeichelfluss-, Schluck-, Aufstoß-, Regurgitations-, Spuck- und Erbrechensfunktionen',
    'Funktionen der Handhabung von Speisen im Mund',
    'Funktionsstörungen wie Dysphagie, Aspiration von Nahrung, Ärophagie, übermäßige oder zu geringe Speichelproduktion, Sabbern und Mundtrockenheit',
  ],
  exclusions: [
    'Mit dem Verdauungssystem verbundene Empfindungen (b535)',
  ],
),

  'b5100': IcfDetail(
  title: 'Saugen',
  description: 'Funktionen, eine Flüssigkeit durch Bewegungen der Wangen, Lippen und Zunge in den Mund zu ziehen',
  inclusions: [],
  exclusions: [],
),

  'b5101': IcfDetail(
  title: 'Beißen',
  description: 'Funktionen, die das Schneiden, Zerteilen oder Abbeißen von Nahrungsmitteln mit den Schneidezähnen betreffen',
  inclusions: [],
  exclusions: [],
),

  'b5102': IcfDetail(
  title: 'Kaün',
  description: 'Funktionen, die das Zerkleinern und Bearbeiten von Speisen mit den Zähnen betreffen',
  inclusions: [],
  exclusions: [],
),

  'b5103': IcfDetail(
  title: 'Handhabung von Speisen im Mund',
  description: 'Funktionen, die die Bewegung von Speisen mit Zähnen und Zunge im Mund betreffen',
  inclusions: [],
  exclusions: [],
),

  'b5104': IcfDetail(
  title: 'Speichelfluss',
  description: 'Funktionen, die die Mundspeichelproduktion betreffen',
  inclusions: [],
  exclusions: [],
),

  'b5105': IcfDetail(
  title: 'Schlucken',
  description: 'Funktionen, die die Beförderung von Speisen und Getränken über Mundhöhle, Rachen und Speiseröhre in den Magen in angemessener Menge und Geschwindigkeit betreffen',
  inclusions: [
    'Störungen des oralen, pharyngealen und ösophagealen Schluckens',
    'Funktionsstörung der Ösophaguspassage',
  ],
  exclusions: [],
),

  'b51050': IcfDetail(
  title: 'Orales Schlucken',
  description: 'Funktionen, die die Beförderung von Speisen und Getränken über die Mundhöhle in geeigneter Menge und Geschwindigkeit betreffen',
  inclusions: [],
  exclusions: [],
),

  'b51051': IcfDetail(
  title: 'Pharyngeales Schlucken',
  description: 'Funktionen, die die Beförderung von Speisen und Getränken über den Rachen in geeigneter Menge und Geschwindigkeit betreffen',
  inclusions: [],
  exclusions: [],
),

  'b51052': IcfDetail(
  title: 'Ösophageales Schlucken',
  description: 'Funktionen, die die Beförderung von Speisen und Getränken über die Speiseröhre in geeigneter Menge und Geschwindigkeit betreffen',
  inclusions: [],
  exclusions: [],
),

  'b51058': IcfDetail(
  title: 'Schlucken, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b51059': IcfDetail(
  title: 'Schlucken, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5106': IcfDetail(
  title: 'Regurgitation und Erbrechen',
  description: 'Funktionen, die die Rückbeförderung von Speisen oder Flüssigkeit nach Aufnahme aus dem Magen in die Speiseröhre, in den und aus dem Mund betreffen',
  inclusions: [],
  exclusions: [],
),

  'b5108': IcfDetail(
  title: 'Funktionen der Nahrungsaufnahme, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5109': IcfDetail(
  title: 'Funktionen der Nahrungsaufnahme, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b515': IcfDetail(
  title: 'Verdauungsfunktionen',
  description: 'Funktionen, die den Transport von Speisen durch den Verdauungskanal, die Aufschlüsselung und Absorption von Nährstoffen betreffen',
  inclusions: [
    'Funktionen des Transports von Speisen durch Magen und Darm, Peristaltik',
    'Funktionen der Aufschlüsselung von Nahrung, Enzymproduktion, Magen- und Darmmotilität',
    'Funktionen der Absorption von Nährstoffen, Nahrungsmittelverträglichkeit',
    'Funktionsstörungen wie Magenübersäürung, Malabsorption, Nahrungsmittelunverträglichkeit, Hypermotilität, Darmparalyse, Darmverschluss, verminderte Gallenproduktion',
  ],
  exclusions: [
    'Funktionen der Nahrungsaufnahme (b510)',
    'Funktionen der Nahrungsmittelassimilation (b520)',
    'Defäkationsfunktionen (b525)',
    'Mit dem Verdauungssystem verbundene Empfindungen (b535)',
  ],
),

  'b5150': IcfDetail(
  title: 'Transport von Nahrung durch Magen und Darm',
  description: 'Peristaltik und entsprechende Funktionen, die Nahrung mechanisch durch Magen und Darm befördern',
  inclusions: [],
  exclusions: [],
),

  'b5151': IcfDetail(
  title: 'Aufschlüsselung von Nahrung',
  description: 'Funktionen, die die mechanische und chemische Zerkleinerung von Speisen im Verdauungstrakt betreffen',
  inclusions: [],
  exclusions: [],
),

  'b5152': IcfDetail(
  title: 'Absorption von Nährstoffen',
  description: 'Funktionen, die die Überführung von Nährstoffen aus Speisen und Getränken aus dem Intestinaltrakt ins Blut betreffen',
  inclusions: [],
  exclusions: [],
),

  'b5153': IcfDetail(
  title: 'Nahrungsmittelverträglichkeit',
  description: 'Funktionen des Körpers, die die Akzeptanz verträglicher Speisen und Getränke zur Verdauung sowie die Verweigerung von Unverträglichem betreffen',
  inclusions: [
    'Funktionsstörungen wie Überempfindlichkeiten, Glutenintoleranz',
  ],
  exclusions: [],
),

  'b5158': IcfDetail(
  title: 'Verdauungsfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5159': IcfDetail(
  title: 'Verdauungsfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b520': IcfDetail(
  title: 'Funktionen der Nahrungsmittelassimilation',
  description: 'Funktionen, bei denen Nährstoffe in Komponenten des Stoffwechsels umgewandelt werden',
  inclusions: [
    'Funktionen der Nährstoffspeicherung im Körper',
  ],
  exclusions: [
    'Verdauungsfunktionen (b515)',
    'Defäkationsfunktionen (b525)',
    'Funktionen der Aufrechterhaltung des Körpergewichts (b530)',
    'Allgemeine Stoffwechselfunktionen (b540)',
  ],
),

  'b525': IcfDetail(
  title: 'Defäkationsfunktionen',
  description: 'Funktionen, die die Ausscheidung von Schlacken und unverdauten Speisen als Stuhl betreffen sowie entsprechende Funktionen',
  inclusions: [
    'Funktionen der Stuhlentleerung, Stuhlkonsistenz, Stuhlhäufigkeit, Stuhlkontinenz, Flatulenz',
    'Funktionsstörungen wie Obstipation, Diarrhö, wässriger Stuhl, Insuffizienz des Analsphinkters',
  ],
  exclusions: [
    'Verdauungsfunktionen (b515)',
    'Funktionen der Nahrungsmittelassimilation (b520)',
    'Mit dem Verdauungssystem verbundene Empfindungen (b535)',
  ],
),

  'b5250': IcfDetail(
  title: 'Funktionen der Stuhlentleerung',
  description: 'Funktionen, die die Entleerung von Stuhl aus dem Enddarm betreffen einschließlich der Funktionen der Bauchpresse hierfür',
  inclusions: [],
  exclusions: [],
),

  'b5251': IcfDetail(
  title: 'Stuhlkonsistenz',
  description: 'Beschaffenheit des Stuhls wie hart, geformt, weich oder wässrig',
  inclusions: [],
  exclusions: [],
),

  'b5252': IcfDetail(
  title: 'Stuhlhäufigkeit',
  description: 'Funktionen, die an der Stuhlhäufigkeit beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5253': IcfDetail(
  title: 'Stuhlkontinenz',
  description: 'Funktionen, die an der Kontrolle der Stuhlausscheidung beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5254': IcfDetail(
  title: 'Flatulenz',
  description: 'Funktionen, die an der Ausscheidung vermehrter Mengen an Luft oder Gas aus dem Darm beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5258': IcfDetail(
  title: 'Defäkationsfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5259': IcfDetail(
  title: 'Defäkationsfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b530': IcfDetail(
  title: 'Funktionen der Aufrechterhaltung des Körpergewichts',
  description: 'Funktionen, die das Aufrechterhalten eines angemessenen Körpergewichts einschließlich Gewichtszunahme während der Körperentwicklung betreffen',
  inclusions: [
    'Funktionen des Aufrechterhaltens eines angemessenen Body Mass Index (BMI)',
    'Funktionsstörungen wie Untergewicht, Kachexie, Substanzverlust, Übergewicht, Abzehrung, primäre und sekundäre Adipositas',
  ],
  exclusions: [
    'Funktionen der Nahrungsmittelassimilation (b520)',
    'Allgemeine Stoffwechselfunktionen (b540)',
    'Funktionen der endokrinen Drüsen (b555)',
  ],
),

  'b535': IcfDetail(
  title: 'Mit dem Verdauungssystem verbundene Empfindungen',
  description: 'Empfindungen, die durch Essen, Trinken und entsprechende Verdauungsfunktionen entstehen',
  inclusions: [
    'Brechreiz und Übelkeit, Blähungsgefühl, Bauchkrämpfe, Völlegefühl, Kloßgefühl im Hals, Magenkrämpfe, geblähter Bauch, Sodbrennen',
  ],
  exclusions: [
    'Schmerz (b280)',
    'Funktionen der Nahrungsaufnahme (b510)',
    'Verdauungsfunktionen (b515)',
    'Defäkationsfunktionen (b525)',
  ],
),

  'b5350': IcfDetail(
  title: 'Brechreiz und Übelkeit',
  description: 'Gefühl, erbrechen zu müssen',
  inclusions: [],
  exclusions: [],
),

  'b5351': IcfDetail(
  title: 'Blähungsgefühl',
  description: 'Gefühl eines aufgeblähten Magens oder Bauches',
  inclusions: [],
  exclusions: [],
),

  'b5352': IcfDetail(
  title: 'Bauchkrämpfe',
  description: 'Gefühl spastischer oder schmerzhafter Kontraktionen der glatten Muskeln des Magen-Darm-Traktes',
  inclusions: [],
  exclusions: [],
),

  'b5358': IcfDetail(
  title: 'Mit dem Verdauungssystem verbundene Empfindungen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5359': IcfDetail(
  title: 'Mit dem Verdauungssystem verbundene Empfindungen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b539': IcfDetail(
  title: 'Funktionen im Zusammenhang mit dem Verdauungssystem, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b540': IcfDetail(
  title: 'Allgemeine Stoffwechselfunktionen',
  description: 'Funktionen, die die Regulierung der notwendigen Nahrungsbausteine wie Kohlenhydrate, Eiweiße und Fette sowie deren Umwandlung in Energie betreffen',
  inclusions: [
    'Stoffwechselfunktionen, Grundumsatz, Kohlenhydrat-, Eiweiß- und Fettstoffwechsel',
    'Katabolismus, Anabolismus, Energieproduktion',
    'Grundumsatzveränderungen',
  ],
  exclusions: [
    'Funktionen der Nahrungsmittelassimilation (b520)',
    'Funktionen der Aufrechterhaltung des Körpergewichts (b530)',
    'Funktionen des Wasser-, Mineral- und Elektrolythaushaltes (b545)',
    'Funktionen der Wärmeregulation (b550)',
    'Funktionen der endokrinen Drüsen (b555)',
  ],
),

  'b5400': IcfDetail(
  title: 'Grundumsatz',
  description: 'Funktionen, die an der Saürstoffaufnahme unter definierten Bedingungen der Ruhe und Temperatur beteiligt sind',
  inclusions: [
    'Grundumsatzveränderungen',
    'Schilddrüsenüber- und -unterfunktion',
  ],
  exclusions: [],
),

  'b5401': IcfDetail(
  title: 'Kohlenhydratstoffwechsel',
  description: 'Funktionen, die an dem Prozess, bei dem Nahrungskohlenhydrate gespeichert oder zu Glukose umgewandelt werden und schließlich zu Kohlendioxid und Wasser abgebaut werden, beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5402': IcfDetail(
  title: 'Eiweißstoffwechsel',
  description: 'Funktionen, die an dem Prozess, bei dem Nahrungseiweiße in Aminosäuren aufgeschlüsselt und weiter metabolisiert werden, beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5403': IcfDetail(
  title: 'Fettstoffwechsel',
  description: 'Funktionen, die an dem Prozess, bei dem Nahrungsfette gespeichert oder metabolisiert werden, beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5408': IcfDetail(
  title: 'Allgemeine Stoffwechselfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5409': IcfDetail(
  title: 'Allgemeine Stoffwechselfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b545': IcfDetail(
  title: 'Funktionen des Wasser-, Mineral- und Elektrolythaushaltes',
  description: 'Funktionen, die die Regulation von Wasser, Mineralien und Elektrolyten im Körper betreffen',
  inclusions: [
    'Funktionen des Wasserhaushaltes, Mineralhaushaltes (Kalzium, Zink, Eisen) und Elektrolythaushaltes (Natrium, Kalium)',
    'Funktionsstörungen wie Wasserretention, Dehydratation, Hyperkalzämie, Hypokalzämie, Eisenmangel, Hypernatriämie, Hyponatriämie, Hyperkaliämie, Hypokaliämie',
  ],
  exclusions: [
    'Funktionen des hämatologischen Systems (b430)',
    'Allgemeine Stoffwechselfunktionen (b540)',
    'Funktionen der endokrinen Drüsen (b555)',
  ],
),

  'b5450': IcfDetail(
  title: 'Funktionen des Wasserhaushaltes',
  description: 'Funktionen, die an der Konzentration und Gesamtmenge des Körperwassers beteiligt sind',
  inclusions: [
    'Dehydratation, Rehydration',
  ],
  exclusions: [],
),

  'b54500': IcfDetail(
  title: 'Wasserretention',
  description: 'Funktionen, die an der Zurückhaltung vermehrten Wassers im Körper beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b54501': IcfDetail(
  title: 'Aufrechterhaltung eines ausgeglichenen Wasserhaushaltes',
  description: 'Funktionen, die an der Aufrechterhaltung einer optimalen Menge an Körperwasser beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b54508': IcfDetail(
  title: 'Funktionen des Wasserhaushaltes, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b54509': IcfDetail(
  title: 'Funktionen des Wasserhaushaltes, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5451': IcfDetail(
  title: 'Mineralstoffhaushalt',
  description: 'Funktionen, die an der Aufrechterhaltung eines Gleichgewichts zwischen Aufnahme, Speicherung, Nutzung und Ausscheidung von Mineralien im Körper beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5452': IcfDetail(
  title: 'Elektrolythaushalt',
  description: 'Funktionen, die an der Aufrechterhaltung eines Gleichgewichts zwischen Aufnahme, Speicherung, Nutzung und Ausscheidung von Elektrolyten im Körper beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b5458': IcfDetail(
  title: 'Funktionen des Wasser-, Mineral- und Elektrolythaushaltes, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5459': IcfDetail(
  title: 'Funktionen des Wasser-, Mineral- und Elektrolythaushaltes, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b550': IcfDetail(
  title: 'Funktionen der Wärmeregulation',
  description: 'Funktionen, die die Regulation der Körpertemperatur betreffen',
  inclusions: [
    'Funktionen der Aufrechterhaltung der Körpertemperatur',
    'Hypothermie, Hyperthermie',
  ],
  exclusions: [
    'Allgemeine Stoffwechselfunktionen (b540)',
    'Funktionen der endokrinen Drüsen (b555)',
  ],
),

  'b5500': IcfDetail(
  title: 'Körpertemperatur',
  description: 'Funktionen, die an der Regulation der Körperkerntemperatur beteiligt sind',
  inclusions: [
    'Hyperthermie, Hypothermie',
  ],
  exclusions: [],
),

  'b5501': IcfDetail(
  title: 'Aufrechterhaltung der Körpertemperatur',
  description: 'Funktionen, die an der Aufrechterhaltung einer optimalen Körpertemperatur bei wechselnden Umgebungstemperaturen beteiligt sind',
  inclusions: [
    'Hitzetoleranz, Kältetoleranz',
  ],
  exclusions: [],
),

  'b5508': IcfDetail(
  title: 'Wärmeregulationsfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b5509': IcfDetail(
  title: 'Wärmeregulationsfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b555': IcfDetail(
  title: 'Funktionen der endokrinen Drüsen',
  description: 'Funktionen, die die Produktion und Regulation der Hormonspiegel im Körper einschließlich zyklischer Veränderungen betreffen',
  inclusions: [
    'Funktionen der Hormonbalance',
    'Funktionen der Hypophyse, Schilddrüse, Nebennieren, Nebenschilddrüsen und Gonaden',
    'Unter- und Überfunktionen dieser Drüsen',
  ],
  exclusions: [
    'Allgemeine Stoffwechselfunktionen (b540)',
    'Funktionen des Wasser-, Mineral- und Elektrolythaushaltes (b545)',
    'Funktionen der Wärmeregulation (b550)',
    'Sexülle Funktionen (b640)',
    'Menstruationsfunktionen (b650)',
  ],
),

  'b559': IcfDetail(
  title: 'Funktionen im Zusammenhang mit dem Stoffwechsel- und dem endokrinen System, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b610': IcfDetail(
  title: 'Harnbildungsfunktionen',
  description: 'Funktionen, die die Filtration und Sammlung des Harns betreffen',
  inclusions: [
    'Funktionen der Filtration und Sammlung des Harns',
    'Funktionsstörungen wie bei Niereninsuffizienz, Anurie, Oligourie, Hydronephrose, hypotone Harnblase, Verschluss eines Ureters',
  ],
  exclusions: [
    'Miktionsfunktionen (b620)',
  ],
),

  'b6100': IcfDetail(
  title: 'Filtration des Harns',
  description: 'Funktionen, die die Filtration des Harns durch die Nieren betreffen',
  inclusions: [],
  exclusions: [],
),

  'b6101': IcfDetail(
  title: 'Sammlung des Harns',
  description: 'Funktionen, die die Ableitung von Harn durch die Harnleiter und Sammlung des Harns in der Harnblase betreffen',
  inclusions: [],
  exclusions: [],
),

  'b6108': IcfDetail(
  title: 'Harnbildungsfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b6109': IcfDetail(
  title: 'Harnbildungsfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b620': IcfDetail(
  title: 'Miktionsfunktionen',
  description: 'Funktionen, die die Beförderung des Urins aus der Harnblase nach außen betreffen',
  inclusions: [
    'Funktionen des Harnlassens, der Häufigkeit der Blasenentleerung, der Harnkontinenz',
    'Funktionsstörungen wie Stressinkontinenz, Dranginkontinenz, Reflexinkontinenz, Überlaufinkontinenz, ständige Inkontinenz, Harntröpfeln, Blasenautonomie, Polyurie, Harnverhalt, Harndrang',
  ],
  exclusions: [
    'Harnbildungsfunktionen (b610)',
    'Mit der Harnbildung und -ausscheidung verbundene Empfindungen (b630)',
  ],
),

  'b6200': IcfDetail(
  title: 'Harnlassen',
  description: 'Funktionen, die die Leerung der Harnblase betreffen',
  inclusions: [
    'Funktionsstörungen wie Harnretention',
  ],
  exclusions: [],
),

  'b6201': IcfDetail(
  title: 'Häufigkeit der Blasenentleerung',
  description: 'Funktionen, die an der Häufigkeit, mit der die Blasenentleerung erfolgt, beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b6202': IcfDetail(
  title: 'Harnkontinenz',
  description: 'Funktionen, die an der Kontrolle über die Blasenentleerung beteiligt sind',
  inclusions: [
    'Funktionsstörungen wie Stress-, Drang-, Reflexinkontinenz, ständige und gemischte Inkontinenz',
  ],
  exclusions: [],
),

  'b6208': IcfDetail(
  title: 'Miktionsfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b6209': IcfDetail(
  title: 'Miktionsfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b630': IcfDetail(
  title: 'Mit der Harnbildung und -ausscheidung verbundene Empfindungen',
  description: 'Empfindungen, die durch die Entleerung und durch entsprechende Funktionen hervorgerufen werden',
  inclusions: [
    'Gefühl der unvollständigen Blasenentleerung',
    'Gefühl der Blasenfüllung',
  ],
  exclusions: [
    'Schmerz (b280)',
    'Miktionsfunktionen (b620)',
  ],
),

  'b639': IcfDetail(
  title: 'Funktionen der Harnbildung und Harnausscheidung, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b640': IcfDetail(
  title: 'Sexülle Funktionen',
  description: 'Mentale und physische Funktionen, die mit dem Geschlechtsakt einschließlich der Stadien der Erregung, des Vorspiels, des Orgasmus und der Entspannung im Zusammenhang stehen',
  inclusions: [
    'Funktionen, die die Phasen der sexüllen Erregung, des Vorspiels, des Orgasmus und der Entspannung betreffen',
    'Funktionen im Zusammenhang mit sexüllem Interesse und seiner Umsetzung, mit Erektion von Penis und Klitoris, der Lubrikation, Ejakulation und Orgasmus',
    'Funktionsstörungen wie Impotenz, Frigidität, Vaginismus, Ejaculatio präcox, verzögerte Ejakulation und bleibende Erektion (Priapismus)',
  ],
  exclusions: [
    'Fortpflanzungsfunktionen (b660)',
    'Mit den Genital- und reproduktiven Funktionen verbundene Empfindungen (b670)',
  ],
),

  'b6400': IcfDetail(
  title: 'Funktionen der sexüllen Erregungsphase',
  description: 'Funktionen, die das sexülle Interesse und die sexülle Erregung betreffen',
  inclusions: [],
  exclusions: [],
),

  'b6401': IcfDetail(
  title: 'Funktionen der Vorspielphase',
  description: 'Funktionen, die die Vorbereitung des Geschlechtsverkehrs betreffen',
  inclusions: [],
  exclusions: [],
),

  'b6402': IcfDetail(
  title: 'Funktionen der Orgasmusphase',
  description: 'Funktionen, die das Erreichen eines Orgasmus betreffen',
  inclusions: [],
  exclusions: [],
),

  'b6403': IcfDetail(
  title: 'Funktionen der sexüllen Entspannungsphase',
  description: 'Funktionen, die die Befriedigung nach einem Orgasmus und damit einhergehende Entspannung betreffen',
  inclusions: [
    'Funktionsstörung wie unbefriedigender Orgasmus',
  ],
  exclusions: [],
),

  'b6408': IcfDetail(
  title: 'Sexülle Funktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b6409': IcfDetail(
  title: 'Sexülle Funktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b650': IcfDetail(
  title: 'Menstruationsfunktionen',
  description: 'Funktionen, die mit dem Menstruationszyklus einschließlich der Regulation der Menstruation und der Ausscheidung der Menstruationssekrete verbunden sind',
  inclusions: [
    'Funktionen der Regelmäßigkeit des Zyklus und des Menstruationsintervalls, der Stärke der Menstruationsblutung, Menarche, Menopause',
    'Funktionsstörungen wie prämenstrülles Syndrom, primäre und sekundäre Amenorrhö, Menorrhagie, Polymenorrhö, retrograde Menstruation',
  ],
  exclusions: [
    'Sexülle Funktionen (b640)',
    'Fortpflanzungsfunktionen (b660)',
    'Mit den Genital- und reproduktiven Funktionen verbundene Empfindungen (b670)',
    'Schmerz (b280)',
  ],
),

  'b6500': IcfDetail(
  title: 'Regelmäßigkeit des Menstruationszyklus',
  description: 'Funktionen, die an der Regelmäßigkeit des Menstruationszyklus beteiligt sind',
  inclusions: [
    'Zu häufige oder zu seltene Menstruationen',
  ],
  exclusions: [],
),

  'b6501': IcfDetail(
  title: 'Menstruationsintervall',
  description: 'Periode zwischen zwei Menstruationen',
  inclusions: [],
  exclusions: [],
),

  'b6502': IcfDetail(
  title: 'Stärke der Menstruationsblutung',
  description: 'Funktionen, die an der Menge des Menstruationssekrets beteiligt sind',
  inclusions: [
    'Zu geringe Menstruation (Hypomenorrhö)',
    'Zu starke Menstruation (Menorrhagie, Hypermenorrhö)',
  ],
  exclusions: [],
),

  'b6508': IcfDetail(
  title: 'Menstruationsfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b6509': IcfDetail(
  title: 'Menstruationsfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b660': IcfDetail(
  title: 'Fortpflanzungsfunktionen',
  description: 'Funktionen, die mit der Fertilität, Schwangerschaft, Geburt und Laktation verbunden sind',
  inclusions: [
    'Funktionen der männlichen und weiblichen Fertilität, Schwangerschaft, Geburt und Laktation',
    'Funktionsstörungen wie Subfertilität, Sterilität, Azoospermie, Oligozoospermie, Spontanabort, ektopische Schwangerschaft, Fehlgeburt, zu kleiner Fetus, Hydramnion und Frühgeburt, verzögerte Geburt, Galaktorrhö, Agalaktorrhö, Agalaktie',
  ],
  exclusions: [
    'Sexülle Funktionen (b640)',
    'Menstruationsfunktionen (b650)',
  ],
),

  'b6600': IcfDetail(
  title: 'Funktionen im Zusammenhang mit der Fertilität',
  description: 'Funktionen, die im Zusammenhang mit der Fähigkeit zur Bildung von Keimzellen stehen',
  inclusions: [
    'Funktionsstörungen wie Subfertilität, Sterilität',
  ],
  exclusions: [
    'Sexülle Funktionen (b640)',
  ],
),

  'b6601': IcfDetail(
  title: 'Funktionen, die an der Schwangerschaft beteiligt sind',
  description: 'Funktionen, die an der Fähigkeit, schwanger zu werden und zu bleiben, beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b6602': IcfDetail(
  title: 'Funktionen im Zusammenhang mit der Geburt',
  description: 'Funktionen, die am Geburtsvorgang beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b6603': IcfDetail(
  title: 'Laktation',
  description: 'Funktionen, die an der Produktion von Milch und deren Abgabe an das Kind beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b6608': IcfDetail(
  title: 'Fortpflanzungsfunktionen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b6609': IcfDetail(
  title: 'Fortpflanzungsfunktionen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b670': IcfDetail(
  title: 'Mit den Genital- und reproduktiven Funktionen verbundene Empfindungen',
  description: 'Empfindungen wie Unbehagen während des Geschlechtsverkehrs oder während des Menstruationszyklus',
  inclusions: [
    'Dyspareunie, Dysmenorrhö, Hitzewallungen und nächtliche Schweißausbrüche während der Menopause',
  ],
  exclusions: [
    'Schmerz (b280)',
    'Mit der Harnbildung und -ausscheidung verbundene Empfindungen (b630)',
    'Sexülle Funktionen (b640)',
    'Menstruationsfunktionen (b650)',
    'Fortpflanzungsfunktionen (b660)',
  ],
),

  'b6700': IcfDetail(
  title: 'Mit dem Geschlechtsverkehr verbundene Beschwerden',
  description: 'Empfindungen, die mit der sexüllen Erregung, dem Vorspiel, dem Geschlechtsverkehr, dem Orgasmus und der Entspannung verbunden sind',
  inclusions: [],
  exclusions: [],
),

  'b6701': IcfDetail(
  title: 'Mit dem Menstruationszyklus verbundene Beschwerden',
  description: 'Empfindungen, die an der Menstruation einschließlich der prä- und postmenstrüllen Phase beteiligt sind',
  inclusions: [],
  exclusions: [],
),

  'b6702': IcfDetail(
  title: 'Mit der Menopause verbundene Beschwerden',
  description: 'Empfindungen, die mit dem Sistieren des Menstruationszyklus verbunden sind',
  inclusions: [
    'Hitzewallungen und nächtliche Schweißausbrüche während der Menopause',
  ],
  exclusions: [],
),

  'b6708': IcfDetail(
  title: 'Mit den Genital- und reproduktiven Funktionen verbundene Empfindungen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b6709': IcfDetail(
  title: 'Mit den Genital- und reproduktiven Funktionen verbundene Empfindungen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b679': IcfDetail(
  title: 'Genital- und reproduktive Funktionen, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b710': IcfDetail(
  title: 'Funktionen der Gelenkbeweglichkeit',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit des Bewegungsablaufes betreffen',
  inclusions: [
    'Funktionen der Beweglichkeit einzelner oder mehrerer Gelenke, der Wirbelsäule, der Schulter, des Ellenbogen, des Handgelenks, der Hüfte, des Knies, des Sprunggelenks und der kleinen Gelenke der Hände und Füße',
    'Allgemeine Gelenkbeweglichkeit',
    'Funktionsstörungen wie Hypermobilität der Gelenke, steife Gelenke, Schultersteife, Gelenkentzündung',
  ],
  exclusions: [
    'Funktionen der Gelenkstabilität (b715)',
    'Funktionen der Kontrolle von Willkürbewegungen (b760)',
  ],
),

  'b7100': IcfDetail(
  title: 'Beweglichkeit eines einzelnen Gelenkes',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung eines einzelnen Gelenkes betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7101': IcfDetail(
  title: 'Beweglichkeit mehrerer Gelenke',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung mehrerer Gelenke betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7102': IcfDetail(
  title: 'Allgemeine Gelenkbeweglichkeit',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung sämtlicher Gelenke betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7108': IcfDetail(
  title: 'Funktionen der Gelenkbeweglichkeit, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7109': IcfDetail(
  title: 'Funktionen der Gelenkbeweglichkeit, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b715': IcfDetail(
  title: 'Funktionen der Gelenkstabilität',
  description: 'Funktionen, die die Aufrechterhaltung der strukturellen Integrität der Gelenke betreffen',
  inclusions: [
    'Funktionen der Stabilität eines einzelnen Gelenkes, mehrerer Gelenke und allgemeine Gelenkstabilität',
    'Funktionsstörungen wie Schulterinstabilität, Gelenkdislokation, Schulter- und Hüftdislokation',
  ],
  exclusions: [
    'Funktionen der Gelenkbeweglichkeit (b710)',
  ],
),

  'b7150': IcfDetail(
  title: 'Stabilität eines einzelnen Gelenkes',
  description: 'Funktionen, die die Aufrechterhaltung der strukturellen Integrität eines einzelnen Gelenks betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7151': IcfDetail(
  title: 'Stabilität mehrerer Gelenke',
  description: 'Funktionen, die die Aufrechterhaltung der strukturellen Integrität von mehr als einem Gelenk betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7152': IcfDetail(
  title: 'Allgemeine Gelenkstabilität',
  description: 'Funktionen, die die Aufrechterhaltung der strukturellen Integrität aller Gelenke betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7158': IcfDetail(
  title: 'Funktionen der Gelenkstabilität, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7159': IcfDetail(
  title: 'Funktionen der Gelenkstabilität, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b720': IcfDetail(
  title: 'Funktionen der Beweglichkeit der Knochen',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung des Schulterblatts, Beckens sowie der Handwurzel- und Fußwurzelknochen betreffen',
  inclusions: [
    'Einschränkung der Schulterblatbeweglichkeit, Beckensteife',
  ],
  exclusions: [
    'Funktionen der Gelenkbeweglichkeit (b710)',
  ],
),

  'b7200': IcfDetail(
  title: 'Beweglichkeit des Schulterblattes',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung des Schulterblatts betreffen',
  inclusions: [
    'Protraktion, Retrotraktion, Außenrotation, Innenrotation',
  ],
  exclusions: [],
),

  'b7201': IcfDetail(
  title: 'Beweglichkeit des Beckens',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung des Beckens betreffen',
  inclusions: [
    'Beckenrotation',
  ],
  exclusions: [],
),

  'b7202': IcfDetail(
  title: 'Beweglichkeit der Handwurzel',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung der Handwurzelknochen betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7203': IcfDetail(
  title: 'Beweglichkeit der Fußwurzel',
  description: 'Funktionen, die den Bewegungsumfang und die Leichtigkeit der Bewegung der Fußwurzelknochen betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7208': IcfDetail(
  title: 'Funktionen der Beweglichkeit der Knochen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7209': IcfDetail(
  title: 'Funktionen der Beweglichkeit der Knochen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b729': IcfDetail(
  title: 'Funktionen der Gelenke und Knochen, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b730': IcfDetail(
  title: 'Funktionen der Muskelkraft',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft eines Muskels oder von Muskelgruppen stehen',
  inclusions: [
    'Funktionen der Muskelkraft bestimmter Muskeln oder Muskelgruppen, der Muskeln einer Extremität, einer Körperhälfte, der unteren Körperhälfte, aller Extremitäten und des Rumpfes',
    'Schwäche der kleinen Muskeln der Hände und Füße, Muskelparese, Muskelparalyse, Monoplegie, Hemiplegie, Paraplegie, Tetraplegie, akinetischer Mutismus',
  ],
  exclusions: [
    'Funktionen des Muskeltonus (b735)',
    'Funktionen der Muskelausdaür (b740)',
    'Funktionen von Strukturen in Verbindung mit dem Auge (b215)',
  ],
),

  'b7300': IcfDetail(
  title: 'Kraft isolierter Muskeln oder von Muskelgruppen',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft einzelner isolierter Muskeln oder Muskelgruppen stehen',
  inclusions: [
    'Schwäche der kleinen Muskeln der Hände oder Füße',
  ],
  exclusions: [],
),

  'b7301': IcfDetail(
  title: 'Kraft der Muskeln einer einzelnen Extremität',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft der Muskeln und Muskelgruppen eines Armes oder Beines stehen',
  inclusions: [
    'Monoparese und Monoplegie',
  ],
  exclusions: [],
),

  'b7302': IcfDetail(
  title: 'Kraft der Muskeln einer Körperhälfte',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft der Muskeln und Muskelgruppen der linken oder rechten Körperhälfte stehen',
  inclusions: [
    'Hemiparese und Hemiplegie',
  ],
  exclusions: [],
),

  'b7303': IcfDetail(
  title: 'Kraft der Muskeln der unteren Körperhälfte',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft der Muskeln und Muskelgruppen der unteren Körperhälfte stehen',
  inclusions: [
    'Paraparese und Paraplegie',
  ],
  exclusions: [],
),

  'b7304': IcfDetail(
  title: 'Kraft der Muskeln aller Extremitäten',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft der Muskeln und Muskelgruppen aller vier Extremitäten stehen',
  inclusions: [
    'Tetraparese und Tetraplegie',
  ],
  exclusions: [],
),

  'b7305': IcfDetail(
  title: 'Kraft der Rumpfmuskeln',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft der Muskeln und Muskelgruppen des Rumpfes stehen',
  inclusions: [],
  exclusions: [],
),

  'b7306': IcfDetail(
  title: 'Kraft aller Muskeln des Körpers',
  description: 'Funktionen, die im Zusammenhang mit der Kontraktionskraft aller Muskeln und Muskelgruppen des Körpers stehen',
  inclusions: [
    'Akinetischer Mutismus',
  ],
  exclusions: [],
),

  'b7308': IcfDetail(
  title: 'Funktionen der Muskelkraft, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7309': IcfDetail(
  title: 'Funktionen der Muskelkraft, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b735': IcfDetail(
  title: 'Funktionen des Muskeltonus',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus der Muskeln und dem Widerstand bei passiver Bewegung stehen',
  inclusions: [
    'Funktionen des Tonus einzelner Muskeln und Muskelgruppen, der Muskeln einer einzelnen Extremität, einer Körperhälfte, der unteren Körperhälfte, aller Extremitäten und des Rumpfes',
    'Funktionsstörungen wie verminderter und erhöhter Muskeltonus, Spastik',
  ],
  exclusions: [
    'Funktionen der Muskelkraft (b730)',
    'Funktionen der Muskelausdaür (b740)',
  ],
),

  'b7350': IcfDetail(
  title: 'Tonus einzelner Muskeln und Muskelgruppen',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus einzelner Muskeln und Muskelgruppen und dem Widerstand bei passiver Bewegung dieser Muskeln stehen',
  inclusions: [
    'Fokale Dystonie (Torticollis)',
  ],
  exclusions: [],
),

  'b7351': IcfDetail(
  title: 'Tonus der Muskeln einer einzelnen Extremität',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus einzelner Muskeln und Muskelgruppen eines Armes oder Beines und dem Widerstand bei passiver Bewegung dieser Muskeln stehen',
  inclusions: [
    'Monoparese und Monoplegie',
  ],
  exclusions: [],
),

  'b7352': IcfDetail(
  title: 'Tonus der Muskeln einer Körperhälfte',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus einzelner Muskeln und Muskelgruppen der rechten oder linken Körperhälfte und dem Widerstand bei passiver Bewegung dieser Muskeln stehen',
  inclusions: [
    'Hemiparese und Hemiplegie',
  ],
  exclusions: [],
),

  'b7353': IcfDetail(
  title: 'Tonus der Muskeln der unteren Körperhälfte',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus einzelner Muskeln und Muskelgruppen der unteren Körperhälfte und dem Widerstand bei passiver Bewegung dieser Muskeln stehen',
  inclusions: [
    'Paraparese und Paraplegie',
  ],
  exclusions: [],
),

  'b7354': IcfDetail(
  title: 'Tonus der Muskeln aller Extremitäten',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus einzelner Muskeln und Muskelgruppen aller Extremitäten und dem Widerstand bei passiver Bewegung dieser Muskeln stehen',
  inclusions: [
    'Tetraparese und Tetraplegie',
  ],
  exclusions: [],
),

  'b7355': IcfDetail(
  title: 'Tonus der Muskeln des Rumpfes',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus einzelner Muskeln und Muskelgruppen des Rumpfes und dem Widerstand bei passiver Bewegung dieser Muskeln stehen',
  inclusions: [],
  exclusions: [],
),

  'b7356': IcfDetail(
  title: 'Tonus aller Muskeln des Körpers',
  description: 'Funktionen, die im Zusammenhang mit dem Ruhetonus einzelner Muskeln und Muskelgruppen aller Muskeln des Körpers und dem Widerstand bei passiver Bewegung dieser Muskeln stehen',
  inclusions: [
    'Generalisierte Dystonie, Morbus Parkinson',
    'Generelle Paraparese und Paraplegie',
  ],
  exclusions: [],
),

  'b7358': IcfDetail(
  title: 'Funktionen des Muskeltonus, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7359': IcfDetail(
  title: 'Funktionen des Muskeltonus, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b740': IcfDetail(
  title: 'Funktionen der Muskelausdaür',
  description: 'Funktionen, die im Zusammenhang mit der Aufrechterhaltung der Muskelkontraktion über einen geforderten Zeitraum stehen',
  inclusions: [
    'Funktionen der Aufrechterhaltung der Kontraktion einzelner Muskeln, von Muskelgruppen und aller Muskeln des Körpers',
    'Myasthenia gravis',
  ],
  exclusions: [
    'Funktionen der kardiorespiratorischen Belastbarkeit (b455)',
    'Funktionen der Muskelkraft (b730)',
    'Funktionen des Muskeltonus (b735)',
  ],
),

  'b7400': IcfDetail(
  title: 'Ausdaür einzelner Muskeln',
  description: 'Funktionen, die im Zusammenhang mit der Aufrechterhaltung der Kontraktion einzelner Muskeln über einen geforderten Zeitraum stehen',
  inclusions: [],
  exclusions: [],
),

  'b7401': IcfDetail(
  title: 'Ausdaür von Muskelgruppen',
  description: 'Funktionen, die im Zusammenhang mit der Aufrechterhaltung der Kontraktion einzelner Muskelgruppen über einen geforderten Zeitraum stehen',
  inclusions: [
    'Monoparese, Monoplegie, Hemiparese, Hemiplegie, Paraparese und Paraplegie',
  ],
  exclusions: [],
),

  'b7402': IcfDetail(
  title: 'Ausdaür aller Muskeln des Körpers',
  description: 'Funktionen, die im Zusammenhang mit der Aufrechterhaltung der Kontraktion aller Muskeln über einen geforderten Zeitraum stehen',
  inclusions: [
    'Tetraparese, Tetraplegie, generalisierte Parese und Paralyse',
  ],
  exclusions: [],
),

  'b7408': IcfDetail(
  title: 'Funktionen der Muskelausdaür, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7409': IcfDetail(
  title: 'Funktionen der Muskelausdaür, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b749': IcfDetail(
  title: 'Funktionen der Muskeln, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b750': IcfDetail(
  title: 'Funktionen der motorischen Reflexe',
  description: 'Funktionen, die unwillkürliche Muskelkontraktionen, ausgelöst durch spezifische Stimuli, betreffen',
  inclusions: [
    'Streckreflexe, automatische lokale Reflexe, Schutzreflexe',
    'Bizepssehnenreflex, Radius-Periost-Reflex, Quadrizepsreflex, Patellarsehnenreflex, Achillessehnenreflex',
  ],
  exclusions: [],
),

  'b7500': IcfDetail(
  title: 'Streckreflexe',
  description: 'Funktionen, die durch Streckung hervorgerufene unwillkürliche Muskelkontraktionen betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7501': IcfDetail(
  title: 'Reflexe durch schädigende Stimuli',
  description: 'Funktionen, die durch schmerzhafte oder andere schädigende Stimuli hervorgerufene unwillkürliche Muskelkontraktionen betreffen',
  inclusions: [
    'Schutzreflex',
  ],
  exclusions: [],
),

  'b7502': IcfDetail(
  title: 'Reflexe durch andere exterozeptive Stimuli',
  description: 'Funktionen, die durch andere exterozeptive Stimuli hervorgerufene unwillkürliche Muskelkontraktionen betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7508': IcfDetail(
  title: 'Funktionen der motorischen Reflexe, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7509': IcfDetail(
  title: 'Funktionen der motorischen Reflexe, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b755': IcfDetail(
  title: 'Funktionen der unwillkürlichen Bewegungsreaktionen',
  description: 'Funktionen, die unwillkürliche Kontraktionen großer Muskeln oder des ganzen Körpers, ausgelöst durch Körperhaltung, Gleichgewichts- und Schreckreaktionen, betreffen',
  inclusions: [
    'Reaktionen auf Lagewechsel, Aufrichtung, Körper-Anpassung',
    'Gleichgewichtsreaktionen, Stützreaktionen, Abwehrreaktionen',
  ],
  exclusions: [
    'Funktionen der motorischen Reflexe (b750)',
  ],
),

  'b760': IcfDetail(
  title: 'Funktionen der Kontrolle von Willkürbewegungen',
  description: 'Funktionen, die mit der Kontrolle und Koordination von willkürlichen Bewegungen verbunden sind',
  inclusions: [
    'Kontrolle einfacher und komplexer Willkürbewegungen',
    'Koordination von Willkürbewegungen, Stützfunktionen der Arme oder Beine',
    'Motorische Rechts-Links-Koordination, Auge-Hand-Koordination, Auge-Fuß-Koordination',
    'Funktionsstörungen wie Kontroll- und Koordinationsprobleme, Dysdiadochokinese',
  ],
  exclusions: [
    'Funktionen der Muskelkraft (b730)',
    'Funktionen der unwillkürlichen Bewegungen (b765)',
    'Funktionen der Bewegungsmuster beim Gehen (b770)',
  ],
),

  'b7600': IcfDetail(
  title: 'Kontrolle einfacher Willkürbewegungen',
  description: 'Funktionen, die mit der Kontrolle und Koordination einfacher oder isolierter Willkürbewegungen verbunden sind',
  inclusions: [],
  exclusions: [],
),

  'b7601': IcfDetail(
  title: 'Kontrolle komplexer Willkürbewegungen',
  description: 'Funktionen, die mit der Kontrolle und Koordination komplexer Willkürbewegungen verbunden sind',
  inclusions: [],
  exclusions: [],
),

  'b7602': IcfDetail(
  title: 'Koordination von Willkürbewegungen',
  description: 'Funktionen, die mit der Koordination einfacher oder komplexer Willkürbewegungen, Ausführung von Bewegungen in richtiger Kombination verbunden sind',
  inclusions: [
    'Rechts-Links-Koordination, Koordination visüll gesteürter Bewegungen',
    'Auge-Hand-Koordination, Auge-Fuß-Koordination',
    'Dysdiadochokinese',
  ],
  exclusions: [],
),

  'b7603': IcfDetail(
  title: 'Stützbewegungen der Arme oder Beine',
  description: 'Funktionen, die mit der Kontrolle und Koordination von Willkürbewegungen durch Abstützung entweder durch die Arme oder die Beine verbunden sind',
  inclusions: [],
  exclusions: [],
),

  'b7608': IcfDetail(
  title: 'Funktionen der Kontrolle der Willkürbewegungen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7609': IcfDetail(
  title: 'Funktionen der Kontrolle der Willkürbewegungen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b765': IcfDetail(
  title: 'Funktionen der unwillkürlichen Bewegungen',
  description: 'Funktionen, die die unbeabsichtigten, nicht- oder halbzweckgerichteten unwillkürlichen Kontraktionen von Muskeln oder Muskelgruppen betreffen',
  inclusions: [
    'Unwillkürliche Muskelkontraktionen, Tremor, Tics, Manierismen, Stereotypien, Perserverationen',
    'Chorea, Athetose, Stimmtics, dystonische Bewegungen, Dyskinesie',
  ],
  exclusions: [
    'Funktionen der Kontrolle von Willkürbewegungen (b760)',
    'Funktionen der Bewegungsmuster beim Gehen (b770)',
  ],
),

  'b7650': IcfDetail(
  title: 'Unwillkürliche Muskelkontraktionen',
  description: 'Funktionen, die die unbeabsichtigten, nicht- oder halbzweckgerichteten unwillkürlichen Kontraktionen eines Muskels oder von Muskelgruppen betreffen',
  inclusions: [
    'Choreatische Bewegungen, athetotische Bewegungen',
    'Schlafabhängige Bewegungsstörungen',
  ],
  exclusions: [],
),

  'b7651': IcfDetail(
  title: 'Tremor',
  description: 'Funktionen, die die abwechselnde Anspannung und Entspannung von Muskelgruppen um ein Gelenk, die zu Zittern führen, betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7652': IcfDetail(
  title: 'Tics und Manierismen',
  description: 'Funktionen, die sich wiederholende, scheinbar zweckgerichtete, unwillkürliche Kontraktionen von Muskelgruppen betreffen',
  inclusions: [
    'Stimmtics, Koprolalie, Zähneknirschen',
  ],
  exclusions: [],
),

  'b7653': IcfDetail(
  title: 'Stereotypien und motorische Perserverationen',
  description: 'Funktionen, die die spontanen, nicht zweckgerichteten Bewegungen wie Vor- und Zurückschaukeln und Kopfnicken oder Wackeln betreffen',
  inclusions: [],
  exclusions: [],
),

  'b7658': IcfDetail(
  title: 'Funktionen der unwillkürlichen Bewegungen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7659': IcfDetail(
  title: 'Funktionen der unwillkürlichen Bewegungen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b770': IcfDetail(
  title: 'Funktionen der Bewegungsmuster beim Gehen',
  description: 'Funktionen, die die Bewegungsmuster beim Gehen, Rennen oder anderen Bewegungsabläufen des gesamten Körpers betreffen',
  inclusions: [
    'Bewegungsmuster beim Gehen und Rennen',
    'Funktionsstörungen wie spastisches Gangbild, hemiplegisches Gangbild, paraplegisches Gangbild, asymmetrisches Gangbild, Hinken, steifes Gangbild',
  ],
  exclusions: [
    'Funktionen der Muskelkraft (b730)',
    'Funktionen des Muskeltonus (b735)',
    'Funktionen der Kontrolle von Willkürbewegungen (b760)',
    'Funktionen der unwillkürlichen Bewegungen (b765)',
  ],
),

  'b780': IcfDetail(
  title: 'Mit den Funktionen der Muskeln und der Bewegung in Zusammenhang stehende Empfindungen',
  description: 'Empfindungen, die mit den Muskeln oder Muskelgruppen des Körpers und ihren Bewegungen verbunden sind',
  inclusions: [
    'Empfindungen von Muskelsteifigkeit, Muskelverspannung, Muskelkrämpfe, Muskelanspannung, Schweregefühl der Muskeln',
  ],
  exclusions: [
    'Schmerz (b280)',
  ],
),

  'b7800': IcfDetail(
  title: 'Empfindung von Muskelsteifigkeit',
  description: 'Empfindung von Muskelverspannung oder -steifigkeit',
  inclusions: [],
  exclusions: [],
),

  'b7801': IcfDetail(
  title: 'Empfindung von Muskelspasmus',
  description: 'Empfindung einer unwillkürlichen Kontraktion von Muskeln oder Muskelgruppen',
  inclusions: [],
  exclusions: [],
),

  'b7808': IcfDetail(
  title: 'Mit den Funktionen der Muskeln und der Bewegung in Zusammenhang stehende Empfindungen, anders bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b7809': IcfDetail(
  title: 'Mit den Funktionen der Muskeln und der Bewegung in Zusammenhang stehende Empfindungen, nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b789': IcfDetail(
  title: 'Funktionen der Bewegung, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b810': IcfDetail(
  title: 'Schutzfunktionen der Haut',
  description: 'Funktionen der Haut zum Schutz des Körpers vor schädlichen physikalischen, chemischen und biologischen Einflüssen',
  inclusions: [
    'Schutz gegen Sonnenstrahlung und andere Strahlen, Lichtempfindlichkeit, Pigmentierung, Hauttyp',
    'Fähigkeit der Wärmeregulierung, Narbenbildung, Induration',
    'Funktionsstörungen wie Rissbildung, Geschwüre, Dekubitus, Atrophie',
  ],
  exclusions: [
    'Heilfunktion der Haut (b820)',
    'Andere Funktionen der Haut (b830)',
  ],
),

  'b820': IcfDetail(
  title: 'Heilfunktion der Haut',
  description: 'Funktionen, die die Heilung von Wunden und anderen Schäden der Haut betreffen',
  inclusions: [
    'Funktionen der Krustenbildung, Heilung, Narbenbildung',
    'Qütschung, Keloidbildung',
  ],
  exclusions: [
    'Schutzfunktionen der Haut (b810)',
    'Andere Funktionen der Haut (b830)',
  ],
),

  'b830': IcfDetail(
  title: 'Andere Funktionen der Haut',
  description: 'Funktionen der Haut außer Schutz und Wiederherstellung, wie Kühlen und Schweißabsonderung',
  inclusions: [
    'Funktionen des Schwitzens, Funktionen der Hautdrüsen, Körpergeruch',
  ],
  exclusions: [
    'Schutzfunktionen der Haut (b810)',
    'Heilfunktion der Haut (b820)',
  ],
),

  'b840': IcfDetail(
  title: 'Auf die Haut bezogene Empfindungen',
  description: 'Empfindungen im Zusammenhang mit der Haut, wie Juckreiz, brennende und stechende Empfindungen',
  inclusions: [
    'Kribbelgefühl, Ameisenlaufen',
  ],
  exclusions: [
    'Schmerz (b280)',
  ],
),

  'b849': IcfDetail(
  title: 'Funktionen der Haut, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  'b850': IcfDetail(
  title: 'Funktionen des Haars',
  description: 'Funktionen, die das Haar betreffen, wie Schutz, Farbe und Aussehen',
  inclusions: [
    'Funktionen des Wachstums und der Pigmentierung des Haars, Lokalisation',
    'Funktionsstörungen wie Haarverlust oder Alopezie',
  ],
  exclusions: [],
),

  'b860': IcfDetail(
  title: 'Funktionen der Nägel',
  description: 'Funktionen, die die Nägel betreffen, wie Schutz, Kratzen und Aussehen',
  inclusions: [
    'Wachstum und Pigmentierung der Nägel, Qualität der Nägel',
  ],
  exclusions: [],
),

  'b869': IcfDetail(
  title: 'Funktionen des Haars und der Nägel, anders oder nicht näher bezeichnet',
  description: '',
  inclusions: [],
  exclusions: [],
),

  // ===========================================================================
  // s - KOERPERSTRUKTUREN + e - UMWELTFAKTOREN
  // ===========================================================================

  // --- Kapitel s1: Koerperstrukturen ---
  's110': IcfDetail(
    title: 'Strukur des Gehirns',
  ),
  's120': IcfDetail(
    title: 'Struktur des Rückenmarks und mit ihm in Zusammenhang stehende Strukturen',
  ),
  's130': IcfDetail(
    title: 'Struktur der Hirnhaut',
  ),
  's140': IcfDetail(
    title: 'Struktur des sympathischen Nervensystems',
  ),
  's150': IcfDetail(
    title: 'Struktur des parasympathischen Nervensystems',
  ),
  's198': IcfDetail(
    title: 'Struktur des Nervensystems, anders bezeichnet',
  ),
  's199': IcfDetail(
    title: 'Struktur des Nervensystems, nicht näher bezeichnet',
  ),
  // --- Kapitel s2: Koerperstrukturen ---
  's210': IcfDetail(
    title: 'Struktur der Augenhöhle (Orbita)',
  ),
  's220': IcfDetail(
    title: 'Struktur des Augapfels (Bulbus)',
  ),
  's230': IcfDetail(
    title: 'Strukturen um das Auge herum',
  ),
  's240': IcfDetail(
    title: 'Struktur des äußeren Ohres',
  ),
  's250': IcfDetail(
    title: 'Struktur des Mittelohres',
  ),
  's260': IcfDetail(
    title: 'Struktur des Innenohres',
  ),
  's298': IcfDetail(
    title: 'Strukturen des Auges, des Ohres und mit ihnen in Zusammenhang stehende Strukturen, anders bezeichnet',
  ),
  's299': IcfDetail(
    title: 'Strukturen des Auges, des Ohres und mit ihnen in Zusammenhang stehende Strukturen, nicht näher bezeichnet',
  ),
  // --- Kapitel s3: Koerperstrukturen ---
  's310': IcfDetail(
    title: 'Struktur der Nase',
  ),
  's320': IcfDetail(
    title: 'Struktur des Mundes',
  ),
  's330': IcfDetail(
    title: 'Struktur des Pharynx',
  ),
  's340': IcfDetail(
    title: 'Struktur des Kehlkopfes',
  ),
  's398': IcfDetail(
    title: 'Strukturen, die an der Stimme und am Sprechen beteiligt sind, anders bezeichnet',
  ),
  's399': IcfDetail(
    title: 'Strukturen, die an der Stimme und am Sprechen beteiligt sind, nicht näher bezeichnet',
  ),
  // --- Kapitel s4: Koerperstrukturen ---
  's410': IcfDetail(
    title: 'Struktur des kardiovaskulären Systems',
  ),
  's420': IcfDetail(
    title: 'Struktur des Immunsystems',
  ),
  's430': IcfDetail(
    title: 'Struktur des Atmungssystems',
  ),
  's498': IcfDetail(
    title: 'Strukturen des kardiovaskulären, des Immun- und des Atmungssystems, anders bezeichnet',
  ),
  's499': IcfDetail(
    title: 'Strukturen des kardiovaskulären, des Immun- und des Atmungssystems, nicht näher bezeichnet',
  ),
  // --- Kapitel s5: Koerperstrukturen ---
  's510': IcfDetail(
    title: 'Struktur der Speicheldrüsen',
  ),
  's520': IcfDetail(
    title: 'Struktur der Speiseröhre',
  ),
  's530': IcfDetail(
    title: 'Struktur des Magens',
  ),
  's540': IcfDetail(
    title: 'Struktur des Darms',
  ),
  's550': IcfDetail(
    title: 'Struktur der Bauchspeicheldrüse',
  ),
  's560': IcfDetail(
    title: 'Struktur der Leber',
  ),
  's570': IcfDetail(
    title: 'Struktur der Gallenwege',
  ),
  's580': IcfDetail(
    title: 'Struktur der endokrinen Drüsen',
  ),
  's598': IcfDetail(
    title: 'Mit dem Verdauungs-, Stoffwechsel- und endokrinen System in Zusammenhang stehende Strukturen, anders bezeichnet',
  ),
  's599': IcfDetail(
    title: 'Mit dem Verdauungs-, Stoffwechsel- und endokrinen System in Zusammenhang stehende Strukturen, nicht näher bezeichnet',
  ),
  // --- Kapitel s6: Koerperstrukturen ---
  's610': IcfDetail(
    title: 'Struktur der ableitenden Harnwege',
  ),
  's620': IcfDetail(
    title: 'Struktur des Beckenbodens',
  ),
  's630': IcfDetail(
    title: 'Struktur der Geschlechtsorgane',
  ),
  's698': IcfDetail(
    title: 'Strukturen im Zusammenhang mit dem Urogenitalsystem, anders bezeichnet',
  ),
  's699': IcfDetail(
    title: 'Strukturen im Zusammenhang mit dem Urogenitalsystem, nicht näher bezeichnet',
  ),
  // --- Kapitel s7: Koerperstrukturen ---
  's710': IcfDetail(
    title: 'Struktur der Kopf- und Halsregion',
  ),
  's720': IcfDetail(
    title: 'Struktur der Schulterregion',
  ),
  's730': IcfDetail(
    title: 'Struktur der oberen Extremitäten',
  ),
  's740': IcfDetail(
    title: 'Struktur der Beckenregion',
  ),
  's750': IcfDetail(
    title: 'Struktur der unteren Extremitäten',
  ),
  's760': IcfDetail(
    title: 'Struktur des Rumpfes',
  ),
  's770': IcfDetail(
    title: 'Weitere mit der Bewegung in Zusammenhang stehende muskuloskeletale Strukturen',
  ),
  's798': IcfDetail(
    title: 'Strukturen im Zusammenhang mit der Bewegung, anders bezeichnet',
  ),
  's799': IcfDetail(
    title: 'Strukturen im Zusammenhang mit der Bewegung, nicht näher bezeichnet',
  ),
  // --- Kapitel s8: Koerperstrukturen ---
  's810': IcfDetail(
    title: 'Struktur der Hautregionen',
  ),
  's820': IcfDetail(
    title: 'Struktur der Hautanhangsgebilde',
  ),
  's830': IcfDetail(
    title: 'Struktur der Nägel',
  ),
  's840': IcfDetail(
    title: 'Struktur der Haare',
  ),
  's898': IcfDetail(
    title: 'Strukturen im Zusammenhang mit der Haut, anders bezeichnet',
  ),
  's899': IcfDetail(
    title: 'Strukturen im Zusammenhang mit der Haut, nicht näher bezeichnet',
  ),
  // --- Kapitel e1: Umweltfaktoren ---
  'e110': IcfDetail(
    title: 'Produkte und Substanzen für den persönlichen Verbrauch',
    description: 'Alle natürlichen oder vom Menschen hergestellten Produkte oder Substanzen, für den persönlichen Verbrauch gesammelt, verarbeitet oder hergestellt',
    inclusions: ['Produkte wie Lebensmittel, Heilmittel/Medikamente'],
  ),
  'e115': IcfDetail(
    title: 'Produkte und Technologien zum persönlichen Gebrauch im täglichen Leben',
    description: 'Von Menschen für ihre täglichen Aktivitäten benutzte Ausrüstungsgegenstände, Produkte und Technologien, in oder nahe beim Körper getragen, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Allgemeine und unterstützende Produkte und Technologien für den persönlichen Gebrauch'],
  ),
  'e120': IcfDetail(
    title: 'Produkte und Technologien zur persönlichen Mobilität drinnen und draußen und zum Transport',
    description: 'Ausrüstungsgegenstände, Produkte und Technologien, die von Menschen für ihre Aktivitäten der Mobilität innerhalb und außerhalb von Gebäuden benutzt werden, einschließlich solcher, die angepasst oder speziell entworfen sind, und sich bei ihnen bzw. sich in ihrer Nähe befinden',
    inclusions: ['Allgemeine Hilfsprodukte und unterstützende Technologien für die persönliche Mobilität drinnen und draußen'],
  ),
  'e125': IcfDetail(
    title: 'Produkte und Technologien zur Kommunikation',
    description: 'Von Menschen für ihre Aktivitäten des Sendens und Empfangens von Informationen benutzte Ausrüstungsgegenstände, Produkte und Technologien, die sich im oder am Körper des Benutzers oder in seiner Nähe befinden, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Allgemeine Hilfsprodukte und unterstützende Technologien für die Kommunikation'],
  ),
  'e130': IcfDetail(
    title: 'Produkte und Technologien für Bildung/Ausbildung',
    description: 'Von Menschen für den Erwerb von Wissen, Fachwissen oder Fertigkeiten benutzte Ausrüstungsgegenstände, Produkte, Verfahren, Methoden und Technologien, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Allgemeine Produkte und unterstützende Technologien für Bildung/ Ausbildung'],
  ),
  'e135': IcfDetail(
    title: 'Produkte und Technologien für die Erwerbstätigkeit',
    description: 'Zur Ermöglichung der Arbeitsaktivitäten im Rahmen der Erwerbstätigkeit benutzte Ausrüstungsgegenstände, Produkte und Technologien',
    inclusions: ['Allgemeine und Hilfsprodukte und unterstützende Technologien für die Erwerbstätigkeit'],
  ),
  'e140': IcfDetail(
    title: 'Produkte und Technologien für Kultur, Freizeit und Sport',
    description: 'Für die Durchführung und Verbesserung der Kultur-, Freizeit- und Sportaktivitäten benutzte Ausrüstungsgegenstände, Produkte und Technologien, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Allgemeine und Hilfsprodukte und unterstützende Technologien für Kultur, Freizeit und Sport'],
  ),
  'e145': IcfDetail(
    title: 'Produkte und Technologien zur Ausübung von Religion und Spiritualität',
    description: 'Einzel- oder massenproduzierte Produkte und Technologien, denen im Zusammenhang mit der Ausübung von Religion oder Spiritualität eine symbolische Bedeutung zukommt oder gegeben wird, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Allgemeine und Hilfsprodukte und unterstützende Technologien zur Ausübung von Religion und Spiritualität'],
  ),
  'e150': IcfDetail(
    title: 'Entwurf, Konstruktion sowie Bauprodukte und Technologien von öffentlichen Gebäuden',
    description: 'Produkte und Technologien, für den öffentlichen Zugang geplant und konstruiert, welche die bebaute Umgebung (Innen- und Außenbereiche) eines Individuums bilden, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Entwurf, Konstruktion und Bauprodukte und Technologien von Ein- und Ausgängen, Einrichtungen und Wegeführung'],
  ),
  'e155': IcfDetail(
    title: 'Entwurf, Konstruktion sowie Bauprodukte und Technologien von privaten Gebäuden',
    description: 'Produkte und Technologien, für die private Nutzung geplant und konstruiert, welche die bebaute Umgebung (Innen- und Außenbereiche) eines Individuums bilden, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Entwurf, Konstruktion und Bauprodukte und Technologien von Ein- und Ausgängen, Einrichtungen und Wegeführung'],
  ),
  'e160': IcfDetail(
    title: 'Produkte und Technologien der Flächennutzung',
    description: 'Produkte und Technologien für den Außenbereich, soweit sie sich auf die äußere Umgebung eines Individuums durch Umsetzung von Flächennutzungspolitik sowie der Raumplanung und -entwicklung auswirken, einschließlich solcher, die angepasst oder speziell entworfen sind',
    inclusions: ['Produkte und Technologien für den Außenbereich, die durch die Umsetzung von Flächennutzungspolitik geregelt werden wie ländliche Gebiete, Vorortsgebiete, Stadtgebiete, Parks, Natur- und Wildschutzgebiete'],
  ),
  'e165': IcfDetail(
    title: 'Vermögenswerte',
    description: 'Produkte oder Gegenstände des wirtschaftlichen Handels wie Geld, Waren, Immobilien und andere Wertsachen, die einem Individuum gehören oder zu deren Verwendung es berechtigt ist',
    inclusions: ['Materielle und immaterielle Produkte und Güter, finanzielle Vermögenswerte'],
  ),
  'e198': IcfDetail(
    title: 'Produkte und Technologien, anders bezeichnet',
  ),
  'e199': IcfDetail(
    title: 'Produkte und Technologien, nicht näher bezeichnet',
  ),
  // --- Kapitel e2: Umweltfaktoren ---
  'e210': IcfDetail(
    title: 'Physikalische Geographie',
    description: 'Merkmale der Landformen und Gewässer',
    inclusions: ['Merkmale der Geographie bezüglich Orographie (Relief, Art und Ausmaß von Land und Landformen einschließlich Höhe) und Hydrographie (Gewässer)'],
  ),
  'e215': IcfDetail(
    title: 'Bevölkerung',
    description: 'Gruppen von Menschen, die in einer bestimmten Umwelt leben, und die gleiche Art von Umweltanpassung aufweisen',
    inclusions: ['Demographischer Wandel, Bevölkerungsdichte'],
  ),
  'e220': IcfDetail(
    title: 'Flora und Fauna',
    description: 'Pflanzen und Tiere',
    exclusions: ['Domestizierte Tiere (e350) , Bevölkerung (e215)', 'Vermögenswerte (e165); Domestizierte Tiere (e350)'],
  ),
  'e225': IcfDetail(
    title: 'Klima',
    description: 'Meteorologische Merkmale und Ereignisse wie das Wetter',
    inclusions: ['Temperatur, Luftfeuchtigkeit, Luftdruck, Niederschlag, Wind und jahreszeitabhängige Veränderungen'],
  ),
  'e230': IcfDetail(
    title: 'Natürliche Ereignisse',
    description: 'Regelmäßige oder unregelmäßige geographische und atmosphärische Veränderungen, die eine erhebliche Beeinträchtigung der Umwelt eines Individuums zur Folge haben, wie Erdbeben, Unwetter, z.B. Orkane, Tornados, Hurrikane, Überflutungen, Waldbrände, Eisstürme',
  ),
  'e235': IcfDetail(
    title: 'Vom Menschen verursachte Ereignisse',
    description: 'Vom Menschen verursachte Veränderungen oder Störungen der natürlichen Umwelt, die eine erhebliche Beeinträchtigung des täglichen Lebens der Menschen der Region zur Folge haben können, einschließlich Ereignisse oder Bedingungen im Zusammenhang mit Konflikten und Kriegen, wie Vertreibung von Menschen, Zerstörung der sozialen Infrastruktur, von Häusern und Land, Umweltkatastrophen sowie Land-, Wasser- und Luftverschmutzung (z.B. Freisetzung giftiger Substanzen)',
  ),
  'e240': IcfDetail(
    title: 'Licht',
    description: 'Elektromagnetische Strahlung, durch die Dinge sichtbar gemacht werden, entweder durch Sonnenlicht oder künstliches Licht (z.B. Kerzen, Öl- oder Petroleumlampen, Feür und Elektrizität) und die nützliche oder verwirrende Informationen über die Welt liefern kann',
    inclusions: ['Lichtintensität, Lichtqualität, Farbkontraste'],
  ),
  'e245': IcfDetail(
    title: 'Zeitbezogene Veränderungen',
    description: 'Natürliche, regelmäßige oder vorhersagbare zeitliche Veränderungen',
    inclusions: ['Tag/Nacht-Zyklen und Mondphasen'],
  ),
  'e250': IcfDetail(
    title: 'Laute und Geräusche',
    description: 'Phänomene, die gehört werden oder gehört werden können, wie Knallen, Klingeln, Hämmern, Singen, Pfeifen, Schreien oder Brummen, in jeder Lautstärke, Tonhöhe oder Ton, und die nützliche oder verwirrende Informationen über die Welt liefern können',
    inclusions: ['Laut-/Geräuschintensität oder -stärke und Laut-/Geräuschqualität'],
  ),
  'e255': IcfDetail(
    title: 'Schwingung',
    description: 'Regelmäßige oder unregelmäßige Hin- und Herbewegung eines Gegenstandes oder einer Person infolge einer physikalischen Störung, wie Schütteln, Beben, schnelle ruckartige Bewegungen von Dingen, Gebäuden oder Menschen, verursacht durch kleine oder große Ausrüstung, Luftfahrzeuge und Explosionen',
    exclusions: ['Natürliche Ereignisse (e230), wie Vibration oder Zittern der Erde infolge eines Erdbebens'],
  ),
  'e260': IcfDetail(
    title: 'Luftqualität',
    description: 'Eigenschaften der Atmosphäre (außerhalb von Gebäuden) oder der Luft in umschlossenen Räumen (innerhalb von Gebäuden), und die nützliche oder verwirrende Informationen über die Welt liefern können',
    inclusions: ['Luftqualität in Innen- oder Außenbereichen'],
  ),
  'e298': IcfDetail(
    title: 'Natürliche und vom Menschen veränderte Umwelt, anders bezeichnet',
  ),
  'e299': IcfDetail(
    title: 'Natürliche und vom Menschen veränderte Umwelt, nicht näher bezeichnet',
  ),
  // --- Kapitel e3: Umweltfaktoren ---
  'e310': IcfDetail(
    title: 'Engster Familienkreis',
    description: 'Personen, die infolge Geburt oder Heirat verwandt sind oder andere Beziehungen, die von der Kultur als \'engster Familienkreis\' anerkannt sind, wie Ehepartner, Lebensgefährten, Eltern, Geschwister, Kinder, Pflegeeltern, Adoptiveltern und Großeltern',
    exclusions: ['Erweiterter Familienkreis (e315); Persönliche Hilfs- und Pflegepersonen (e340)'],
  ),
  'e315': IcfDetail(
    title: 'Erweiterter Familienkreis',
    description: 'Personen, die über Familie oder Heirat verwandt sind oder andere Beziehungen, die von der Kultur als \'erweiterter Familienkreis\' anerkannt sind, wie Tanten, Onkel, Neffen, Nichten',
    exclusions: ['Engster Familienkreis (e310)'],
  ),
  'e320': IcfDetail(
    title: 'Freunde',
    description: 'Personen, die sich nahe stehen und deren kontinuierliche Bekanntschaft durch Vertraün und gegenseitige Unterstützung gekennzeichnet ist',
  ),
  'e325': IcfDetail(
    title: 'Bekannte, Seinesgleichen (Peers), Kollegen, Nachbarn und andere Gemeindemitglieder',
    description: 'Personen, die sich als Bekannte, Seinesgleichen, Kollegen, Nachbarn und als Gemeindemitglieder kennen, etwa von der Arbeit, Schule oder Freizeit, über Kommunikationssysteme wie Telefon, Fernschreiber, Internet, E-Mail oder über andere Möglichkeiten, und die demographische Eigenschaften wie Alter, Geschlecht, religiöses Bekenntnis, ethnische Zugehörigkeit oder gemeinsame Interesse teilen',
    exclusions: ['Dienste von Vereinigungen und Organisationen (e5550)'],
  ),
  'e330': IcfDetail(
    title: 'Autoritätspersonen',
    description: 'Personen mit Entscheidungsverantwortung für andere, die infolge ihrer sozialen, ökonomischen, kulturellen oder religiösen Rollen in der Gesellschaft sozial definierten Einfluss oder Befugnisse haben, wie Lehrer, Arbeitgeber, Supervisoren, religiöse Führer, Vertreter im Amt, Vormund, Treuhänder',
  ),
  'e335': IcfDetail(
    title: 'Untergebene',
    description: 'Personen, deren tägliches Leben bei der Arbeit, in der Schule oder in anderen Bereichen durch Autoritätspersonen beeinflusst wird, wie Schüler, Studenten, Arbeiter und Mitglieder religiöser Gruppen',
    exclusions: ['Engster Familienkreis (e310)'],
  ),
  'e340': IcfDetail(
    title: 'Persönliche Hilfs- und Pflegepersonen',
    description: 'Personen, die Dienstleistungen erbringen, welche erforderlich sind, um Personen bei ihren täglichen Aktivitäten, bei der Erhaltung und Durchführung der Arbeit am Arbeitsplatz, im Bildungs-/Ausbildungsbereich oder in anderen Lebenssituationen zu unterstützen, wobei dieser Dienst entweder durch öffentliche oder private Träger erfolgt oder auf ehrenamtlicher Basis, wie Anbieter von Hilfen bei Hausarbeit und Haushaltsführung, personeller Assistenz, Assistenz beim Transport und anderen Unterstützungserfordernissen durch bezahlte Hilfen, Kindermädchen und andere, die vornehmlich Betreuungs- oder Pflegeleistungen erbringen',
    exclusions: ['Engster Familienkreis (e310) , Bekannte, Seinesgleichen (Peers), Kollegen, Nachbarn und andere Gemeindemitglieder (e325)'],
  ),
  'e345': IcfDetail(
    title: 'Fremde',
    description: 'Personen, die sich weder kennen noch verwandt sind oder die bisher weder eine Beziehung eingegangen sind noch Kontakt züinander haben, einschließlich Personen, die einer bestimmten Person zwar unbekannt sind, die jedoch eine Lebenssituation mit ihr teilen, wie Vertretungslehrer, Mitarbeiter oder Pflegekräfte',
  ),
  'e350': IcfDetail(
    title: 'Domestizierte Tiere',
    description: 'Tiere, die physische, emotionale oder psychische Unterstützung geben, wie Haustiere (Hunde, Katzen, Vögel, Fische usw.) und Tiere für persönliche Mobilität und Transport',
    exclusions: ['Tiere (e2201); Vermögenswerte (e165)'],
  ),
  'e355': IcfDetail(
    title: 'Fachleute der Gesundheitsberufe',
    description: 'Alle Dienstleistungserbringer, die im Gesundheitssystem arbeiten, wie Ärzte, Pflegekräfte, Physiotherapeuten, Ergotherapeuten, Sprachtherapeuten, Audiologen, Hersteller von Orthesen und Prothesen, Sozialarbeiter im Gesundheitswesen',
    exclusions: ['Andere Fachleute (e360)'],
  ),
  'e360': IcfDetail(
    title: 'Andere Fachleute',
    description: 'Alle Fachleute, die außerhalb des Gesundheitssystems arbeiten, einschließlich Sozialarbeiter, Rechtanwälte, Lehrer, Architekten und Konstrukteure',
    exclusions: ['Fachleute der Gesundheitsberufe (e355)'],
  ),
  'e398': IcfDetail(
    title: 'Unterstützung und Beziehungen, anders bezeichnet',
  ),
  'e399': IcfDetail(
    title: 'Unterstützung und Beziehungen, nicht näher bezeichnet',
  ),
  // --- Kapitel e4: Umweltfaktoren ---
  'e410': IcfDetail(
    title: 'Individülle Einstellungen der Mitglieder des engsten Familienkreises',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen der Mitglieder des engsten Familienkreises, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e415': IcfDetail(
    title: 'Individülle Einstellungen der Mitglieder des erweiterten Familienkreises',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen der Mitglieder des erweiterten Familienkreises, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e420': IcfDetail(
    title: 'Individülle Einstellungen von Freunden',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von Freunden, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e425': IcfDetail(
    title: 'Individülle Einstellungen von Bekannten, Seinesgleichen (Peers), Kollegen, Nachbarn und anderen Gemeindemitgliedern',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von Bekannten, Seinesgleichen (Peers), Kollegen, Nachbarn und anderen Gemeindemitgliedern, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e430': IcfDetail(
    title: 'Individülle Einstellungen von Autoritätspersonen',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von Autoritätspersonen, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e435': IcfDetail(
    title: 'Individülle Einstellungen von Untergebenen',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von Untergebenen, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e440': IcfDetail(
    title: 'Individülle Einstellungen von persönlichen Hilfs- und Pflegepersonen',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von persönlichen Hilfs- und Pflegepersonen, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e445': IcfDetail(
    title: 'Individülle Einstellungen von Fremden',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von Fremden, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e450': IcfDetail(
    title: 'Individülle Einstellungen von Fachleuten der Gesundheitsberufe',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von Fachleuten der Gesundheitsberufe, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e455': IcfDetail(
    title: 'Individülle Einstellungen von anderen Fachleuten',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen von anderen Fachleuten, die eine bestimmte Person oder andere Dinge (z.B. soziale, politische und ökonomische Themen) betreffen, und die individülles Verhalten und Handlungen beeinflussen',
  ),
  'e460': IcfDetail(
    title: 'Gesellschaftliche Einstellungen',
    description: 'Allgemeine oder spezifische Meinungen und Überzeugungen, die im allgemeinen von Mitgliedern einer Kultur, Gesellschaft oder subkulturellen oder anderen gesellschaftlichen Gruppen zu anderen Menschen oder zu sozialen, politischen und ökonomischen Themen vertreten werden, und die Verhaltensweisen oder Handlungen einer Einzelperson oder Personengruppe beeinflussen',
  ),
  'e465': IcfDetail(
    title: 'Gesellschaftliche Normen, Konventionen und Weltanschauungen',
    description: 'Sitten, Praktiken/Bräuche, Regeln sowie abstrakte Wertsysteme und normative Überzeugungen (z. B. Ideologien, normative Weltanschauungen und moralphilosophische Ansichten), welche innerhalb gesellschaftlicher Kontexte entstehen, und die gesellschaftliche und individülle Gewohnheiten und Verhaltensweisen beeinflussen oder schaffen, wie gesellschaftliche Normen der Moral, der religiösen Verhaltensweisen oder Etikette; religiöse Lehren und daraus abgeleitete Normen und Konventionen; Normen, die Rituale oder das Zusammensein sozialer Gruppen bestimmen',
  ),
  'e498': IcfDetail(
    title: 'Einstellungen, anders bezeichnet',
  ),
  'e499': IcfDetail(
    title: 'Einstellungen, nicht näher bezeichnet',
  ),
  // --- Kapitel e5: Umweltfaktoren ---
  'e510': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze für die Konsumgüterproduktion',
    description: 'Dienste, Systeme und Handlungsgrundsätze, welche die Grundlage bilden und Vorsorge treffen für die Produktion von Objekten und Erzeugnissen, die von Menschen verbraucht oder benutzt werden',
    exclusions: ['Dienste des Bildungs- und Ausbildungswesens (e5850); Dienste des Kommunikationswesens (e5350); Kapitel 1'],
  ),
  'e515': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Architektur- und Bauwesens',
    description: 'Dienste, Systeme und Handlungsgrundsätze für Entwurf und Bau von öffentlichen und privaten Bauten',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze der Stadt- und Landschaftsplanung (e520)'],
  ),
  'e520': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze der Stadt- und Landschaftsplanung',
    description: 'Dienste, Systeme und Handlungsgrundsätze für Planung, Entwurf, Entwicklung und Unterhaltung von öffentlichem Land (z.B. Parks, Forsten, Uferlinien, Feuchtgebiete) und privatem Grund im ländlichen, vorörtlichen und städtischen Zusammenhang',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze des Architektur- und Bauwesens (e515)', 'Entwurf, Konstruktion sowie Bauprodukte und Technologien von öffentlichen (e150) und privaten (e155) Gebäuden; Produkte und Technologien der Flächennutzung (e160)'],
  ),
  'e525': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Wohnungswesens',
    description: 'Dienste, Systeme und Handlungsgrundsätze für Bereitstellung von Unterkünften, Wohnungen oder möblierten Zimmern für Menschen',
  ),
  'e530': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Versorgungswesens',
    description: 'Dienste, öffentliche Einrichtungen und rechtliche Vorschriften für öffentlich bereit gestellte Versorgungsleistungen wie Wasser, Brennstoff, Elektrizität, Entsorgung, öffentlicher Transport und andere notwendige Dienste',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze für den zivilen Schutz und Sicherheit (e545)'],
  ),
  'e535': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Kommunikationswesens',
    description: 'Dienste, öffentliche Einrichtungen und rechtliche Vorschriften für Übermittlung und Austausch von Informationen',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze des Medienwesens (e560)', 'Dienste des Medienwesens (e5600)'],
  ),
  'e540': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Transportwesens',
    description: 'Dienste, Systeme und Handlungsgrundsätze für die Beförderung von Menschen und Gütern von einem Ort zu einem anderen',
    exclusions: ['Produkte und Technologien zur persönlichen Mobilität drinnen und draußen und Transport (e120)', 'Dienste, Systeme und Handlungsgrundsätze der sozialen Sicherheit (e570)'],
  ),
  'e545': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze für zivilen Schutz und Sicherheit',
    description: 'Dienste, öffentliche Einrichtungen und rechtliche Vorschriften zum Schutz von Person und Besitz',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze des Versorgungswesens (e530)'],
  ),
  'e550': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze der Rechtspflege',
    description: 'Dienste, öffentliche Einrichtungen und Handlungsgrundsätze, die die Gesetzgebung und andere Rechtsprechung eines Landes betreffen',
  ),
  'e555': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze von Vereinigungen und Organisationen',
    description: 'Dienste und Programme von Personen, die sich zwecks Verfolgung allgemeiner, nicht-kommerzieller Interessen mit anderen Personen mit gleichen Interessen zusammengeschlossen haben, wobei die Erbringung solcher Dienste an eine Mitgliedschaft gebunden sein kann',
  ),
  'e560': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Medienwesens',
    description: 'Dienste, Systeme und Handlungsgrundsätze für die Massenkommunikation über Radio, Fernsehen, Zeitungen und Internet',
    inclusions: ['Bedarf an Untertitelung beim Fernsehen, Braille-Versionen von Zeitungen und anderen Veröffentlichungen sowie Teletext-Radiosendungen'],
    exclusions: ['Dienste des Kommunikationswesens (e5350)', 'Systeme des Kommunikationswesens (e5351)', 'Handlungsgrundsätze des Kommunikationswesens (e5352)'],
  ),
  'e565': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze der Wirtschaft',
    description: 'Dienste und Programme zu Produktion, Verteilung, Verbrauch und Verwendung von Gütern und Dienstleistungen',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze der sozialen Sicherheit (e570)', 'Dienste des Versorgungswesens (e5300); Dienste des Arbeits- und Beschäftigungswesens (e5900)', 'Systeme des Versorgungswesens (e5301); Systeme des Arbeits- und Beschäftigungswesens (e5901)', 'Handlungsgrundsätze des Versorgungswesens (e5302); Handlungsgrundsätze des Arbeits- und Beschäftigungswesens (e5902)'],
  ),
  'e570': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze der sozialen Sicherheit',
    description: 'Dienste, Systeme und Handlungsgrundsätze für die finanzielle Unterstützung von Menschen, welche aufgrund von Alter, Armut, Arbeitslosigkeit, Gesundheitsproblemen oder Behinderung staatliche Unterstützung benötigen, die entweder durch Steüraufkommen oder Beitragssysteme finanziert wird',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze der Wirtschaft (e565)', 'Dienste des Gesundheitswesens (e5800)'],
  ),
  'e575': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze der allgemeinen sozialen Unterstützung',
    description: 'Dienste, Systeme und Handlungsgrundsätze für diejenigen, die Hilfe in Bereichen wie Einkaufen, Hausarbeit, Beförderung, Selbstversorgung und anderen benötigen, um eine vollständigere Partizipation [Teilhabe] am Leben in der Gesellschaft zu erlangen',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze der sozialen Sicherheit (e570); Persönliche Hilfs- und Pflegepersonen (e340); Dienste, Systeme und Handlungsgrundsätze des Gesundheitswesens (e580)'],
  ),
  'e580': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Gesundheitswesens',
    description: 'Dienste, Systeme und Handlungsgrundsätze zur Vorbeugung und Behandlung von Gesundheitsproblemen, zur medizinischen Rehabilitation und zur Förderung einer gesunden Lebensführung',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze der allgemeinen sozialen Unterstützung (e575)'],
  ),
  'e585': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Bildungs- und Ausbildungswesens',
    description: 'Dienste, Systeme und Handlungsgrundsätze für die Aneignung, Erhaltung und Vergrößerung von Wissen, Fachkenntnissen und beruflichen oder künstlerischen Fertigkeiten. Siehe International Standard Classification of Education der UNESCO (ISCED-1997)',
  ),
  'e590': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze des Arbeits- und Beschäftigungswesens',
    description: 'Dienste, Systeme und Handlungsgrundsätze zur Vermittlung passender Arbeit für Personen, die arbeitslos sind oder den Arbeitsplatz wechseln wollen, oder zur Unterstützung von Arbeitnehmern, die einen Aufstieg beabsichtigen',
    exclusions: ['Dienste, Systeme und Handlungsgrundsätze der Wirtschaft (e565)'],
  ),
  'e595': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze der Politik',
    description: 'Dienste, Systeme und Handlungsgrundsätze, die Abstimmungen, Wahlen und Regieren von Ländern, Regionen, Kommunen sowie internationalen Organisationen betreffen',
  ),
  'e598': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze, anders bezeichnet',
  ),
  'e599': IcfDetail(
    title: 'Dienste, Systeme und Handlungsgrundsätze, nicht näher bezeichnet',
  ),


  // ===========================================================================
  // d - AKTIVITAETEN UND PARTIZIPATION
  // ===========================================================================

  // =========================================================================
  // Kapitel 1: Lernen und Wissensanwendung
  // =========================================================================

  // --- Bewusste sinnliche Wahrnehmungen (d110-d129) ---

  'd110': IcfDetail(
    title: 'Zuschaün',
    description:
        'Absichtsvoll den Sehsinn zu benutzen, um visülle Reize wahrzunehmen, wie einer Sportveranstaltung oder dem Spiel von Kindern zuschaün.',
  ),
  'd115': IcfDetail(
    title: 'Zuhören',
    description:
        'Absichtsvoll den Hörsinn zu benutzen, um akustische Reize wahrzunehmen, wie Radio, Musik oder einen Vortrag hören.',
  ),
  'd120': IcfDetail(
    title: 'Andere bewusste sinnliche Wahrnehmungen',
    description:
        'Absichtsvoll andere elementare Sinne zu benutzen, um Reize wahrzunehmen, wie die materielle Struktur tasten und fühlen, Süsses schmecken oder Blumen riechen.',
  ),
  'd129': IcfDetail(
    title:
        'Bewusste sinnliche Wahrnehmungen, anders oder nicht näher bezeichnet',
  ),

  // --- Elementares Lernen (d130-d159) ---

  'd130': IcfDetail(
    title: 'Nachmachen, nachahmen',
    description:
        'Imitieren oder Nachahmen als elementare Bestandteile des Lernens, wie eine Geste, einen Laut oder einen Buchstaben des Alphabets nachmachen.',
  ),
  'd135': IcfDetail(
    title: 'Üben',
    description:
        'Wiederholen einer Folge von Dingen oder Zeichen als elementarer Bestandteil des Lernens, wie in Zehnerfolgen zählen oder das Vortragen eines Gedichtes einüben.',
  ),
  'd140': IcfDetail(
    title: 'Lesen lernen',
    description:
        'Die Fähigkeit zu entwickeln, Geschriebenes (einschliesslich Braille) flüssig und richtig zu lesen, wie Zeichen und Buchstaben erkennen, Wörter in richtiger Betonung äussern sowie Wörter und Wendungen verstehen.',
  ),
  'd145': IcfDetail(
    title: 'Schreiben lernen',
    description:
        'Die Fähigkeit zu entwickeln, Symbole zu produzieren, die der Darstellung von Lauten, Wörtern oder Wendungen dienen, um Bedeutungen zu vermitteln (einschliesslich schreiben in Braille), wie richtig buchstabieren und die Grammatik korrekt verwenden.',
  ),
  'd150': IcfDetail(
    title: 'Rechnen lernen',
    description:
        'Die Fähigkeit zu entwickeln, mit Zahlen umzugehen sowie einfache und komplexe mathematische Operationen auszuführen, wie mathematische Zeichen für Addition und Subtraktion benutzen sowie die richtige mathematische Operation auf ein Problem anwenden.',
  ),
  'd155': IcfDetail(
    title: 'Sich Fertigkeiten aneignen',
    description:
        'Elementare und komplexe Fähigkeiten für integrierte Mengen von Handlungen und Aufgaben zu entwickeln, um die Aneignung einer Fertigkeit anzugehen und zu Ende zu bringen, wie Werkzeuge handhaben oder Spiele wie Schach spielen.',
    inclusions: [
      'Sich elementare und komplexe Fähigkeiten aneignen',
    ],
  ),
  'd1550': IcfDetail(
    title: 'Sich elementare Fertigkeiten aneignen',
    description:
        'Elementare, bewusste Handlungen zu erlernen, wie mit Essutensilien, einem Bleistift oder einem einfachen Werkzeug umgehen lernen.',
  ),
  'd1551': IcfDetail(
    title: 'Sich komplexe Fertigkeiten aneignen',
    description:
        'Integrierte Mengen von Handlungen zu erlernen, um Regeln zu folgen sowie die eigenen Bewegungen korrekt aufeinander folgen zu lassen und zu koordinieren, wie Fussball spielen oder ein Bauwerkzeug benutzen lernen.',
  ),
  'd1558': IcfDetail(
    title: 'Sich Fertigkeiten aneignen, anders bezeichnet',
  ),
  'd1559': IcfDetail(
    title: 'Sich Fertigkeiten aneignen, nicht näher bezeichnet',
  ),
  'd159': IcfDetail(
    title: 'Elementares Lernen, anders oder nicht näher bezeichnet',
  ),

  // --- Wissensanwendung (d160-d179) ---

  'd160': IcfDetail(
    title: 'Aufmerksamkeit fokussieren',
    description:
        'Sich absichtsvoll auf einen bestimmten Reiz zu konzentrieren, wie ablenkende Geräusche filtern.',
  ),
  'd163': IcfDetail(
    title: 'Denken',
    description:
        'Ideen, Konzepte und Vorstellungen - seien sie zielgerichtet oder nicht - zu formulieren und zu handhaben, allein oder mit anderen, wie eine Fiktion entwickeln, ein Theorem beweisen, mit Ideen spielen, Brainstorming betreiben, meditieren, Vor- und Nachteile abwägen, Vermutungen anstellen, überlegen.',
    exclusions: [
      'Probleme lösen (d175)',
      'Entscheidungen treffen (d177)',
    ],
  ),
  'd166': IcfDetail(
    title: 'Lesen',
    description:
        'Aktivitäten im Zusammenhang mit der Erfassung und Interpretation von Texten (z.B. Bücher, Anweisungen oder Zeitungen - auch in Braille) durchzuführen, um allgemeines Wissen oder besondere Informationen zu erlangen.',
    exclusions: [
      'Lesen lernen (d140)',
    ],
  ),
  'd170': IcfDetail(
    title: 'Schreiben',
    description:
        'Symbole oder Sprache zu verwenden oder zu produzieren, um Informationen zu vermitteln, wie schriftliche Aufzeichnungen von Ereignissen oder Ideen produzieren oder einen Brief entwerfen.',
    exclusions: [
      'Schreiben lernen (d145)',
    ],
  ),
  'd172': IcfDetail(
    title: 'Rechnen',
    description:
        'Berechnungen unter Anwendung mathematischer Prinzipien durchzuführen, um in Worten beschriebene Probleme zu lösen und die Ergebnisse zu produzieren oder darzustellen, wie die Summe aus drei Zahlen berechnen oder das Ergebnis der Division einer Zahl durch eine andere finden.',
    exclusions: [
      'Rechnen lernen (d150)',
    ],
  ),
  'd175': IcfDetail(
    title: 'Probleme lösen',
    description:
        'Lösungen für eine Frage oder Situation zu finden, indem das Problem identifiziert und analysiert wird, Lösungsmöglichkeiten entwickelt und die möglichen Auswirkungen der Lösungen abgeschätzt werden und die gewählte Lösung umgesetzt wird, wie die Auseinandersetzung zweier Personen schlichten.',
    inclusions: [
      'Einfache oder komplexe Probleme lösen',
    ],
    exclusions: [
      'Denken (d163)',
      'Entscheidungen treffen (d177)',
    ],
  ),
  'd1750': IcfDetail(
    title: 'Einfache Probleme lösen',
    description:
        'Lösungen für ein einfaches Problem, das ein einzelnes Thema oder eine einzelne Frage betrifft, zu finden, indem das Problem identifiziert und analysiert wird, Lösungen entwickelt und die möglichen Auswirkungen der Lösungen abgeschätzt werden und die gewählte Lösung umgesetzt wird.',
  ),
  'd1751': IcfDetail(
    title: 'Komplexe Probleme lösen',
    description:
        'Lösungen für ein komplexes Problem, das multiple und voneinander abhängige Themen oder mehrere zusammenhängende Probleme betrifft, zu finden, indem das Problem identifiziert und analysiert wird, Lösungen entwickelt und die möglichen Auswirkungen der Lösungen abgeschätzt werden und die gewählte Lösung umgesetzt wird.',
  ),
  'd1758': IcfDetail(
    title: 'Probleme lösen, anders bezeichnet',
  ),
  'd1759': IcfDetail(
    title: 'Probleme lösen, nicht näher bezeichnet',
  ),
  'd177': IcfDetail(
    title: 'Entscheidungen treffen',
    description:
        'Eine Wahl zwischen Optionen zu treffen, diese umzusetzen und ihre Auswirkungen abzuschätzen, wie einen besonderen Gegenstand auswählen und kaufen, oder sich entscheiden, eine Aufgabe unter vielen, die erledigt werden müssen, übernehmen und diese ausführen.',
    exclusions: [
      'Denken (d163)',
      'Probleme lösen (d175)',
    ],
  ),
  'd179': IcfDetail(
    title: 'Wissen anwenden, anders oder nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 2: Allgemeine Aufgaben und Anforderungen
  // =========================================================================

  'd210': IcfDetail(
    title: 'Eine Einzelaufgabe übernehmen',
    description:
        'Einfache oder komplexe und koordinierte Handlungen bezüglich der mentalen und physischen Bestandteile einer einzelnen Aufgabe auszuführen, wie eine Aufgabe angehen, Zeit, Räumlichkeit und Materialien für die Aufgabe organisieren, die Schritte der Durchführung festlegen, die Aufgabe ausführen und abschliessen sowie eine Aufgabe durchstehen.',
    inclusions: [
      'Eine einfache oder komplexe Aufgabe übernehmen',
      'Eine einzelne Aufgabe unabhängig oder in einer Gruppe übernehmen',
    ],
    exclusions: [
      'Sich Fertigkeiten aneignen (d155)',
      'Probleme lösen (d175)',
      'Entscheidungen treffen (d177)',
      'Mehrfachaufgaben übernehmen (d220)',
    ],
  ),
  'd2100': IcfDetail(
    title: 'Eine einfache Aufgabe übernehmen',
    description:
        'Die einfache Aufgabe vorzubereiten, anzugehen und sich um die erforderliche Zeit und Räumlichkeit zu kümmern; eine einfache Aufgabe mit einem einzelnen grösseren Bestandteil auszuführen, wie ein Buch lesen, einen Brief schreiben oder sein Bett machen.',
  ),
  'd2101': IcfDetail(
    title: 'Eine komplexe Aufgabe übernehmen',
    description:
        'Die komplexe Aufgabe vorzubereiten, anzugehen und sich um die erforderliche Zeit und Räumlichkeit zu kümmern; eine komplexe Aufgabe mit mehr als einem Bestandteil auszuführen, wobei die Bearbeitung in aufeinander folgenden Schritten oder gleichzeitig erfolgen kann, wie die Möbel in seiner Wohnung anordnen oder seine Schularbeiten machen.',
  ),
  'd2102': IcfDetail(
    title: 'Eine Einzelaufgabe unabhängig übernehmen',
    description:
        'Die einfache oder komplexe Aufgabe vorzubereiten, anzugehen und sich um die erforderliche Zeit und Räumlichkeit zu kümmern; eine Aufgabe allein ohne Hilfe anderer zu handhaben und zu bearbeiten.',
  ),
  'd2103': IcfDetail(
    title: 'Eine Einzelaufgabe in einer Gruppe bewältigen',
    description:
        'Die einfache oder komplexe Aufgabe vorzubereiten, anzugehen und sich um die erforderliche Zeit und Räumlichkeit zu kümmern; eine Aufgabe mit anderen Personen, die in einigen oder allen Schritten der Aufgabe einbezogen sind, zu handhaben und zu bearbeiten.',
  ),
  'd2108': IcfDetail(
    title: 'Einzelaufgaben übernehmen, anders bezeichnet',
  ),
  'd2109': IcfDetail(
    title: 'Einzelaufgaben übernehmen, nicht näher bezeichnet',
  ),
  'd220': IcfDetail(
    title: 'Mehrfachaufgaben übernehmen',
    description:
        'Einfache oder komplexe und koordinierte Handlungen als Bestandteile einer multiplen, integrierten und komplexen Aufgabe in aufeinander folgenden Schritten oder gleichzeitig zu bearbeiten.',
    inclusions: [
      'Mehrfachaufgaben zu Ende bringen',
      'Mehrfachaufgaben unabhängig oder in einer Gruppe übernehmen',
    ],
    exclusions: [
      'Sich Fertigkeiten aneignen (d155)',
      'Probleme lösen (d175)',
      'Entscheidungen treffen (d177)',
      'Eine Einzelaufgabe übernehmen (d210)',
    ],
  ),
  'd2200': IcfDetail(
    title: 'Mehrfachaufgaben bearbeiten',
    description:
        'Mehrere Aufgaben vorzubereiten, anzugehen und sich um die erforderliche Zeit und Räumlichkeit zu kümmern; mehrere Aufgaben in aufeinander folgenden Schritten oder gleichzeitig zu handhaben und zu bearbeiten.',
  ),
  'd2201': IcfDetail(
    title: 'Mehrfachaufgaben abschliessen',
    description:
        'Mehrere Aufgaben in aufeinander folgenden Schritten oder gleichzeitig abzuschliessen.',
  ),
  'd2202': IcfDetail(
    title: 'Mehrfachaufgaben unabhängig übernehmen',
    description:
        'Mehrere Aufgaben vorzubereiten, anzugehen und sich um die erforderliche Zeit und Räumlichkeit zu kümmern; mehrere Aufgaben in aufeinander folgenden Schritten oder gleichzeitig allein ohne die Hilfe anderer zu handhaben und zu bearbeiten.',
  ),
  'd2203': IcfDetail(
    title: 'Mehrfachaufgaben in einer Gruppe übernehmen',
    description:
        'Mehrfachaufgaben vorzubereiten, anzugehen und sich um die erforderliche Zeit und Räumlichkeit zu kümmern; mehrere Aufgaben mit anderen Personen, die in einigen oder allen Schritten der Mehrfachaufgaben einbezogen sind, in aufeinander folgenden Schritten oder gleichzeitig zu handhaben und zu bearbeiten.',
  ),
  'd2208': IcfDetail(
    title: 'Mehrfachaufgaben übernehmen, anders bezeichnet',
  ),
  'd2209': IcfDetail(
    title: 'Mehrfachaufgaben übernehmen, nicht näher bezeichnet',
  ),
  'd230': IcfDetail(
    title: 'Die tägliche Routine durchführen',
    description:
        'Einfache und komplexe und koordinierte Handlungen auszuführen, um die Anforderungen der alltäglichen Prozeduren oder Pflichten zu planen, zu handhaben und zu bewältigen, wie Zeit einplanen und den Tagesplan für die verschiedenen Aktivitäten aufstellen.',
    inclusions: [
      'Die tägliche Routine handhaben und zu Ende bringen',
      'Das eigene Aktivitätsniveau handhaben',
    ],
    exclusions: [
      'Mehrfachaufgaben übernehmen (d220)',
    ],
  ),
  'd2301': IcfDetail(
    title: 'Die tägliche Routine planen',
    description:
        'Einfache und komplexe, koordinierte Handlungen auszuführen, um die Anforderungen der alltäglichen Prozeduren oder Pflichten zu planen und zu handhaben.',
  ),
  'd2302': IcfDetail(
    title: 'Die tägliche Routine abschliessen',
    description:
        'Einfache und komplexe, koordinierte Handlungen, die eine Person durchführen muss, um die Anforderungen der alltäglichen Prozeduren oder Pflichten zu einem Abschluss zu bringen.',
  ),
  'd2303': IcfDetail(
    title: 'Das eigene Aktivitätsniveau handhaben',
    description:
        'Handlungen und Verhaltensweisen, die eine Person durchführen bzw. zeigen muss, um den Zeit- und Energiebedarf für die Anforderungen der alltäglichen Prozeduren oder Pflichten einzuplanen.',
  ),
  'd2308': IcfDetail(
    title: 'Die tägliche Routine durchführen, anders bezeichnet',
  ),
  'd2309': IcfDetail(
    title: 'Die tägliche Routine durchführen, nicht näher bezeichnet',
  ),
  'd240': IcfDetail(
    title: 'Mit Stress und anderen psychischen Anforderungen umgehen',
    description:
        'Einfache oder komplexe und koordinierte Handlungen durchzuführen, um die psychischen Anforderungen, die erforderlich sind, um Aufgaben, die besondere Verantwortung beinhalten sowie mit Stress, Störungen und Krisensituationen verbunden sind, zu handhaben und zu kontrollieren, wie ein Fahrzeug bei dichtem Verkehr fahren oder viele Kinder betreün.',
    inclusions: [
      'Mit Verantwortung umgehen',
      'Mit Stress und Krisensituationen umgehen',
    ],
  ),
  'd2400': IcfDetail(
    title: 'Mit Verantwortung umgehen',
    description:
        'Einfache oder komplexe, koordinierte Handlungen durchzuführen, um die Pflichten der Aufgabenerfüllung zu handhaben und die Anforderungen dieser Pflichten zu beurteilen.',
  ),
  'd2401': IcfDetail(
    title: 'Mit Stress umgehen',
    description:
        'Einfache oder komplexe, koordinierte Handlungen durchzuführen, um mit Druck, Notfallsituationen oder Stress im Zusammenhang mit der Aufgabenerfüllung umzugehen.',
  ),
  'd2402': IcfDetail(
    title: 'Mit Krisensituationen umgehen',
    description:
        'Einfache oder komplexe, koordinierte Handlungen durchzuführen, um entscheidende Wendepunkte in einer bestimmten Situation oder in Zeiten akuter Gefahr oder Schwierigkeit zu bewältigen.',
  ),
  'd2408': IcfDetail(
    title:
        'Mit Stress und anderen psychischen Anforderungen umgehen, anders bezeichnet',
  ),
  'd2409': IcfDetail(
    title:
        'Mit Stress und anderen psychischen Anforderungen umgehen, nicht näher bezeichnet',
  ),
  'd298': IcfDetail(
    title: 'Allgemeine Aufgaben und Anforderungen, anders bezeichnet',
  ),
  'd299': IcfDetail(
    title: 'Allgemeine Aufgaben und Anforderungen, nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 3: Kommunikation
  // =========================================================================

  // --- Kommunizieren als Empfaenger (d310-d329) ---

  'd310': IcfDetail(
    title: 'Kommunizieren als Empfänger gesprochener Mitteilungen',
    description:
        'Die wörtliche und übertragene Bedeutung von gesprochenen Mitteilungen zu erfassen, wie verstehen, ob eine Aussage eine Tatsache behauptet oder ob sie eine idiomatische Wendung ist.',
  ),
  'd315': IcfDetail(
    title: 'Kommunizieren als Empfänger non-verbaler Mitteilungen',
    description:
        'Die wörtliche und übertragene Bedeutung von durch Gesten, Symbole und Zeichnungen vermittelten Mitteilungen zu erfassen, wie erkennen, dass ein Kind müde ist, wenn es seine Augen reibt, oder dass das Läuten einer Warnglocke Feür bedeutet.',
    inclusions: [
      'Kommunizieren als Empfänger von Körpergesten, allgemeinen Zeichen und Symbolen, Zeichnungen und Fotos',
    ],
  ),
  'd3150': IcfDetail(
    title: 'Kommunizieren als Empfänger von Gesten oder Gebärden',
    description:
        'Die Bedeutung von Gesichtsausdruck, Handbewegungen oder -zeichen, Körperhaltung und anderen Formen der Körpersprache zu erfassen.',
  ),
  'd3151': IcfDetail(
    title: 'Kommunizieren als Empfänger von allgemeinen Zeichen und Symbolen',
    description:
        'Die Bedeutung von öffentlichen Zeichen und Symbolen zu erfassen wie Verkehrszeichen, Warnsymbole, Notationen (z. B. musikalische, mathematische und wissenschaftliche) sowie Bildsymbole.',
  ),
  'd3152': IcfDetail(
    title: 'Kommunizieren als Empfänger von Zeichnungen und Fotos',
    description:
        'Die in Zeichnungen und Fotos (z. B. Strichzeichnungen, grafische Entwürfe, Gemälde, dreidimensionale Darstellungen) sowie in grafischen Darstellungen, Diagrammen und Fotos vermittelte Bedeutung zu erfassen.',
  ),
  'd3158': IcfDetail(
    title:
        'Kommunizieren als Empfänger non-verbaler Mitteilungen, anders bezeichnet',
  ),
  'd3159': IcfDetail(
    title:
        'Kommunizieren als Empfänger non-verbaler Mitteilungen, nicht näher bezeichnet',
  ),
  'd320': IcfDetail(
    title: 'Kommunizieren als Empfänger von Mitteilungen in Gebärdensprache',
    description:
        'Die wörtliche und übertragene Bedeutung von Mitteilungen in Gebärdensprache zu empfangen und zu erfassen.',
  ),
  'd325': IcfDetail(
    title: 'Kommunizieren als Empfänger schriftlicher Mitteilungen',
    description:
        'Die wörtliche und übertragene Bedeutung schriftlicher Mitteilungen (einschliesslich Braille) zu erfassen.',
  ),
  'd329': IcfDetail(
    title:
        'Kommunizieren als Empfänger, anders oder nicht näher bezeichnet',
  ),

  // --- Kommunizieren als Sender (d330-d349) ---

  'd330': IcfDetail(
    title: 'Sprechen',
    description:
        'Wörter, Wendungen oder längere Passagen in mündlichen Mitteilungen mit wörtlicher und übertragener Bedeutung zu äussern.',
  ),
  'd335': IcfDetail(
    title: 'Non-verbale Mitteilungen produzieren',
    description:
        'Gesten, Symbole und Zeichnungen zur Vermittlung von Bedeutungen einzusetzen, wie seinen Kopf schütteln.',
    inclusions: [
      'Körpergesten, Zeichen, Symbole, Zeichnungen und Fotos produzieren',
    ],
  ),
  'd3350': IcfDetail(
    title: 'Körpersprache einsetzen',
    description:
        'Eine Bedeutung mit Körperbewegungen vermitteln, wie mit Gesichtsausdruck oder Bewegungen.',
  ),
  'd3351': IcfDetail(
    title: 'Zeichen und Symbole produzieren',
    description:
        'Bedeutung durch Verwendung von Zeichen und Symbolen zu vermitteln.',
  ),
  'd3352': IcfDetail(
    title: 'Zeichnungen und Fotos machen',
    description:
        'Bedeutung durch Zeichnen, Malen, Skizzieren zu vermitteln.',
  ),
  'd3358': IcfDetail(
    title: 'Non-verbale Mitteilungen produzieren, anders bezeichnet',
  ),
  'd3359': IcfDetail(
    title: 'Non-verbale Mitteilungen produzieren, nicht näher bezeichnet',
  ),
  'd340': IcfDetail(
    title: 'Mitteilungen in Gebärdensprache ausdrücken',
    description:
        'Mitteilungen mit wörtlicher und übertragener Bedeutung in Gebärdensprache zu vermitteln.',
  ),
  'd345': IcfDetail(
    title: 'Mitteilungen schreiben',
    description:
        'Die wörtliche und übertragene Bedeutung von Mitteilungen in geschriebener Sprache zu verfassen.',
  ),
  'd349': IcfDetail(
    title: 'Kommunizieren als Sender, anders oder nicht näher bezeichnet',
  ),

  // --- Konversation und Gebrauch von Kommunikationsgeraeten (d350-d369) ---

  'd350': IcfDetail(
    title: 'Konversation',
    description:
        'Einen Gedanken- und Ideenaustausch in mündlicher oder schriftlicher Form, in Gebärdensprache oder auf anderer sprachlicher Weise zu beginnen, aufrecht zu erhalten und zu beenden.',
    inclusions: [
      'Eine Konversation beginnen, aufrecht erhalten und beenden',
      'Sich mit einer oder vielen Personen unterhalten',
    ],
  ),
  'd3500': IcfDetail(
    title: 'Eine Unterhaltung beginnen',
    description:
        'Einen Dialog oder einen Gedankenaustausch zu eröffnen, wie sich selbst vorzustellen, die üblichen Grussformeln auszudrücken und in ein Thema einzuführen oder eine Frage zu stellen.',
  ),
  'd3501': IcfDetail(
    title: 'Eine Unterhaltung aufrecht erhalten',
    description:
        'Einen Dialog oder Gedankenaustausch durch zusätzliche Gedanken, Einführung eines neün Themas oder Wiederaufnahme eines vorangegangenen Themas sowie durch abwechselndes Sprechen oder Geben von Zeichen fortzusetzen.',
  ),
  'd3502': IcfDetail(
    title: 'Eine Unterhaltung beenden',
    description:
        'Einen Dialog oder einen Gedankenaustausch mit den üblichen abschliessenden Äusserungen oder Bemerkungen und durch Abschluss des gegenwärtigen Themas zu beenden.',
  ),
  'd3503': IcfDetail(
    title: 'Sich mit einer Person unterhalten',
    description:
        'Mit einer Person einen Dialog oder einen Gedankenaustausch zu initiieren, aufrecht zu erhalten, zu gestalten und zu beenden.',
  ),
  'd3504': IcfDetail(
    title: 'Eine Unterhaltung mit mehreren Personen führen',
    description:
        'Mit mehr als einer Person einen Dialog oder einen Gedankenaustausch zu initiieren, aufrecht zu erhalten, zu gestalten und zu beenden.',
  ),
  'd3508': IcfDetail(
    title: 'Konversation, anders bezeichnet',
  ),
  'd3509': IcfDetail(
    title: 'Konversation, nicht näher bezeichnet',
  ),
  'd355': IcfDetail(
    title: 'Diskussion',
    description:
        'Eine Erörterung eines Sachverhaltes mit Pro- und Kontra-Argumenten oder eine Debatte in mündlicher oder schriftlicher Form, in Gebärdensprache oder auf andere sprachliche Weise zu beginnen, aufrecht zu erhalten und zu beenden.',
    inclusions: [
      'Diskussion mit einer oder vielen Personen',
    ],
  ),
  'd3550': IcfDetail(
    title: 'Diskussion mit einer Person',
    description:
        'Mit einer Person eine Auseinandersetzung oder Debatte zu initiieren, aufrecht zu erhalten, zu gestalten und zu beenden.',
  ),
  'd3551': IcfDetail(
    title: 'Diskussion mit vielen Menschen',
    description:
        'Mit mehr als einer Person eine Auseinandersetzung oder Debatte zu initiieren, aufrecht zu erhalten, zu gestalten und zu beenden.',
  ),
  'd3558': IcfDetail(
    title: 'Diskussion, anders bezeichnet',
  ),
  'd3559': IcfDetail(
    title: 'Diskussion, nicht näher bezeichnet',
  ),
  'd360': IcfDetail(
    title: 'Kommunikationsgeräte und -techniken benutzen',
    description:
        'Kommunikationsgeräte, -techniken und andere Kommunikationsmittel verwenden, wie einen Freund per Telefon anrufen.',
    inclusions: [
      'Telekommunikationsgeräte, Schreibmaschinen und Kommunikationstechniken verwenden',
    ],
  ),
  'd3600': IcfDetail(
    title: 'Telekommunikationsgeräte benutzen',
    description:
        'Ein Telefon und andere Geräte wie Fax- oder Telex-Geräte als Kommunikationsmittel zu verwenden.',
  ),
  'd3601': IcfDetail(
    title: 'Technische Schreibgeräte benutzen',
    description:
        'Maschinen zum Schreiben wie Schreibmaschinen, Computer und Brailleschreiber als Kommunikationsmittel verwenden.',
  ),
  'd3602': IcfDetail(
    title: 'Kommunikationsmethoden benutzen',
    description:
        'Handlungen und Aufgaben, die bei Techniken der Kommunikation wie Lippenlesen beteiligt sind, verwenden.',
  ),
  'd3608': IcfDetail(
    title:
        'Kommunikationsgeräte und -techniken benutzen, anders bezeichnet',
  ),
  'd3609': IcfDetail(
    title:
        'Kommunikationsgeräte und -techniken benutzen, nicht näher bezeichnet',
  ),
  'd369': IcfDetail(
    title:
        'Konversation und Gebrauch von Kommunikationsgeräten und -techniken, anders oder nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 4: Mobilitaet
  // =========================================================================

  // --- Die Koerperposition aendern und aufrecht erhalten (d410-d429) ---

  'd410': IcfDetail(
    title: 'Eine elementare Körperposition wechseln',
    description:
        'In eine und aus einer Körperposition zu gelangen und sich von einem Ort zu einem anderen zu bewegen, wie von einem Stuhl aufstehen, um sich in ein Bett zu legen, in eine und aus einer knienden oder hockenden Position gelangen.',
    inclusions: [
      'Seine Körperposition aus einer liegenden, knienden oder hockenden, sitzenden oder stehenden Position ändern, sich beugen und seinen Körperschwerpunkt verlagern',
    ],
    exclusions: [
      'Sich verlagern (d420)',
    ],
  ),
  'd4100': IcfDetail(
    title: 'Sich hinlegen',
    description:
        'In oder aus einer liegenden Position zu gelangen oder die Körperposition von einer waagerechten in jede andere Position zu wechseln, wie aufstehen oder sich hinsetzen.',
    inclusions: [
      'In eine ausgestreckte Position gelangen',
    ],
  ),
  'd4101': IcfDetail(
    title: 'Hocken',
    description:
        'In eine oder aus einer mit angezogenen Knien auf dem Hinterteil oder den Fersen sitzenden oder kaürnden Stellung zu gelangen, wie es bei ebenerdigen Toiletten notwendig sein kann, oder die Körperposition aus einer hockenden in jede andere Position zu wechseln, wie aufstehen.',
  ),
  'd4102': IcfDetail(
    title: 'Knien',
    description:
        'In oder aus einer Position zu gelangen, bei der der Körper durch die Knie bei gebeugten Beinen unterstützt wird, wie während des Betens, oder die Körperposition von einer knienden in jede andere Position zu wechseln, wie aufstehen.',
  ),
  'd4103': IcfDetail(
    title: 'Sitzen',
    description:
        'In oder aus einer sitzenden Position zu gelangen oder die Körperposition von einer sitzenden in jede andere Position zu wechseln, wie aufstehen oder sich hinlegen.',
    inclusions: [
      'In eine sitzende Position mit gebeugten oder übergeschlagenen Beinen gelangen',
      'In eine sitzende Position mit oder ohne Unterstützung der Füsse gelangen',
    ],
  ),
  'd4104': IcfDetail(
    title: 'Stehen',
    description:
        'In oder aus einer stehenden Position zu gelangen oder die Körperposition von einer stehenden in jede andere Position zu wechseln, wie sich hinlegen oder hinsetzen.',
  ),
  'd4105': IcfDetail(
    title: 'Sich beugen',
    description:
        'Den Rücken nach unten oder zur Seite zu beugen, wie beim Verbeugen oder beim Langen nach einem Gegenstand.',
  ),
  'd4106': IcfDetail(
    title: 'Seinen Körperschwerpunkt verlagern',
    description:
        'Während des Sitzens, Stehens oder Liegens sein Körpergewicht von einer Position zu einer anderen zu verlagern oder zu bewegen, wie während des Stehens sein Standbein wechseln.',
    exclusions: [
      'Sich verlagern (d420)',
      'Gehen (d450)',
    ],
  ),
  'd4108': IcfDetail(
    title: 'Eine elementare Körperposition wechseln, anders bezeichnet',
  ),
  'd4109': IcfDetail(
    title: 'Eine elementare Körperposition wechseln, nicht näher bezeichnet',
  ),
  'd415': IcfDetail(
    title: 'In einer Körperposition verbleiben',
    description:
        'In derselben erforderlichen Körperposition zu verbleiben, wie sitzen bleiben oder bei der Arbeit bzw. in der Schule stehen bleiben.',
    inclusions: [
      'In liegender, hockender, kniender, sitzender oder stehender Position verbleiben',
    ],
  ),
  'd4150': IcfDetail(
    title: 'In liegender Position verbleiben',
    description:
        'Für eine erforderliche Zeit in einer liegenden Position zu verbleiben, wie im Bett auf dem Bauch liegen.',
    inclusions: [
      'In Bauchlage (Gesicht unten), in Rückenlage (Gesicht oben) oder in Seitenlage verbleiben',
    ],
  ),
  'd4151': IcfDetail(
    title: 'In hockender Position verbleiben',
    description:
        'Für eine erforderliche Zeit in einer hockenden Position zu verbleiben, wie ohne Sitzgelegenheit auf dem Boden sitzen.',
  ),
  'd4152': IcfDetail(
    title: 'In kniender Position verbleiben',
    description:
        'Für eine erforderliche Zeit in einer knienden Position zu verbleiben, wobei der Körper durch die Knie bei gebeugten Beinen unterstützt wird, wie während des Betens in einer Kirche.',
  ),
  'd4153': IcfDetail(
    title: 'In sitzender Position verbleiben',
    description:
        'Für eine erforderliche Zeit in einer sitzenden Position auf einer Sitzgelegenheit oder dem Boden zu verbleiben, wie an einem Pult oder Tisch sitzen.',
    inclusions: [
      'Mit ausgestreckten oder übergeschlagenen Beinen mit oder ohne Unterstützung der Füsse in einer sitzenden Position verbleiben',
    ],
  ),
  'd4154': IcfDetail(
    title: 'In stehender Position verbleiben',
    description:
        'Für eine erforderliche Zeit in einer stehenden Position zu verbleiben, wie in einer Schlange stehen.',
    inclusions: [
      'Auf einer geneigten, rutschigen oder harten Oberfläche in stehender Position verbleiben',
    ],
  ),
  'd4158': IcfDetail(
    title: 'In einer Körperposition verbleiben, anders bezeichnet',
  ),
  'd4159': IcfDetail(
    title: 'In einer Körperposition verbleiben, nicht näher bezeichnet',
  ),
  'd420': IcfDetail(
    title: 'Sich verlagern',
    description:
        'Sich von einer Oberfläche auf eine andere zu bewegen, wie auf einer Bank entlang gleiten oder sich ohne Änderung der Körperposition aus dem Bett auf einen Stuhl bewegen.',
    inclusions: [
      'Sich während des Sitzens oder Liegens verlagern',
    ],
    exclusions: [
      'Eine elementare Körperposition wechseln (d410)',
    ],
  ),
  'd4200': IcfDetail(
    title: 'Sich beim Sitzen verlagern',
    description:
        'Sich aus sitzender Position auf einer Sitzgelegenheit auf eine andere gleichen oder unterschiedlichen Niveaus zu bewegen, wie sich von einem Stuhl in ein Bett bewegen.',
    inclusions: [
      'Sich von einem Stuhl auf eine andere Sitzgelegenheit zu bewegen, wie auf einen Toilettensitz',
      'Sich von einem Rollstuhl auf einen Autositz bewegen',
    ],
    exclusions: [
      'Eine elementare Körperposition wechseln (d410)',
    ],
  ),
  'd4201': IcfDetail(
    title: 'Sich beim Liegen verlagern',
    description:
        'Sich aus liegender Position in eine andere gleichen oder unterschiedlichen Niveaus zu bewegen, wie sich von einem Bett in ein anderes bewegen.',
    exclusions: [
      'Eine elementare Körperposition wechseln (d410)',
    ],
  ),
  'd4208': IcfDetail(
    title: 'Sich verlagern, anders bezeichnet',
  ),
  'd4209': IcfDetail(
    title: 'Sich verlagern, nicht näher bezeichnet',
  ),
  'd429': IcfDetail(
    title:
        'Die Körperposition ändern und aufrecht erhalten, anders oder nicht näher bezeichnet',
  ),

  // --- Gegenstaende tragen, bewegen und handhaben (d430-d449) ---

  'd430': IcfDetail(
    title: 'Gegenstände anheben und tragen',
    description:
        'Einen Gegenstand anzuheben oder etwas von einem Platz zu einem anderen zu tragen, wie eine Tasse anheben oder ein Kind von einem Zimmer in ein anderes tragen.',
    inclusions: [
      'Mit den Händen, Armen, auf den Schultern, dem Kopf, dem Rücken oder der Hüfte anheben und absetzen',
    ],
  ),
  'd4300': IcfDetail(
    title: 'Anheben',
    description:
        'Einen Gegenstand anheben, um ihn von einem niedrigen Niveau auf ein höheres zu bewegen, wie ein Glas auf einem Tisch anheben.',
  ),
  'd4301': IcfDetail(
    title: 'Mit den Händen tragen',
    description:
        'Einen Gegenstand mit den Händen von einem Platz an einen anderen zu tragen oder zu transportieren, wie ein Trinkglas oder einen Koffer tragen.',
  ),
  'd4302': IcfDetail(
    title: 'Mit den Armen tragen',
    description:
        'Einen Gegenstand mit den Händen und Armen von einem Platz an einen anderen zu tragen oder zu transportieren, wie ein Kind tragen.',
  ),
  'd4303': IcfDetail(
    title: 'Auf den Schultern, der Hüfte oder dem Rücken tragen',
    description:
        'Einen Gegenstand auf Schultern, Hüfte oder Rücken oder in deren Kombination von einem Platz an einen anderen zu tragen oder zu transportieren, wie beim Tragen eines grossen Paketes.',
  ),
  'd4304': IcfDetail(
    title: 'Auf dem Kopf tragen',
    description:
        'Einen Gegenstand auf dem Kopf von einem Platz an einen anderen zu tragen oder zu transportieren, wie ein Wassergefäss auf dem Kopf tragen.',
  ),
  'd4305': IcfDetail(
    title: 'Gegenstände absetzen',
    description:
        'Mit Händen, Armen oder anderen Körperteilen einen Gegenstand auf dem Boden an einem Platz absetzen, wie ein Wassergefäss auf dem Boden absetzen.',
  ),
  'd4308': IcfDetail(
    title: 'Gegenstände anheben und tragen, anders bezeichnet',
  ),
  'd4309': IcfDetail(
    title: 'Gegenstände anheben und tragen, nicht näher bezeichnet',
  ),
  'd435': IcfDetail(
    title: 'Gegenstände mit den unteren Extremitäten bewegen',
    description:
        'Koordinierte Handlungen mit dem Ziel auszuführen, einen Gegenstand mit Beinen und Füssen in Bewegung zu versetzen, wie einem Ball einen Tritt versetzen oder die Pedale eines Fahrrades treten.',
    inclusions: [
      'Mit den unteren Extremitäten stossen',
      'Treten',
    ],
  ),
  'd4350': IcfDetail(
    title: 'Mit den unteren Extremitäten schieben',
    description:
        'Mit Beinen und Füssen eine Kraft auf einen Gegenstand auszuüben, damit er sich wegbewegt, wie einen Stuhl mit dem Fuss wegschieben.',
  ),
  'd4351': IcfDetail(
    title: 'Stossen',
    description:
        'Mit Beinen und Füssen einen Gegenstand wegstossen, wie einen Fussball wegstossen.',
  ),
  'd4358': IcfDetail(
    title:
        'Gegenstände mit den unteren Extremitäten bewegen, anders bezeichnet',
  ),
  'd4359': IcfDetail(
    title:
        'Gegenstände mit den unteren Extremitäten bewegen, nicht näher bezeichnet',
  ),
  'd440': IcfDetail(
    title: 'Feinmotorischer Handgebrauch',
    description:
        'Koordinierte Handlungen mit dem Ziel auszuführen, Gegenstände mit der Hand, den Fingern und dem Daumen aufzunehmen, zu handhaben und loszulassen, wie es für das Aufnehmen von Münzen von einem Tisch, für das Drehen einer Wählscheibe oder eines Knaufes erforderlich ist.',
    inclusions: [
      'Aufnehmen',
      'Ergreifen',
      'Handhaben',
      'Loslassen',
    ],
    exclusions: [
      'Gegenstände anheben und tragen (d430)',
    ],
  ),
  'd4400': IcfDetail(
    title: 'Einen Gegenstand aufnehmen',
    description:
        'Einen kleinen Gegenstand mit den Händen und Fingern aufnehmen oder aufheben, wie einen Bleistift aufnehmen.',
  ),
  'd4401': IcfDetail(
    title: 'Einen Gegenstand ergreifen',
    description:
        'Mit beiden Händen etwas ergreifen und halten, wie ein Werkzeug oder einen Türknauf ergreifen.',
  ),
  'd4402': IcfDetail(
    title: 'Einen Gegenstand handhaben',
    description:
        'Mit Fingern und Händen die Kontrolle über etwas auszuüben, es zu dirigieren oder zu führen, wie mit Münzen oder anderen kleinen Gegenständen hantieren.',
  ),
  'd4403': IcfDetail(
    title: 'Einen Gegenstand loslassen',
    description:
        'Mit Fingern und Händen etwas loslassen oder freigeben, so dass es fällt oder die Position ändert, wie ein Kleidungsstück fallen lassen.',
  ),
  'd4408': IcfDetail(
    title: 'Feinmotorischer Handgebrauch, anders bezeichnet',
  ),
  'd4409': IcfDetail(
    title: 'Feinmotorischer Handgebrauch, nicht näher bezeichnet',
  ),
  'd445': IcfDetail(
    title: 'Hand- und Armgebrauch',
    description:
        'Koordinierte Handlungen auszuführen, die erforderlich sind, Gegenstände mit Händen und Armen zu bewegen oder zu handhaben, wie beim Drehen eines Türgriffs oder dem Werfen oder Fangen eines Gegenstands.',
    inclusions: [
      'Gegenstände ziehen oder schieben',
      'Nach etwas langen',
      'Hände oder Arme drehen oder verdrehen',
      'Werfen',
      'Fangen',
    ],
    exclusions: [
      'Feinmotorischer Handgebrauch (d440)',
    ],
  ),
  'd4450': IcfDetail(
    title: 'Ziehen',
    description:
        'Einen Gegenstand mit Fingern, Händen und Armen zu sich hinzubringen oder ihn von einem Platz zu einem anderen zu bewegen, wie eine Tür zuziehen.',
  ),
  'd4451': IcfDetail(
    title: 'Schieben',
    description:
        'Einen Gegenstand mit Fingern, Händen und Armen von sich wegzubringen oder ihn von einem Platz zu einem anderen zu bewegen, wie ein Tier wegschubsen.',
  ),
  'd4452': IcfDetail(
    title: 'Nach etwas langen',
    description:
        'Hände und Arme ausstrecken, um etwas zu berühren und zu greifen, wie über einen Tisch oder Pult nach einem Buch langen.',
  ),
  'd4453': IcfDetail(
    title: 'Hände oder Arme drehen oder verdrehen',
    description:
        'Einen Gegenstand mit Fingern, Händen und Armen in Rotation zu versetzen, zu drehen oder zu wenden, wie es für den Gebrauch von Werkzeugen oder Küchenutensilien erforderlich ist.',
  ),
  'd4454': IcfDetail(
    title: 'Werfen',
    description:
        'Etwas mit Fingern, Händen und Armen aufzunehmen und es mit einiger Kraft durch die Luft zu schleudern, wie einen Ball hochwerfen.',
  ),
  'd4455': IcfDetail(
    title: 'Fangen',
    description:
        'Einen bewegten Gegenstand mit Fingern, Händen und Armen zu ergreifen, um ihn zu stoppen und zu halten, wie einen Ball fangen.',
  ),
  'd4458': IcfDetail(
    title: 'Hand- und Armgebrauch, anders bezeichnet',
  ),
  'd4459': IcfDetail(
    title: 'Hand- und Armgebrauch, nicht näher bezeichnet',
  ),
  'd449': IcfDetail(
    title:
        'Gegenstände tragen, bewegen und handhaben, anders oder nicht näher bezeichnet',
  ),

  // --- Gehen und sich fortbewegen (d450-d469) ---

  'd450': IcfDetail(
    title: 'Gehen',
    description:
        'Sich zu Fuss auf einer Oberfläche Schritt für Schritt so fortzubewegen, dass stets wenigstens ein Fuss den Boden berührt, wie beim Spazieren, Schlendern, Vorwärts-, Rückwärts- oder Seitwärtsgehen.',
    inclusions: [
      'Kurze oder weite Entfernungen gehen',
      'Auf unterschiedlichen Oberflächen gehen',
      'Hindernisse umgehen',
    ],
    exclusions: [
      'Sich verlagern (d420)',
      'Sich auf andere Weise fortbewegen (d455)',
    ],
  ),
  'd4500': IcfDetail(
    title: 'Kurze Entfernungen gehen',
    description:
        'Weniger als einen Kilometer zu gehen, wie in Räumen umher oder auf Korridoren entlang gehen, innerhalb eines Gebäudes oder für kurze Entfernungen ausserhalb.',
  ),
  'd4501': IcfDetail(
    title: 'Lange Entfernungen gehen',
    description:
        'Mehr als einen Kilometer zu gehen, wie durch ein Dorf oder eine Stadt, von einem Dorf zu einem anderen oder über Land gehen.',
  ),
  'd4502': IcfDetail(
    title: 'Auf unterschiedlichen Oberflächen gehen',
    description:
        'Auf ansteigenden oder abfallenden, unebenen oder sich bewegenden Oberflächen zu gehen, wie auf Gras, Kies, Eis oder Schnee gehen, oder auf einem Schiff, in einem Zug oder einem anderen Fahrzeug gehen.',
  ),
  'd4503': IcfDetail(
    title: 'Hindernisse umgehen',
    description:
        'In der Weise zu gehen, dass sich bewegenden oder festen Gegenstände, Menschen, Tieren und Fahrzeugen ausgewichen wird, wie auf einem Markt oder in einem Laden gehen, im Strassenverkehr gehen oder diesen umgehen oder in belebten Gegenden gehen.',
  ),
  'd4508': IcfDetail(
    title: 'Gehen, anders bezeichnet',
  ),
  'd4509': IcfDetail(
    title: 'Gehen, nicht näher bezeichnet',
  ),
  'd455': IcfDetail(
    title: 'Sich auf andere Weise fortbewegen',
    description:
        'Sich auf andere Weise als gehend von einem Ort zu einem anderen fortzubewegen, wie über einen Fels klettern oder eine Strasse entlang rennen, springen, spurten, hüpfen, einen Purzelbaum schlagen oder um Hindernisse rennen.',
    inclusions: [
      'Krabbeln/robben',
      'Klettern/steigen',
      'Rennen',
      'Joggen',
      'Springen',
      'Schwimmen',
    ],
    exclusions: [
      'Sich verlagern (d420)',
      'Gehen (d450)',
    ],
  ),
  'd4550': IcfDetail(
    title: 'Krabbeln/robben',
    description:
        'Auf Händen oder Händen und Armen und Knien den ganzen Körper in Bauchlage von einem Platz zu einem anderen zu bewegen.',
  ),
  'd4551': IcfDetail(
    title: 'Klettern/steigen',
    description:
        'Den ganzen Körper über Oberflächen oder Objekte auf- oder abwärts zu bewegen, wie bei Stufen, Steinen/Felsen, Leitern, Treppen, Kantsteinen oder anderen Objekten.',
  ),
  'd4552': IcfDetail(
    title: 'Rennen',
    description:
        'Sich mit schnellen Schritten in der Weise zu bewegen, dass beide Füsse gleichzeitig vom Boden abgehoben sind.',
  ),
  'd4553': IcfDetail(
    title: 'Springen',
    description:
        'Durch Beugen und Strecken der Beine den Boden verlassen, wie auf einem Bein springen, hopsen, hüpfen und ins Wasser springen.',
  ),
  'd4554': IcfDetail(
    title: 'Schwimmen',
    description:
        'Mit Bewegungen der Gliedmassen und des Körpers den ganzen Körper durch das Wasser fortzubewegen, ohne Zuhilfenahme des Gewässergrundes.',
  ),
  'd4558': IcfDetail(
    title: 'Sich auf andere Weise fortbewegen, anders bezeichnet',
  ),
  'd4559': IcfDetail(
    title: 'Sich auf andere Weise fortbewegen, nicht näher bezeichnet',
  ),
  'd460': IcfDetail(
    title: 'Sich in verschiedenen Umgebungen fortbewegen',
    description:
        'In verschiedenen Orten und Situationen zu gehen und sich fortzubewegen, wie in einem Haus oder Gebäude von einem Raum in einen anderen gehen oder auf einer Strasse einer Stadt gehen.',
    inclusions: [
      'Sich in seiner Wohnung umherbewegen',
      'In der Wohnung krabbeln oder Treppen steigen',
      'In anderen Gebäuden als zu Hause bzw. ausserhalb seiner Wohnung oder anderen Gebäuden gehen oder sich fortbewegen',
    ],
  ),
  'd4600': IcfDetail(
    title: 'Sich in seiner Wohnung umherbewegen',
    description:
        'In seiner Wohnung umherzugehen und sich umherzubewegen, innerhalb eines Raumes und zwischen Räumen sowie innerhalb der ganzen Wohnung oder des Lebensbereichs.',
    inclusions: [
      'Sich von Stockwerk zu Stockwerk bewegen',
      'Auf einem Balkon bewegen',
      'Auf dem Hof bewegen',
      'Auf der Veranda bewegen',
      'Im Garten bewegen',
    ],
  ),
  'd4601': IcfDetail(
    title:
        'Sich in anderen Gebäuden ausserhalb der eigenen Wohnung umherbewegen',
    description:
        'Innerhalb von Gebäuden ausserhalb der eigenen Wohnung umherzugehen und sich umherzubewegen, wie sich in anderen Wohnungen, privaten, gemeindeeigenen oder öffentlichen Gebäuden und eingefriedeten Bereichen umherbewegen.',
    inclusions: [
      'Sich in allen Teilen von privaten oder öffentlichen Gebäuden und eingefriedeten Bereichen bewegen',
      'Zwischen den Stockwerken bewegen',
      'Innerhalb, ausserhalb und um Gebäude herum bewegen',
    ],
  ),
  'd4602': IcfDetail(
    title:
        'Sich ausserhalb der eigenen Wohnung und anderen Gebäuden umherbewegen',
    description:
        'In der Nähe oder von der eigenen Wohnung oder anderen Gebäuden entfernt umherzugehen und sich fortzubewegen, ohne öffentliche oder private Transport- oder Verkehrsmittel zu benutzen, wie für kurze oder lange Entfernungen in einer Stadt oder einem Dorf herumzugehen.',
    inclusions: [
      'Auf Strassen in der Nachbarschaft, der Stadt, des Dorfes oder der Grossstadt entlang gehen oder sich auf ihnen fortbewegen',
      'Sich ohne Transport- oder Verkehrsmittel zwischen Grossstädten und für längere Entfernungen bewegen',
    ],
  ),
  'd4608': IcfDetail(
    title:
        'Sich in verschiedenen Umgebungen fortbewegen, anders bezeichnet',
  ),
  'd4609': IcfDetail(
    title:
        'Sich in verschiedenen Umgebungen fortbewegen, nicht näher bezeichnet',
  ),
  'd465': IcfDetail(
    title: 'Sich unter Verwendung von Geräten/Ausrüstung fortbewegen',
    description:
        'Seinen ganzen Körper unter Verwendung von speziellen Geräten, die zur Erleichterung der Mobilität entworfen sind, oder anderen Hilfsvorrichtungen der Fortbewegung auf beliebigen Oberflächen oder in beliebigen Umgebungen von einem Ort zu einem anderen fortzubewegen, wie mit Schlittschuhen, mit Skiern oder mit einer Ausrüstung zum Gerätetauchen, oder sich auf einer Strasse mit einem Rollstuhl oder Gehwagen fortbewegen.',
    exclusions: [
      'Sich verlagern (d420)',
      'Gehen (d450)',
      'Sich auf andere Weise fortbewegen (d455)',
      'Transportmittel benutzen (d470)',
      'Ein Fahrzeug fahren (d475)',
    ],
  ),
  'd469': IcfDetail(
    title:
        'Gehen und sich fortbewegen, anders oder nicht näher bezeichnet',
  ),

  // --- Sich mit Transportmitteln fortbewegen (d470-d489) ---

  'd470': IcfDetail(
    title: 'Transportmittel benutzen',
    description:
        'Transportmittel zu benutzen, um sich als Fahrgast fortzubewegen, wie als Mitfahrer mit einem Auto oder Autobus, einer Rikscha, einem Ruderboot, einem von einem Tier angetriebenen Fahrzeug, mit einem privaten oder öffentlichen Taxi, Autobus, Zug, Strassenbahn, U-Bahn, Schiff oder Flugzeug.',
    inclusions: [
      'Ein von Menschenkraft betriebenes Fahrzeug benutzen',
      'Private motorisierte oder öffentliche Transportmittel benutzen',
    ],
    exclusions: [
      'Sich unter Verwendung von Geräten/Ausrüstung fortbewegen (d465)',
      'Ein Fahrzeug fahren (d475)',
    ],
  ),
  'd4700': IcfDetail(
    title: 'Ein von Menschenkraft betriebenes Fahrzeug benutzen',
    description:
        'Als Fahrgast mit einem von Menschenkraft betriebenen Fahrzeug befördert zu werden, wie mit einer Rikscha oder einem Ruderboot.',
  ),
  'd4701': IcfDetail(
    title: 'Ein privates, motorisiertes Fahrzeug benutzen',
    description:
        'Als Fahrgast mit einem privaten, motorisierten Land-, Wasser- oder Luftfahrzeug befördert zu werden, wie mit einem Taxi oder einem privaten Flugzeug oder Boot.',
  ),
  'd4702': IcfDetail(
    title: 'Ein öffentliches, motorisiertes Verkehrsmittel benutzen',
    description:
        'Als Fahrgast mit einem öffentlichen, motorisierten Land-, Wasser- oder Luftverkehrsmittel befördert zu werden, wie als Fahrgast mit einem Bus, Zug, U-Bahn oder Flugzeug.',
  ),
  'd4708': IcfDetail(
    title: 'Transportmittel benutzen, anders bezeichnet',
  ),
  'd4709': IcfDetail(
    title: 'Transportmittel benutzen, nicht näher bezeichnet',
  ),
  'd475': IcfDetail(
    title: 'Ein Fahrzeug fahren',
    description:
        'Ein Fahrzeug oder das Tier, das es zieht, zu kontrollieren und zu bewegen, unter eigener Leitung zu reisen oder über ein beliebiges Fahrzeug zu verfügen wie ein Auto, Fahrrad, Boot oder ein von einem Tier angetriebenes Fahrzeug.',
    inclusions: [
      'Ein mit Menschenkraft betriebenes Transportmittel fahren',
      'Motorisierte und von einem Tier angetriebene Fahrzeuge fahren',
    ],
    exclusions: [
      'Sich unter Verwendung von Geräten/Ausrüstung fortbewegen (d465)',
      'Transportmittel benutzen (d470)',
    ],
  ),
  'd4750': IcfDetail(
    title: 'Ein von Menschenkraft betriebenes Fahrzeug fahren',
    description:
        'Ein von Menschenkraft betriebenes Fahrzeug zu fahren, wie ein Fahrrad, Dreirad oder Ruderboot.',
  ),
  'd4751': IcfDetail(
    title: 'Ein motorisiertes Fahrzeug fahren',
    description:
        'Ein Fahrzeug mit einem Motor zu fahren, wie ein Auto, Motorrad, Motorboot oder Flugzeug.',
  ),
  'd4752': IcfDetail(
    title: 'Ein von einem Tier angetriebenes Fahrzeug fahren',
    description:
        'Ein von einem Tier angetriebenes Fahrzeug zu fahren, wie einen Pferdewagen oder eine Pferdekutsche.',
  ),
  'd4758': IcfDetail(
    title: 'Ein Fahrzeug fahren, anders bezeichnet',
  ),
  'd4759': IcfDetail(
    title: 'Ein Fahrzeug fahren, nicht näher bezeichnet',
  ),
  'd480': IcfDetail(
    title: 'Tiere zu Transportzwecken reiten',
    description:
        'Sich auf dem Rücken eines Tieres fortzubewegen, wie auf einem Pferd, Ochsen, Kamel oder Elefanten.',
    exclusions: [
      'Ein Fahrzeug fahren (d475)',
      'Erholung und Freizeit (d920)',
    ],
  ),
  'd489': IcfDetail(
    title:
        'Sich mit Transportmitteln fortbewegen, anders oder nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 5: Selbstversorgung
  // =========================================================================

  'd510': IcfDetail(
    title: 'Sich waschen',
    description:
        'Den ganzen Körper oder Körperteile mit Wasser und geeigneten Reinigungs- und Abtrocknungsmaterialien oder -methoden zu waschen und abzutrocknen.',
    inclusions: [
      'Körperteile und ganzen Körper waschen',
      'Sich abtrocknen',
    ],
    exclusions: [
      'Seine Körperteile pflegen (d520)',
      'Die Toilette benutzen (d530)',
    ],
  ),
  'd5100': IcfDetail(
    title: 'Körperteile waschen',
    description:
        'Wasser, Seife und Substanzen zur Reinigung einzelner Körperteile wie Hände, Gesicht, Füsse, Haare, Nägel verwenden.',
  ),
  'd5101': IcfDetail(
    title: 'Den ganzen Körper waschen',
    description:
        'Wasser, Seife und Substanzen zur Reinigung des gesamten Körpers verwenden, wie baden oder duschen.',
  ),
  'd5102': IcfDetail(
    title: 'Sich abtrocknen',
    description:
        'Handtuch oder entsprechendes zum Abtrocknen nach dem Waschen verwenden.',
  ),
  'd5108': IcfDetail(
    title: 'Sich waschen, anders bezeichnet',
  ),
  'd5109': IcfDetail(
    title: 'Sich waschen, nicht näher bezeichnet',
  ),
  'd520': IcfDetail(
    title: 'Seine Körperteile pflegen',
    description:
        'Sich um seine Körperteile wie Haut, Gesicht, Zähne, Kopfhaut, Nägel und Genitalien über das Waschen und Abtrocknen hinaus zu kümmern.',
    inclusions: [
      'Haut, Zähne, Haar, Finger, Zehnägel pflegen',
    ],
    exclusions: [
      'Sich waschen (d510)',
      'Die Toilette benutzen (d530)',
    ],
  ),
  'd5200': IcfDetail(
    title: 'Die Haut pflegen',
    description:
        'Sich um die Beschaffenheit und Feuchtigkeitszufuhr seiner Haut zu kümmern, wie Schwielen oder Hühneraugen entfernen.',
  ),
  'd5201': IcfDetail(
    title: 'Die Zähne pflegen',
    description:
        'Sich um Zahnpflege zu kümmern, wie die Zähne putzen, Zahnseide benutzen sowie Zahnprothesen oder -orthesen reinigen.',
  ),
  'd5202': IcfDetail(
    title: 'Das Haar pflegen',
    description:
        'Sich um sein Kopf- und Gesichtshaar zu kümmern, wie kämmen, frisieren, rasieren oder schneiden.',
  ),
  'd5203': IcfDetail(
    title: 'Die Fingernägel pflegen',
    description:
        'Fingernägel reinigen, schneiden oder polieren.',
  ),
  'd5204': IcfDetail(
    title: 'Die Fussnägel pflegen',
    description:
        'Fussnägel reinigen, schneiden oder polieren.',
  ),
  'd5208': IcfDetail(
    title: 'Seine Körperteile pflegen, anders bezeichnet',
  ),
  'd5209': IcfDetail(
    title: 'Seine Körperteile pflegen, nicht näher bezeichnet',
  ),
  'd530': IcfDetail(
    title: 'Die Toilette benutzen',
    description:
        'Die Beseitigung menschlicher Ausscheidungen (Menstruationssekrete, Urin, Stuhl) zu planen und durchzuführen sowie sich anschliessend zu reinigen.',
    inclusions: [
      'Belange der Blasen- und Darmentleerung sowie Menstruation regulieren',
    ],
    exclusions: [
      'Sich waschen (d510)',
      'Seine Körperteile pflegen (d520)',
    ],
  ),
  'd5300': IcfDetail(
    title: 'Die Belange der Blasenentleerung regulieren',
    description:
        'Die Blasenentleerung zu koordinieren und zu handhaben, wie das Bedürfnis angeben, sich in geeignete Position begeben.',
  ),
  'd5301': IcfDetail(
    title: 'Die Belange der Darmentleerung regulieren',
    description:
        'Die Darmentleerung zu koordinieren und zu handhaben, wie das Bedürfnis angeben, sich in geeignete Position begeben.',
  ),
  'd5302': IcfDetail(
    title: 'Die Belange der Menstruation regulieren',
    description:
        'Die Menstruation zu koordinieren, zu planen und sich um sie zu kümmern, wie Menstruationseintritt voraussehen.',
  ),
  'd5308': IcfDetail(
    title: 'Die Toilette benutzen, anders bezeichnet',
  ),
  'd5309': IcfDetail(
    title: 'Die Toilette benutzen, nicht näher bezeichnet',
  ),
  'd540': IcfDetail(
    title: 'Sich kleiden',
    description:
        'Die koordinierten Handlungen und Aufgaben durchzuführen, welche das An- und Ausziehen von Kleidung betreffen.',
    inclusions: [
      'Kleidung und Schuhwerk an- und ausziehen',
      'Geeignete Kleidung auswählen',
    ],
  ),
  'd5400': IcfDetail(
    title: 'Kleidung anziehen',
    description:
        'Koordinierte Handlungen zum Anlegen von Kleidung an verschiedene Körperteile durchführen.',
  ),
  'd5401': IcfDetail(
    title: 'Kleidung ausziehen',
    description:
        'Koordinierte Handlungen zum Ablegen von Kleidung von verschiedenen Körperteilen durchführen.',
  ),
  'd5402': IcfDetail(
    title: 'Schuhwerk anziehen',
    description:
        'Koordinierte Handlungen zum Anziehen von Socken, Strümpfen und Schuhwerk durchführen.',
  ),
  'd5403': IcfDetail(
    title: 'Schuhwerk ausziehen',
    description:
        'Koordinierte Handlungen zum Ausziehen von Socken, Strümpfen und Schuhwerk durchführen.',
  ),
  'd5404': IcfDetail(
    title: 'Geeignete Kleidung auswählen',
    description:
        'Den impliziten oder expliziten Kleiderregeln und -konventionen seiner Gesellschaft oder Kultur zu entsprechen.',
  ),
  'd5408': IcfDetail(
    title: 'Sich kleiden, anders bezeichnet',
  ),
  'd5409': IcfDetail(
    title: 'Sich kleiden, nicht näher bezeichnet',
  ),
  'd550': IcfDetail(
    title: 'Essen',
    description:
        'Die koordinierten Handlungen und Aufgaben durchzuführen, die das Essen servierter Speisen betreffen, sie zum Mund zu führen.',
    exclusions: [
      'Trinken (d560)',
    ],
  ),
  'd560': IcfDetail(
    title: 'Trinken',
    description:
        'Ein Gefäss mit einem Getränk in die Hand zu nehmen, es zum Mund zu führen und den Inhalt in kulturell akzeptierter Weise zu trinken.',
    exclusions: [
      'Essen (d550)',
    ],
  ),
  'd570': IcfDetail(
    title: 'Auf seine Gesundheit achten',
    description:
        'Für physischen Komfort, Gesundheit sowie für physisches und mentales Wohlbefinden zu sorgen.',
    inclusions: [
      'Für physischen Komfort sorgen',
      'Ernährung und Fitness handhaben',
      'Eigene Gesundheit erhalten',
    ],
  ),
  'd5700': IcfDetail(
    title: 'Für seinen physischen Komfort sorgen',
    description:
        'Auf sich selbst zu achten, indem man für beqüme Körperposition, angenehme Körpertemperatur sorgt.',
  ),
  'd5701': IcfDetail(
    title: 'Ernährung und Fitness handhaben',
    description:
        'Auf sich selbst zu achten, indem man gesunde Lebensmittel auswählt und verzehrt, sich körperlich fit hält.',
  ),
  'd5702': IcfDetail(
    title: 'Seine Gesundheit erhalten',
    description:
        'Auf sich selbst zu achten, indem man das tut, was die eigene Gesundheit erfordert, im Hinblick auf Gesundheitsrisiken.',
  ),
  'd5708': IcfDetail(
    title: 'Auf seine Gesundheit achten, anders bezeichnet',
  ),
  'd5709': IcfDetail(
    title: 'Auf seine Gesundheit achten, nicht näher bezeichnet',
  ),
  'd598': IcfDetail(
    title: 'Selbstversorgung, anders bezeichnet',
  ),
  'd599': IcfDetail(
    title: 'Selbstversorgung, nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 6: Haeusliches Leben
  // =========================================================================

  // --- Beschaffung von Lebensnotwendigkeiten (d610-d629) ---

  'd610': IcfDetail(
    title: 'Wohnraum beschaffen',
    description:
        'Ein Haus, ein Appartement oder eine Wohnung zu kaufen, zu mieten, zu möblieren und die Möbel aufzustellen.',
    inclusions: [
      'Wohnraum kaufen oder mieten',
      'Wohnraum möblieren',
    ],
    exclusions: [
      'Waren und Dienstleistungen des täglichen Bedarfs beschaffen (d620)',
      'Haushaltsgegenstände pflegen (d650)',
    ],
  ),
  'd6100': IcfDetail(
    title: 'Wohnraum kaufen',
    description:
        'Das Eigentum eines Hauses, Appartements oder einer Wohnung zu erwerben.',
  ),
  'd6101': IcfDetail(
    title: 'Wohnraum mieten',
    description:
        'Die Benutzung eines Hauses, Appartements oder einer anderen Wohngelegenheit, die jeweils einem anderen gehört, gegen Entgelt zu erlangen.',
  ),
  'd6102': IcfDetail(
    title: 'Wohnraum möblieren',
    description:
        'Wohnraum mit Möbeln, Einbauten und anderen Ausstattungen auszurüsten und einzurichten sowie die Räume zu dekorieren.',
  ),
  'd6108': IcfDetail(
    title: 'Wohnraum beschaffen, anders bezeichnet',
  ),
  'd6109': IcfDetail(
    title: 'Wohnraum beschaffen, nicht näher bezeichnet',
  ),
  'd620': IcfDetail(
    title: 'Waren und Dienstleistungen des täglichen Bedarfs beschaffen',
    description:
        'Alle Waren und Dienstleistungen des täglichen Bedarfs auszuwählen, zu beschaffen und zu transportieren, wie Lebensmittel, Getränke, Kleidung, Reinigungsmaterial, Brennstoff, Haushaltsartikel, Utensilien, Kochgeschirr, häusliche Hilfsmittel und Werkzeuge auswählen, beschaffen, transportieren und lagern; Versorgungs- und andere Dienstleistungen für den Haushalt beschaffen.',
    inclusions: [
      'Die täglichen Notwendigkeiten einkaufen und zusammentragen',
    ],
    exclusions: [
      'Wohnraum beschaffen (d610)',
    ],
  ),
  'd6200': IcfDetail(
    title: 'Einkaufen',
    description:
        'Waren und Dienstleistungen für das tägliche Leben gegen Geld zu erwerben (einschliesslich einen für die Einkäufe Beauftragten anzuweisen und zu beaufsichtigen), wie Lebensmittel, Getränke, Reinigungsmaterial, Haushaltsartikel oder Kleidung in einem Geschäft oder auf dem Markt auswählen; Qualität und Preis der benötigten Artikel vergleichen, den Preis für die ausgewählten Waren und Dienstleistungen aushandeln und bezahlen sowie die Waren transportieren.',
  ),
  'd6201': IcfDetail(
    title: 'Die täglichen Notwendigkeiten unentgeltlich besorgen',
    description:
        'Waren und Dienstleistungen für das tägliche Leben unentgeltlich zu beschaffen (einschliesslich einen für die Beschaffung Beauftragten anzuweisen und zu beaufsichtigen), wie Gemüse und Früchte ernten sowie Wasser und Brennstoff beschaffen.',
  ),
  'd6208': IcfDetail(
    title:
        'Waren und Dienstleistungen des täglichen Bedarfs beschaffen, anders bezeichnet',
  ),
  'd6209': IcfDetail(
    title:
        'Waren und Dienstleistungen des täglichen Bedarfs beschaffen, nicht näher bezeichnet',
  ),
  'd629': IcfDetail(
    title:
        'Beschaffung von Lebensnotwendigkeiten, anders oder nicht näher bezeichnet',
  ),

  // --- Haushaltsaufgaben (d630-d649) ---

  'd630': IcfDetail(
    title: 'Mahlzeiten vorbereiten',
    description:
        'Einfache und komplexe Mahlzeiten für sich selbst und andere zu planen, zu organisieren, zu kochen und anzurichten, wie ein Menü zubereiten, geniessbare Lebensmittel und Getränke auswählen, Zutaten für die Vorbereitung der Mahlzeit zusammenstellen, mit Wärme kochen sowie kalte Speisen und Getränke vorbereiten und die Speisen servieren.',
    inclusions: [
      'Einfache und komplexe Mahlzeiten vorbereiten',
    ],
    exclusions: [
      'Essen (d550)',
      'Trinken (d560)',
      'Waren und Dienstleistungen des täglichen Bedarfs beschaffen (d620)',
      'Hausarbeiten erledigen (d640)',
      'Haushaltsgegenstände pflegen (d650)',
      'Anderen helfen (d660)',
    ],
  ),
  'd6300': IcfDetail(
    title: 'Einfache Mahlzeiten vorbereiten',
    description:
        'Mahlzeiten, die wenig Zutaten erfordern und mit einfachen Mitteln zubereitet und serviert werden können, zu kochen und zu servieren, wie einen Snack oder eine kleine Mahlzeit zubereiten.',
  ),
  'd6301': IcfDetail(
    title: 'Komplexe Mahlzeiten vorbereiten',
    description:
        'Mahlzeiten, die viele Zutaten erfordern und mit komplexen Mitteln zubereitet und serviert werden müssen, zu planen, zu organisieren, zu kochen und zu servieren.',
    exclusions: [
      'Haushaltsgeräte benutzen (d6403)',
    ],
  ),
  'd640': IcfDetail(
    title: 'Hausarbeiten erledigen',
    description:
        'Einen Haushalt zu handhaben durch Reinigen des Hauses, Waschen von Kleidung, Benutzung von Haushaltsgeräten, Lagerung von Lebensmitteln, Entsorgung von Müll.',
    inclusions: [
      'Kleidung und Wäsche waschen und trocknen',
      'Küchenbereich und -utensilien reinigen',
      'Den Wohnraum reinigen',
      'Haushaltsgeräte benutzen',
      'Tägliche Lebensnotwendigkeiten lagern',
      'Müll entsorgen',
    ],
    exclusions: [
      'Wohnraum beschaffen (d610)',
      'Waren und Dienstleistungen des täglichen Bedarfs beschaffen (d620)',
      'Mahlzeiten vorbereiten (d630)',
      'Haushaltsgegenstände pflegen (d650)',
      'Anderen helfen (d660)',
    ],
  ),
  'd6400': IcfDetail(
    title: 'Kleidung und Wäsche waschen und trocknen',
    description:
        'Kleidung und Wäsche mit der Hand zu waschen und sie zum Trocknen an der Luft aufzuhängen.',
  ),
  'd6401': IcfDetail(
    title: 'Küchenbereich und -utensilien reinigen',
    description:
        'Nach dem Kochen zu reinigen, wie Geschirr, Pfannen, Töpfe und Kochutensilien abwaschen sowie Tische und Böden des Koch- und Essbereichs reinigen.',
  ),
  'd6402': IcfDetail(
    title: 'Den Wohnbereich reinigen',
    description:
        'Den Wohnbereich eines Haushalts zu reinigen, wie aufräumen und Staub wischen; Fussböden fegen, wischen, moppen; Fenster und Wände reinigen; Badezimmer und Toiletten reinigen; Möbel reinigen.',
  ),
  'd6403': IcfDetail(
    title: 'Haushaltsgeräte benutzen',
    description:
        'Alle Arten von Haushaltsgeräten zu benutzen, wie Waschmaschinen, Trockner, Bügeleisen, Staubsauger und Spülmaschinen.',
  ),
  'd6404': IcfDetail(
    title: 'Die täglichen Lebensnotwendigkeiten lagern',
    description:
        'Lebensmittel, Getränke, Kleidung und andere für das tägliche Leben notwendigen Waren zu lagern, Lebensmittel für die Konservierung durch Einmachen, Salzen oder Einfrieren vorzubereiten.',
  ),
  'd6405': IcfDetail(
    title: 'Müll entsorgen',
    description:
        'Den Haushaltsmüll zu entsorgen, wie Abfall und Unrat um das Haus herum aufsammeln, Müll mit geeigneten Mitteln zur Entsorgung vorbereiten, Müll verbrennen.',
  ),
  'd649': IcfDetail(
    title: 'Haushaltsaufgaben, anders oder nicht näher bezeichnet',
  ),

  // --- Haushaltsgegenstaende pflegen und anderen helfen (d650-d669) ---

  'd650': IcfDetail(
    title: 'Haushaltsgegenstände pflegen',
    description:
        'Haushalts- und andere persönliche Gegenstände, einschliesslich Haus und dessen Inhalt, Kleidung, Fahrzeuge und Hilfsmittel, instand halten und instand setzen sowie sich um Pflanzen und Tiere kümmern.',
    inclusions: [
      'Kleidung herstellen und reparieren',
      'Wohnung, Möbel und häusliche Geräte instand halten',
      'Fahrzeuge instand halten',
      'Hilfsmittel instand halten',
      'Pflanzen (drinnen und draussen) und Tiere pflegen',
    ],
    exclusions: [
      'Wohnraum beschaffen (d610)',
      'Waren und Dienstleistungen des täglichen Bedarfs beschaffen (d620)',
      'Hausarbeiten erledigen (d640)',
      'Anderen helfen (d660)',
      'Bezahlte Tätigkeit (d850)',
    ],
  ),
  'd6500': IcfDetail(
    title: 'Kleidung herstellen und reparieren',
    description:
        'Kleidung herzustellen und zu reparieren, wie nähen, Kleidung anfertigen oder ausbessern; Knöpfe und Verschlüsse wieder befestigen; Kleidungsstücke bügeln; Schuhwerk in Ordnung bringen und putzen.',
    exclusions: [
      'Haushaltsgeräte benutzen (d6403)',
    ],
  ),
  'd6501': IcfDetail(
    title: 'Wohnung und Möbel instand halten',
    description:
        'Die Wohnung, deren Aussenbereich und Innenbereich samt Inhalt instand zu setzen und zu halten, wie Einrichtungsgegenstände und Möbel streichen und reparieren sowie die erforderlichen Werkzeuge und Materialien für die Reparatur benutzen.',
  ),
  'd6502': IcfDetail(
    title: 'Häusliche Geräte instand halten',
    description:
        'Alle häuslichen Geräte zum Kochen, Reinigen und Reparieren instand zu setzen und zu halten, wie Werkzeuge ölen und reparieren sowie die Waschmaschine warten.',
  ),
  'd6503': IcfDetail(
    title: 'Fahrzeuge instand halten',
    description:
        'Motorisierte und nicht motorisierte Fahrzeuge für die persönliche Benutzung instand zu setzen und zu halten, einschliesslich Fahrräder, Wagen, Autos und Boote.',
  ),
  'd6504': IcfDetail(
    title: 'Hilfsmittel instand halten',
    description:
        'Hilfsmittel instand zu setzen und zu halten, wie Prothesen, Orthesen, Spezialwerkzeuge und Hilfen für die Haushaltsführung und die persönliche Pflege, Hilfen für die persönliche Mobilität wie Gehstützen, Gehwagen, Rollstühle und Roller instand setzen und instand halten; Hilfen zur Kommunikation und Erholung instand halten.',
  ),
  'd6505': IcfDetail(
    title: 'Innen- und Aussenpflanzen pflegen',
    description:
        'Pflanzen innerhalb und ausserhalb des Hauses zu pflegen, wie Pflanzen anpflanzen, giessen und düngen, Gartenarbeit machen sowie Nutzpflanzen für den persönlichen Bedarf anpflanzen.',
  ),
  'd6506': IcfDetail(
    title: 'Sich um Tiere kümmern',
    description:
        'Sich um Nutz- und Haustiere zu kümmern, wie Haustiere füttern, pflegen, reinigen, bürsten sowie für deren Bewegung sorgen; auf die Gesundheit von Nutz- und Haustieren achten; die Pflege von Nutz- und Haustieren für den Fall der eigenen Abwesenheit planen.',
  ),
  'd6508': IcfDetail(
    title: 'Haushaltsgegenstände pflegen, anders bezeichnet',
  ),
  'd6509': IcfDetail(
    title: 'Haushaltsgegenstände pflegen, nicht näher bezeichnet',
  ),
  'd660': IcfDetail(
    title: 'Anderen helfen',
    description:
        'Haushaltsmitgliedern und anderen beim Lernen, Kommunizieren, der Selbstversorgung, der (Fort-)Bewegung innerhalb und ausserhalb des Hauses zu helfen; sich dem Wohlbefinden der Haushaltsmitglieder und anderer widmen.',
    inclusions: [
      'Anderen bei der Selbstversorgung, der (Fort)Bewegung, Kommunikation, den interpersonellen Beziehungen, der Ernährung und der Erhaltung der Gesundheit helfen',
    ],
    exclusions: [
      'Bezahlte Tätigkeit (d850)',
    ],
  ),
  'd6600': IcfDetail(
    title: 'Anderen bei der Selbstversorgung helfen',
    description:
        'Haushaltsmitgliedern und anderen bei der Selbstversorgung helfen, einschliesslich anderen beim Essen, Baden sowie An- und Ausziehen helfen; sich um Kinder oder andere Haushaltsmitglieder kümmern, die krank sind oder Schwierigkeiten bei der elementaren Selbstversorgung haben; anderen bei Belangen der Toilette helfen.',
  ),
  'd6601': IcfDetail(
    title: 'Anderen bei der (Fort)Bewegung helfen',
    description:
        'Haushaltsmitgliedern und anderen bei ihren Bewegungen und beim Verlassen des Hauses zu helfen, wie bei ihrem Unterwegssein in der Nachbarschaft oder der Stadt, in die oder von der Schule, zum Arbeitsplatz oder zu einem anderen Ziel helfen.',
  ),
  'd6602': IcfDetail(
    title: 'Anderen bei der Kommunikation helfen',
    description:
        'Haushaltsmitgliedern und anderen bei ihrer Kommunikation zu helfen, wie beim Sprechen, Schreiben oder Lesen helfen.',
  ),
  'd6603': IcfDetail(
    title: 'Anderen bei interpersonellen Beziehungen helfen',
    description:
        'Haushaltsmitgliedern und anderen bei ihren interpersonellen Interaktionen zu helfen, wie ihnen beim Aufnehmen, Aufrechterhalten und Beenden von Beziehungen helfen.',
  ),
  'd6604': IcfDetail(
    title: 'Anderen bei der Ernährung helfen',
    description:
        'Haushaltsmitgliedern und anderen bei ihrer Ernährung zu helfen, wie ihnen beim Zubereiten von Mahlzeiten und Essen helfen.',
  ),
  'd6605': IcfDetail(
    title: 'Anderen bei der Erhaltung ihrer Gesundheit helfen',
    description:
        'Haushaltsmitgliedern und anderen bei ihrer medizinischen Versorgung durch Professionelle und Laien zu helfen, wie darauf achten, dass ein Kind regelmässige medizinische Check-Ups erhält oder dass ein älterer Verwandter die erforderlichen Medikamente einnimmt.',
  ),
  'd6608': IcfDetail(
    title: 'Anderen helfen, anders bezeichnet',
  ),
  'd6609': IcfDetail(
    title: 'Anderen helfen, nicht näher bezeichnet',
  ),
  'd669': IcfDetail(
    title:
        'Haushaltsgegenstände pflegen und anderen helfen, anders oder nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 7: Interpersonelle Interaktionen und Beziehungen
  // =========================================================================

  // --- Allgemeine interpersonelle Interaktionen (d710-d729) ---

  'd710': IcfDetail(
    title: 'Elementare interpersonelle Aktivitäten',
    description:
        'Mit anderen in einer kontextüll und sozial angemessenen Weise zu interagieren, wie die erforderliche Rücksichtnahme und Wertschätzung zeigen oder auf Gefühle anderer reagieren.',
    inclusions: [
      'Respekt, Wärme, Wertschätzung und Toleranz in Beziehungen zeigen',
      'Auf Kritik und soziale Zeichen in Beziehungen reagieren',
      'Angemessenen körperlichen Kontakt einsetzen',
    ],
  ),
  'd7100': IcfDetail(
    title: 'Respekt und Wärme in Beziehungen',
    description:
        'In einer kontextüll und sozial angemessenen Weise Rücksichtnahme und Wertschätzung zu zeigen und darauf zu reagieren.',
  ),
  'd7101': IcfDetail(
    title: 'Anerkennung in Beziehungen',
    description:
        'In einer kontextüll und sozial angemessenen Weise Zufriedenheit und Dankbarkeit zu zeigen und darauf zu reagieren.',
  ),
  'd7102': IcfDetail(
    title: 'Toleranz in Beziehungen',
    description:
        'In einer kontextüll und sozial angemessenen Weise Verständnis und Akzeptanz für Verhalten zu zeigen und darauf zu reagieren.',
  ),
  'd7103': IcfDetail(
    title: 'Kritik in Beziehungen',
    description:
        'In einer kontextüll und sozial angemessenen Weise implizite und explizite Meinungsverschiedenheiten oder Uneinigkeit auszudrücken und darauf zu reagieren.',
  ),
  'd7104': IcfDetail(
    title: 'Soziale Zeichen in Beziehungen',
    description:
        'Zeichen und Hinweise, die bei sozialen Interaktionen vorkommen, in angemessener Weise zu geben und darauf zu reagieren.',
  ),
  'd7105': IcfDetail(
    title: 'Körperlicher Kontakt in Beziehungen',
    description:
        'In einer kontextüll und sozial angemessenen Weise mit anderen körperlichen Kontakt aufzunehmen und darauf zu reagieren.',
  ),
  'd7108': IcfDetail(
    title: 'Elementare interpersonelle Aktivitäten, anders bezeichnet',
  ),
  'd7109': IcfDetail(
    title: 'Elementare interpersonelle Aktivitäten, nicht näher bezeichnet',
  ),
  'd720': IcfDetail(
    title: 'Komplexe interpersonelle Interaktionen',
    description:
        'Die Interaktionen mit anderen in einer kontextüll und sozial angemessenen Weise aufrechtzürhalten und zu handhaben, wie Gefühle und Impulse steürn, verbale und physische Aggressionen kontrollieren, bei sozialen Interaktionen unabhängig handeln und in Übereinstimmung mit sozialen Regeln und Konventionen handeln.',
    inclusions: [
      'Beziehungen eingehen und beenden',
      'Verhaltensweisen bei Interaktionen regulieren',
      'Sozialen Regeln gemäss interagieren',
      'Sozialen Abstand wahren',
    ],
  ),
  'd7200': IcfDetail(
    title: 'Beziehungen eingehen',
    description:
        'In einer kontextüll und sozial angemessenen Weise mit anderen Interaktionen für kurze oder längere Zeiträume zu beginnen und aufrecht zu erhalten, wie sich vorstellen, Freundschaften schliessen und berufliche Beziehungen herstellen, eine mögliche Daür-, Liebes- oder intime Beziehung beginnen.',
  ),
  'd7201': IcfDetail(
    title: 'Beziehungen beenden',
    description:
        'In einer kontextüll und sozial angemessenen Weise Interaktionen zu beenden, wie zeitlich begrenzte Beziehungen am Ende eines Besuches beenden, längerfristige Beziehungen mit Freunden, die in eine andere Stadt ziehen, beenden oder Beziehungen mit Arbeits-, Berufskollegen oder Dienstleistungserbringern beenden sowie Liebes- oder intime Beziehungen beenden.',
  ),
  'd7202': IcfDetail(
    title: 'Verhalten in Beziehungen regulieren',
    description:
        'In einer kontextüll und sozial angemessenen Weise Gefühle und Impulse, verbale und physische Aggressionen zu regulieren.',
  ),
  'd7203': IcfDetail(
    title: 'Sozialen Regeln gemäss interagieren',
    description:
        'In sozialen Interaktionen unabhängig zu handeln und sich nach den sozialen Konventionen, die die eigene Rolle, Stellung oder einen anderen sozialen Status bei Interaktionen mit anderen bestimmen, zu richten.',
  ),
  'd7204': IcfDetail(
    title: 'Sozialen Abstand wahren',
    description:
        'In einer kontextüll, sozial und kulturell angemessenen Weise sich über den Abstand zwischen sich und anderen bewusst zu sein und diesen zu wahren.',
  ),
  'd7208': IcfDetail(
    title: 'Komplexe interpersonelle Interaktionen, anders bezeichnet',
  ),
  'd7209': IcfDetail(
    title: 'Komplexe interpersonelle Interaktionen, nicht näher bezeichnet',
  ),
  'd729': IcfDetail(
    title:
        'Allgemeine interpersonelle Interaktionen, anders oder nicht näher bezeichnet',
  ),

  // --- Besondere interpersonelle Beziehungen (d730-d779) ---

  'd730': IcfDetail(
    title: 'Mit Fremden umgehen',
    description:
        'In befristeten Kontakten und Verbindungen mit Fremden zu bestimmten Zwecken zu stehen, wie beim Fragen nach einer Richtung oder einen Kauf tätigen.',
  ),
  'd740': IcfDetail(
    title: 'Formelle Beziehungen',
    description:
        'Spezielle Beziehungen in formellen Rahmen aufzunehmen und aufrecht zu erhalten, wie mit Arbeitgebern, Fachleuten oder Dienstleistungserbringer.',
    inclusions: [
      'Mit Autoritätspersonen, Untergebenen oder Gleichrangigen umgehen',
    ],
  ),
  'd7400': IcfDetail(
    title: 'Mit Autoritätspersonen umgehen',
    description:
        'Formelle Beziehungen mit Menschen in Machtpositionen, höheren Ranges oder Prestiges als der eigenen sozialen Position aufzunehmen und aufrecht zu erhalten, wie mit einem Arbeitgeber.',
  ),
  'd7401': IcfDetail(
    title: 'Mit Untergebenen umgehen',
    description:
        'Formelle Beziehungen mit Menschen niedrigeren Ranges oder Prestiges als der eigenen sozialen Position aufzunehmen und aufrecht zu erhalten, wie mit einem Beschäftigten oder Bediensteten.',
  ),
  'd7402': IcfDetail(
    title: 'Mit Gleichrangigen umgehen',
    description:
        'Formelle Beziehungen mit Menschen gleichen Ranges, Prestiges oder gleicher Autorität wie der eigenen sozialen Position aufzunehmen und aufrecht zu erhalten.',
  ),
  'd7408': IcfDetail(
    title: 'Formelle Beziehungen, anders bezeichnet',
  ),
  'd7409': IcfDetail(
    title: 'Formelle Beziehungen, nicht näher bezeichnet',
  ),
  'd750': IcfDetail(
    title: 'Informelle soziale Beziehungen',
    description:
        'Mit anderen Kontakte aufzunehmen, wie bei gelegentlichen Beziehungen mit Leuten, die in derselben Gemeinschaft oder am gleichen Wohnsitz leben, oder mit Mitarbeitern, Schülern und Studenten, Spielkameraden oder mit Menschen ähnlichen Hintergrundes oder Berufs.',
    inclusions: [
      'Informelle Beziehungen zu Freunden, Nachbarn, Bekannten, Mitbewohnern und Seinesgleichen (Peers)',
    ],
  ),
  'd7500': IcfDetail(
    title: 'Informelle Beziehungen zu Freunden',
    description:
        'Freundschaftliche Beziehungen, die durch gegenseitige Wertschätzung und gemeinsame Interessen geprägt sind, aufzunehmen und aufrecht zu erhalten.',
  ),
  'd7501': IcfDetail(
    title: 'Informelle Beziehungen zu Nachbarn',
    description:
        'Informelle Beziehungen zu Menschen in der Nachbarschaft aufzunehmen und aufrecht zu erhalten.',
  ),
  'd7502': IcfDetail(
    title: 'Informelle Beziehungen zu Bekannten',
    description:
        'Informelle Beziehungen zu Menschen, die man kennt, die jedoch nicht zum engeren Freundeskreis zählen, aufzunehmen und aufrecht zu erhalten.',
  ),
  'd7503': IcfDetail(
    title: 'Informelle Beziehungen zu Mitbewohnern',
    description:
        'Informelle Beziehungen für jeden Zweck zu Menschen, die im gleichen privaten oder öffentlich geleiteten Haus oder anderen Wohnung leben, aufzunehmen und aufrecht zu erhalten.',
  ),
  'd7504': IcfDetail(
    title: 'Informelle Beziehungen zu Seinesgleichen (Peers)',
    description:
        'Informelle Beziehungen für jeden Zweck zu Menschen im gleichen Alter, mit gleichen Interessen oder anderen gemeinsamen Merkmalen aufzunehmen und aufrecht zu erhalten.',
  ),
  'd7508': IcfDetail(
    title: 'Informelle soziale Beziehungen, anders bezeichnet',
  ),
  'd7509': IcfDetail(
    title: 'Informelle soziale Beziehungen, nicht näher bezeichnet',
  ),
  'd760': IcfDetail(
    title: 'Familienbeziehungen',
    description:
        'Beziehungen zu Verwandten aufzubaün und aufrecht zu erhalten, wie mit Mitgliedern der Kernfamilie, des erweiterten Familienkreises, der Pflege- und angenommenen Familie sowie der Stieffamilie, mit entfernteren Verwandten wie mit Cousinen/Cousins zweiten Grades, oder zum Vormund.',
    inclusions: [
      'Eltern-Kind- und Kind-Eltern-Beziehungen, Beziehungen unter Kindern und Beziehungen zum erweiterten Familienkreis',
    ],
  ),
  'd7600': IcfDetail(
    title: 'Eltern-Kind-Beziehungen',
    description:
        'Auf natürliche Weise oder durch Adoption zu einem Elternteil zu werden oder dies zu sein, wie ein Kind zu haben und mit ihm in elterlicher Beziehung stehen oder eine elterliche Beziehung mit einem Adoptivkind aufbaün und aufrecht erhalten sowie dem eigenen Kind oder dem Adoptivkind physische, intellektülle und emotionale Zuwendung geben.',
  ),
  'd7601': IcfDetail(
    title: 'Kind-Eltern-Beziehung',
    description:
        'Mit seinen Eltern Beziehungen aufzubaün und aufrecht zu erhalten, wie als junges Kind seinen Eltern gehorchen und sich als erwachsenes Kind um seine alten Eltern kümmern.',
  ),
  'd7602': IcfDetail(
    title: 'Beziehungen unter Geschwistern',
    description:
        'Eine geschwisterliche Beziehung zu einer Person aufzubaün und aufrecht zu erhalten, die ein oder beide Elternteile kraft Geburt, durch Adoption oder Heirat gemeinsam hat.',
  ),
  'd7603': IcfDetail(
    title: 'Beziehungen zum erweiterten Familienkreis',
    description:
        'Eine Familienbeziehung zu Mitgliedern des eigenen erweiterten Familienkreises aufzubaün und aufrecht zu erhalten, wie mit Cousinen und Cousins, Tanten, Onkeln und Grosseltern.',
  ),
  'd7608': IcfDetail(
    title: 'Familienbeziehungen, anders bezeichnet',
  ),
  'd7609': IcfDetail(
    title: 'Familienbeziehungen, nicht näher bezeichnet',
  ),
  'd770': IcfDetail(
    title: 'Intime Beziehungen',
    description:
        'Intime oder Liebesbeziehungen zwischen Individün aufzubaün und aufrecht zu erhalten, wie zwischen Ehemann und -frau, sich Liebenden oder Sexualpartnern.',
    inclusions: [
      'Liebes-, eheliche und Sexualbeziehungen',
    ],
  ),
  'd7700': IcfDetail(
    title: 'Liebesbeziehungen',
    description:
        'Beziehungen auf der Grundlage emotionaler und physischer Anziehung, die zu längerfristigen engen Beziehungen führen können, aufzubaün und aufrecht zu erhalten.',
  ),
  'd7701': IcfDetail(
    title: 'Eheliche Beziehungen',
    description:
        'Eine intime Beziehung mit einer anderen Person auf rechtlicher Grundlage aufzubaün und aufrecht zu erhalten, wie in einer Ehe, einschliesslich eine Ehefrau oder ein Ehemann oder eine rechtlich anerkannte Lebensgefährtin bzw. -gefährte zu werden und zu sein.',
  ),
  'd7702': IcfDetail(
    title: 'Sexualbeziehungen',
    description:
        'Mit dem Ehe- oder einem anderen Partner Beziehungen sexüller Art aufzunehmen und aufrecht zu erhalten.',
  ),
  'd7708': IcfDetail(
    title: 'Intime Beziehungen, anders bezeichnet',
  ),
  'd7709': IcfDetail(
    title: 'Intime Beziehungen, nicht näher bezeichnet',
  ),
  'd779': IcfDetail(
    title:
        'Besondere interpersonelle Beziehungen, anders oder nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 8: Bedeutende Lebensbereiche
  // =========================================================================

  // --- Bildung/Ausbildung (d810-d839) ---

  'd810': IcfDetail(
    title: 'Informelle Bildung/Ausbildung',
    description:
        'Zu Hause oder in einem anderen nicht-institutionellen Rahmen zu lernen, wie handwerkliche und andere Fertigkeiten.',
  ),
  'd815': IcfDetail(
    title: 'Vorschulerziehung',
    description:
        'Auf einem Eingangsniveau organisierten Unterrichts zu lernen, der vornehmlich dazu dient, ein Kind auf die Schule vorzubereiten.',
  ),
  'd820': IcfDetail(
    title: 'Schulbildung',
    description:
        'Die Zulassung zu Schule und Bildung zu erlangen, an schulbezogenen Pflichten teilzuhaben und Lehrgangsstoffe zu erlernen.',
  ),
  'd825': IcfDetail(
    title: 'Theoretische Berufsausbildung',
    description:
        'Sich an Aktivitäten von beruflichen Ausbildungsprogrammen zu beteiligen und curriculare Stoffe für Beschäftigung zu lernen.',
  ),
  'd830': IcfDetail(
    title: 'Höhere Bildung und Ausbildung',
    description:
        'Sich an Aktivitäten weiterführender Bildungsprogramme an Universitäten und Fachhochschulen zu beteiligen.',
  ),
  'd839': IcfDetail(
    title: 'Bildung/Ausbildung, anders oder nicht näher bezeichnet',
  ),

  // --- Arbeit und Beschaeftigung (d840-d859) ---

  'd840': IcfDetail(
    title: 'Vorbereitung auf Erwerbstätigkeit',
    description:
        'Sich an allen Programmen in Zusammenhang mit der Vorbereitung auf Beschäftigung zu beteiligen, wie die Aufgaben ausführen, die in Lehre, Praktika (einschliesslich im Rahmen eines Hochschulstudiums) und ausbildungsbegleitendem Training gefordert werden.',
    exclusions: [
      'Theoretische Berufsausbildung (d825)',
    ],
  ),
  'd845': IcfDetail(
    title: 'Eine Arbeit erhalten, behalten und beenden',
    description:
        'Eine Beschäftigung zu suchen, zu finden und auszuwählen, eine angebotene Arbeitsstelle anzunehmen, eine Anstellung, eine Gewerbetätigkeit, eine allgemeine oder eine gehobene berufliche Tätigkeit zu behalten und darin aufzusteigen sowie ein Arbeitsverhältnis in geeigneter Weise zu beenden.',
    inclusions: [
      'Eine Arbeit suchen',
      'Einen Lebenslauf verfassen',
      'Arbeitgeber kontaktieren und Bewerbungsgespräche vorbereiten',
      'Ein Arbeitsverhältnis aufrecht erhalten',
      'Seine eigene Arbeitsleistung überwachen',
      'Kündigen und ein Arbeitsverhältnis beenden',
    ],
  ),
  'd8450': IcfDetail(
    title: 'Arbeit suchen',
    description:
        'Ein Arbeitsangebot in einem Gewerbe, Beruf oder eine andere Art von Beschäftigung herauszufinden und auszuwählen und die erforderlichen Aufgaben zu erledigen, um eingestellt zu werden, wie mit dem Arbeitgeber Kontakt aufnehmen oder an einem Vorstellungsgespräch teilnehmen.',
  ),
  'd8451': IcfDetail(
    title: 'Ein Arbeitsverhältnis behalten',
    description:
        'Die Aufgaben des Arbeitsplatzes zu erfüllen, um die Beschäftigung, die Gewerbetätigkeit, die berufliche Tätigkeit oder andere Form von Arbeit zu behalten und eine Beförderung oder andere Förderungen zu erhalten.',
  ),
  'd8452': IcfDetail(
    title: 'Ein Arbeitsverhältnis beenden',
    description:
        'In geeigneter Weise ein Arbeitsverhältnis aufzulösen oder zu kündigen.',
  ),
  'd8458': IcfDetail(
    title:
        'Ein Arbeitsverhältnis finden, behalten und beenden, anders bezeichnet',
  ),
  'd8459': IcfDetail(
    title:
        'Ein Arbeitsverhältnis finden, behalten und beenden, nicht näher bezeichnet',
  ),
  'd850': IcfDetail(
    title: 'Bezahlte Tätigkeit',
    description:
        'Sich an allen Aspekten bezahlter Arbeit in Form von Beschäftigung, Gewerbetätigkeit, beruflicher Tätigkeit oder anderer Art von Erwerbstätigkeit zu beteiligen, als Angestellter, in Voll- oder Teilzeitbeschäftigung oder als Selbständiger, wie Arbeit suchen und eine Arbeitsstelle erhalten, die geforderten Aufgaben der Arbeitsstelle erfüllen, rechtzeitig bei der Arbeit erscheinen, andere Arbeitnehmer überwachen oder selbst überwacht werden sowie die geforderten Aufgaben allein oder in Gruppen erledigen.',
    inclusions: [
      'Selbständige Tätigkeit',
      'Teil- oder Vollzeitbeschäftigung',
    ],
  ),
  'd8500': IcfDetail(
    title: 'Selbständige Tätigkeit',
    description:
        'Selbständige Erwerbstätigkeit, die das Individuum selbst gesucht oder geschaffen hat, oder von anderen ohne formelles Arbeitsverhältnis vertraglich zugesichert wurde, auszuüben, wie landwirtschaftliche Wanderarbeit, Tätigkeit als freiberuflicher Autor oder Berater, kurzfristige Vertragsarbeit, Tätigkeit als Künstler oder Handwerker, ein Geschäft oder ein Unternehmen besitzen und führen.',
    exclusions: [
      'Teilzeit- und Vollzeitbeschäftigung (d8501, d8502)',
    ],
  ),
  'd8501': IcfDetail(
    title: 'Teilzeitbeschäftigung',
    description:
        'Sich als Angestellter an allen Aspekten bezahlter Arbeit auf Teilzeitbasis zu beteiligen, wie Arbeit suchen und eine Arbeitsstelle erhalten, die geforderten Aufgaben der Arbeitsstelle erfüllen, rechtzeitig bei der Arbeit erscheinen, andere Arbeitnehmer überwachen oder selbst überwacht werden sowie die geforderten Aufgaben allein oder in Gruppen erledigen.',
  ),
  'd8502': IcfDetail(
    title: 'Vollzeitbeschäftigung',
    description:
        'Sich als Angestellter an allen Aspekten bezahlter Arbeit auf Vollzeitbasis zu beteiligen, wie Arbeit suchen und eine Tätigkeit erhalten, die geforderten Aufgaben der Tätigkeit erfüllen, rechtzeitig bei der Arbeit erscheinen, andere Arbeitnehmer überwachen oder selbst überwacht werden sowie die geforderten Aufgaben allein oder in Gruppen erledigen.',
  ),
  'd8508': IcfDetail(
    title: 'Bezahlte Tätigkeit, anders bezeichnet',
  ),
  'd8509': IcfDetail(
    title: 'Bezahlte Tätigkeit, nicht näher bezeichnet',
  ),
  'd855': IcfDetail(
    title: 'Unbezahlte Tätigkeit',
    description:
        'Sich an allen Aspekten der Voll- oder Teilzeitarbeit, für die eine Bezahlung nicht vorgesehen ist, zu beteiligen, einschliesslich organisierter Arbeitsaktivitäten, die geforderten Aufgaben der Tätigkeit zu erfüllen, rechtzeitig bei der Arbeit zu erscheinen, andere Arbeitnehmer zu überwachen oder selbst überwacht zu werden sowie die geforderten Aufgaben allein oder in Gruppen zu erledigen, wie ehrenamtliche Tätigkeit, ohne Bezahlung für die Gemeinschaft, für religiöse Gruppen oder in der häuslichen Umgebung arbeiten.',
    exclusions: [
      'Kapitel 6: Häusliches Leben',
    ],
  ),
  'd859': IcfDetail(
    title: 'Arbeit und Beschäftigung, anders oder nicht näher bezeichnet',
  ),

  // --- Wirtschaftliches Leben (d860-d879) ---

  'd860': IcfDetail(
    title: 'Elementare wirtschaftliche Transaktionen',
    description:
        'Sich an jeder Form einfacher wirtschaftlicher Transaktionen zu beteiligen, wie Geld zum Einkaufen von Nahrungsmitteln benutzen oder Tauschhandel treiben, Güter oder Dienstleistungen austauschen oder Geld sparen.',
  ),
  'd865': IcfDetail(
    title: 'Komplexe wirtschaftliche Transaktionen',
    description:
        'Sich an jeder Art von komplexen wirtschaftlichen Transaktionen zu beteiligen, die den Austausch von Kapital oder Eigentum und die Erzielung von Gewinn oder anderen wirtschaftlichen Werten beinhalten, wie ein Geschäft, eine Fabrik oder eine Ausstattung kaufen, ein Bankkonto unterhalten oder mit Gebrauchsgegenständen handeln.',
  ),
  'd870': IcfDetail(
    title: 'Wirtschaftliche Eigenständigkeit',
    description:
        'Die Verfügungsgewalt über wirtschaftliche Ressourcen aus privaten oder öffentlichen Qüllen zu haben, um die wirtschaftliche Sicherheit für den gegenwärtigen und zukünftigen Bedarf zu gewährleisten.',
    inclusions: [
      'Persönliche wirtschaftliche Ressourcen und öffentliche wirtschaftliche Ansprüche',
    ],
  ),
  'd8700': IcfDetail(
    title: 'Persönliche wirtschaftliche Ressourcen',
    description:
        'Die Verfügungsgewalt über persönliche oder private wirtschaftliche Ressourcen zu haben, um die wirtschaftliche Sicherheit für den gegenwärtigen und zukünftigen Bedarf zu gewährleisten.',
  ),
  'd8701': IcfDetail(
    title: 'Öffentliche wirtschaftliche Ansprüche',
    description:
        'Die Verfügungsgewalt über öffentliche wirtschaftliche Ressourcen zu haben, um die wirtschaftliche Sicherheit für den gegenwärtigen und zukünftigen Bedarf zu gewährleisten.',
  ),
  'd8708': IcfDetail(
    title: 'Wirtschaftliche Eigenständigkeit, anders bezeichnet',
  ),
  'd8709': IcfDetail(
    title: 'Wirtschaftliche Eigenständigkeit, nicht näher bezeichnet',
  ),
  'd879': IcfDetail(
    title: 'Wirtschaftliches Leben, anders oder nicht näher bezeichnet',
  ),

  // =========================================================================
  // Kapitel 9: Gemeinschafts-, soziales und staatsbuergerliches Leben
  // =========================================================================

  'd910': IcfDetail(
    title: 'Gemeinschaftsleben',
    description:
        'Sich an allen Aspekten des gemeinschaftlichen sozialen Lebens zu beteiligen, wie in Wohlfahrtsorganisationen, Dienstleistungsvereinigungen oder professionellen Sozialorganisationen mitzuwirken.',
    inclusions: [
      'Informelle und formelle Vereinigungen',
      'Feierlichkeiten',
    ],
    exclusions: [
      'Unbezahlte Tätigkeit (d855)',
      'Erholung und Freizeit (d920)',
      'Religion und Spiritualität (d930)',
      'Politisches Leben und Staatsbürgerschaft (d950)',
    ],
  ),
  'd9100': IcfDetail(
    title: 'Informelle Vereinigungen',
    description:
        'Sich in sozialen oder gesellschaftlichen Vereinigungen, die von Menschen gleicher Interessen organisiert sind, zu beteiligen, wie lokale soziale Klubs oder ethnische Gruppen.',
  ),
  'd9101': IcfDetail(
    title: 'Formelle Vereinigungen',
    description:
        'Sich an professionellen oder anderen sozialen Fachgruppen zu beteiligen, wie Vereinigungen von Rechtsanwälten, Ärzten oder Akademikern.',
  ),
  'd9102': IcfDetail(
    title: 'Feierlichkeiten',
    description:
        'Sich an nichtreligiösen Riten oder gesellschaftlichen Feierlichkeiten zu beteiligen, wie an Hochzeiten, Beerdigungen oder Initialriten.',
  ),
  'd9108': IcfDetail(
    title: 'Gemeinschaftsleben, anders bezeichnet',
  ),
  'd9109': IcfDetail(
    title: 'Gemeinschaftsleben, nicht näher bezeichnet',
  ),
  'd920': IcfDetail(
    title: 'Erholung und Freizeit',
    description:
        'Sich an allen Formen des Spiels, von Freizeit- oder Erholungsaktivitäten zu beteiligen, wie an Spiel und Sport in informeller oder organisierter Form, Programmen für die körperliche Fitness, Entspannung, Unterhaltung oder Zerstreuung; Kunstgalerien, Museen, Kino oder Theater besuchen, Handarbeiten machen und Hobbys frönen, zur Erbauung lesen, Musikinstrumente spielen; Sehenswürdigkeiten besichtigen, Tourismus- und Vergnügungsreisen machen.',
    inclusions: [
      'Spiel, Sport, Kunst und Kultur, Kunsthandwerk, Hobbys und Geselligkeit',
    ],
    exclusions: [
      'Tiere zu Transportzwecken reiten (d480)',
      'Bezahlte und unbezahlte Tätigkeit (d850 und d855)',
      'Religion und Spiritualität (d930)',
      'Politisches Leben und Staatsbürgerschaft (d950)',
    ],
  ),
  'd9200': IcfDetail(
    title: 'Spiel',
    description:
        'Sich an Spielen mit Regeln, unstrukturierten oder ungeregelten Spielen und Freizeitbeschäftigung zu beteiligen, wie Schach oder Karten spielen oder das Spiel von Kindern.',
  ),
  'd9201': IcfDetail(
    title: 'Sport',
    description:
        'Sich an informellen oder formell organisierten Wettkampfspielen oder athletischen Ereignissen, die allein oder in einer Gruppe durchgeführt werden, zu beteiligen, wie Bowling, Gymnastik oder Fussball.',
  ),
  'd9202': IcfDetail(
    title: 'Kunst und Kultur',
    description:
        'Sich an Ereignissen der schönen Künste oder der Kultur zu beteiligen oder an diesen Gefallen zu finden, wie ins Theater, Kino, Museum oder in Kunstgalerien gehen, in einem Stück als Schauspieler auftreten, zur eigenen Erbauung lesen oder ein Musikinstrument spielen.',
  ),
  'd9203': IcfDetail(
    title: 'Kunsthandwerk',
    description:
        'Sich an Handarbeiten zu beteiligen, wie Töpferei oder Stricken.',
  ),
  'd9204': IcfDetail(
    title: 'Hobbys',
    description:
        'Sich mit Lieblingsbeschäftigungen zu befassen, wie Briefmarken, Münzen oder Antiquitäten sammeln.',
  ),
  'd9205': IcfDetail(
    title: 'Geselligkeit',
    description:
        'Sich an informellen oder gelegentlichen Zusammenkünften beteiligen, wie Freunde oder Verwandte besuchen oder sich informell in der Öffentlichkeit zu treffen.',
  ),
  'd9208': IcfDetail(
    title: 'Erholung und Freizeit, anders bezeichnet',
  ),
  'd9209': IcfDetail(
    title: 'Erholung und Freizeit, nicht näher bezeichnet',
  ),
  'd930': IcfDetail(
    title: 'Religion und Spiritualität',
    description:
        'Sich an religiösen und spiritüllen Aktivitäten, Organisationen oder Praktiken zur Selbsterfüllung, Bedeutungsfindung, für religiöse und spiritülle Werte sowie zur Bildung von Beziehung zu einer göttlichen Macht zu beteiligen, wie an religiösen Diensten in einer Kirche, einem Tempel, einer Moschee oder Synagoge teilnehmen, aus religiösen Gründen beten und singen; spiritülle Kontemplation.',
    inclusions: [
      'Organisierte Religion und Spiritualität',
    ],
  ),
  'd9300': IcfDetail(
    title: 'Organisierte Religion',
    description:
        'Sich an organisierten religiösen Zeremonien, Aktivitäten und Ereignissen beteiligen.',
  ),
  'd9301': IcfDetail(
    title: 'Spiritualität',
    description:
        'Sich ausserhalb organisierter Religion an spiritüllen Aktivitäten oder Ereignissen zu beteiligen.',
  ),
  'd9308': IcfDetail(
    title: 'Religion und Spiritualität, anders bezeichnet',
  ),
  'd9309': IcfDetail(
    title: 'Religion und Spiritualität, nicht näher bezeichnet',
  ),
  'd940': IcfDetail(
    title: 'Menschenrechte',
    description:
        'Die nationalen und internationalen anerkannten Rechte zu geniessen, die Menschen allein aufgrund ihres Menschseins gewährt werden, wie die Menschenrechte der Menschenrechtsdeklaration der Vereinten Nationen (1948) und die Rahmenbestimmungen für die Herstellung von Chancengleichheit von Personen mit Behinderungen (1993); das Recht auf Selbstbestimmung und Autonomie sowie das Recht, über sein Schicksal selbst zu bestimmen.',
    exclusions: [
      'Politisches Leben und Staatsbürgerschaft (d950)',
    ],
  ),
  'd950': IcfDetail(
    title: 'Politisches Leben und Staatsbürgerschaft',
    description:
        'Sich als Bürger am sozialen, politischen und staatlichen Leben zu beteiligen, der den rechtlichen Status als Staatsbürger besitzt und die damit verbundenen Rechte, den Schutz, die Vorteile und Pflichten geniesst, wie das Wahlrecht wahrnehmen, für ein politisches Amt kandidieren, politische Vereinigungen gründen; die Rechte und die Freiheit eines Staatsbürgers zu geniessen (wie das Recht auf Meinungs-, Versammlungs- und Religionsfreiheit, Schutz vor unverhältnismässiger oder unrechtmässiger Verfolgung und Gefangennahme, das Recht auf Rechtsberatung und Verteidigung, auf ein Gerichtsverfahren sowie andere Rechte und Schutz vor Diskriminierung); den rechtlichen Status als Staatsbürger haben.',
    exclusions: [
      'Menschenrechte (d940)',
    ],
  ),
  'd998': IcfDetail(
    title:
        'Leben in der Gemeinschaft, soziales und staatsbürgerliches Leben, anders bezeichnet',
  ),
  'd999': IcfDetail(
    title:
        'Leben in der Gemeinschaft, soziales und staatsbürgerliches Leben, nicht näher bezeichnet',
  ),

};
