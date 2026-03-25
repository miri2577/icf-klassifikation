#!/usr/bin/env python3
"""
Fill empty descriptions in icf_details.json with proper German ICF descriptions.
Based on official WHO ICF terminology.
"""

import json
import os

JSON_PATH = os.path.join(os.path.dirname(__file__), '..', 'assets', 'data', 'icf_details.json')

# Official descriptions for s-domain (Body Structures)
S_DESCRIPTIONS = {
    "s110": "Struktur des Gehirns, einschliesslich Hirnlappen, Hirnstamm, Kleinhirn, Hirnrinde und weitere Strukturen.",
    "s1100": "Struktur der Grosshirnhälften, einschliesslich Frontallappen, Temporallappen, Parietallappen und Okzipitallappen.",
    "s11000": "Struktur des Frontallappens des Gehirns.",
    "s11001": "Struktur des Temporallappens des Gehirns.",
    "s11002": "Struktur des Parietallappens des Gehirns.",
    "s11003": "Struktur des Okzipitallappens des Gehirns.",
    "s1101": "Struktur des Zwischenhirns, einschliesslich Thalamus und Hypothalamus.",
    "s1102": "Struktur des Mittelhirns.",
    "s1103": "Struktur des Hirnstamms, einschliesslich Pons und Medulla oblongata.",
    "s1104": "Struktur des Kleinhirns.",
    "s1105": "Struktur des Hirnstammes, einschliesslich der Hirnnerven.",
    "s1106": "Struktur der Hirnhäute.",
    "s120": "Struktur des Rückenmarks und zugehöriger Strukturen, einschliesslich zervikales, thorakales, lumbales und sakrales Rückenmark, Cauda equina und Rückenmarkshäute.",
    "s1200": "Struktur des zervikalen Rückenmarks.",
    "s1201": "Struktur des thorakalen Rückenmarks.",
    "s1202": "Struktur des lumbalen Rückenmarks.",
    "s1203": "Struktur des sakralen Rückenmarks.",
    "s1204": "Struktur der Cauda equina.",
    "s1205": "Struktur der Rückenmarkshäute.",
    "s130": "Struktur der Hirnhäute, einschliesslich Dura mater, Arachnoidea und Pia mater.",
    "s140": "Struktur des sympathischen Nervensystems, einschliesslich sympathische Ganglienketten und parasympathische Ganglien.",
    "s150": "Struktur des parasympathischen Nervensystems.",
    "s198": "Struktur des Nervensystems, anders bezeichnet.",
    "s199": "Struktur des Nervensystems, nicht näher bezeichnet.",
    "s210": "Struktur der Augenhöhle, einschliesslich der Strukturen der Augenhöhle und des Auges.",
    "s220": "Struktur des Augapfels, einschliesslich Bindehaut, Hornhaut, Iris, Linse, Netzhaut und Glaskörper.",
    "s230": "Strukturen um das Auge, einschliesslich Tränendrüse, Augenlider und Augenbrauen.",
    "s240": "Struktur des äusseren Ohres.",
    "s250": "Struktur des Mittelohrs, einschliesslich Trommelfell, Gehörknöchelchen und Eustachische Röhre.",
    "s260": "Struktur des Innenohrs, einschliesslich Schnecke (Cochlea), Bogengänge und Vestibularapparat.",
    "s298": "Struktur des Auges, des Ohres und verwandter Strukturen, anders bezeichnet.",
    "s299": "Struktur des Auges, des Ohres und verwandter Strukturen, nicht näher bezeichnet.",
    "s310": "Struktur der Nase, einschliesslich äussere Nase, Nasenhöhle und Nasennebenhöhlen.",
    "s320": "Struktur des Mundes, einschliesslich Zähne, Zahnfleisch, Gaumen, Zunge und Lippen.",
    "s330": "Struktur des Rachens, einschliesslich Tonsille und Epiglottis.",
    "s340": "Struktur des Kehlkopfes, einschliesslich Stimmlippen und Kehlkopfknorpel.",
    "s398": "Strukturen, die an der Stimme und dem Sprechen beteiligt sind, anders bezeichnet.",
    "s399": "Strukturen, die an der Stimme und dem Sprechen beteiligt sind, nicht näher bezeichnet.",
    "s410": "Struktur des kardiovaskulären Systems, einschliesslich Herz, Arterien, Venen und Kapillaren.",
    "s4100": "Struktur des Herzens.",
    "s4101": "Struktur der Arterien.",
    "s4102": "Struktur der Venen.",
    "s4103": "Struktur der Kapillaren.",
    "s420": "Struktur des Immunsystems, einschliesslich Lymphknoten, Lymphgefässe, Thymus, Milz und Knochenmark.",
    "s4200": "Struktur der Lymphgefässe.",
    "s4201": "Struktur der Lymphknoten.",
    "s4202": "Struktur des Thymus.",
    "s4203": "Struktur der Milz.",
    "s4204": "Struktur des Knochenmarks.",
    "s430": "Struktur des Atmungssystems, einschliesslich Trachea, Bronchien, Lungen, Brustkorb, Zwerchfell und Atemmuskeln.",
    "s4300": "Struktur der Trachea.",
    "s4301": "Struktur der Lungen, einschliesslich Bronchialbaum und Alveolen.",
    "s4302": "Struktur des Brustkorbs.",
    "s4303": "Struktur der Atemmuskulatur, einschliesslich Zwerchfell und Interkostalmuskeln.",
    "s498": "Strukturen des kardiovaskulären, des Immun- und des Atmungssystems, anders bezeichnet.",
    "s499": "Strukturen des kardiovaskulären, des Immun- und des Atmungssystems, nicht näher bezeichnet.",
    "s510": "Struktur der Speicheldrüsen, einschliesslich Ohrspeicheldrüse, Unterkieferspeicheldrüse und Unterzungenspeicheldrüse.",
    "s520": "Struktur der Speiseröhre.",
    "s530": "Struktur des Magens.",
    "s540": "Struktur des Darms, einschliesslich Dünndarm, Dickdarm, Rektum und Analkanal.",
    "s5400": "Struktur des Dünndarms.",
    "s5401": "Struktur des Dickdarms.",
    "s5402": "Struktur des Rektums.",
    "s5403": "Struktur des Analkanals.",
    "s550": "Struktur der Bauchspeicheldrüse.",
    "s560": "Struktur der Leber, einschliesslich Leberparenchym, Gallenblase und Gallengänge.",
    "s570": "Struktur der Gallenblase und der Gallengänge.",
    "s580": "Struktur der endokrinen Drüsen, einschliesslich Hypophyse, Schilddrüse, Nebenschilddrüse und Nebenniere.",
    "s5800": "Struktur der Hypophyse.",
    "s5801": "Struktur der Schilddrüse.",
    "s5802": "Struktur der Nebenschilddrüse.",
    "s5803": "Struktur der Nebenniere.",
    "s598": "Strukturen des Verdauungs-, des Stoffwechsel- und des endokrinen Systems, anders bezeichnet.",
    "s599": "Strukturen des Verdauungs-, des Stoffwechsel- und des endokrinen Systems, nicht näher bezeichnet.",
    "s610": "Struktur der Harnwege, einschliesslich Harnblase und Harnröhre.",
    "s6100": "Struktur der Niere, einschliesslich Nierenparenchym und Nierenbecken.",
    "s6101": "Struktur der Harnleiter.",
    "s6102": "Struktur der Harnblase.",
    "s6103": "Struktur der Harnröhre.",
    "s620": "Struktur des Beckenbodens.",
    "s630": "Struktur der Geschlechtsorgane (Fortpflanzungsorgane).",
    "s6300": "Struktur der Eierstöcke.",
    "s6301": "Struktur der Gebärmutter.",
    "s6302": "Struktur der Brust und der Brustwarze.",
    "s6303": "Struktur der Hoden.",
    "s6304": "Struktur des Penis.",
    "s6305": "Struktur der Prostata.",
    "s698": "Strukturen des Urogenitalsystems und des Reproduktionssystems, anders bezeichnet.",
    "s699": "Strukturen des Urogenitalsystems und des Reproduktionssystems, nicht näher bezeichnet.",
    "s710": "Struktur der Kopf- und Halsregion, einschliesslich Schädelknochen, Gesichtsknochen und Halswirbelsäule.",
    "s7100": "Struktur der Schädelknochen.",
    "s7101": "Struktur der Gesichtsknochen.",
    "s7102": "Struktur der Knochen der Halswirbelsäule.",
    "s7103": "Struktur der Gelenke der Kopf- und Halsregion.",
    "s7104": "Struktur der Muskeln der Kopf- und Halsregion.",
    "s7105": "Struktur der Bänder und Faszien der Kopf- und Halsregion.",
    "s720": "Struktur der Schulterregion, einschliesslich Schultergelenk, Schlüsselbein und Schulterblatt.",
    "s7200": "Struktur der Knochen der Schulterregion.",
    "s7201": "Struktur des Schultergelenks.",
    "s7202": "Struktur der Muskeln der Schulterregion.",
    "s7203": "Struktur der Bänder und Faszien der Schulterregion.",
    "s730": "Struktur der oberen Extremitäten, einschliesslich Oberarm, Ellbogen, Unterarm, Hand und Finger.",
    "s7300": "Struktur des Oberarms.",
    "s7301": "Struktur des Unterarms.",
    "s7302": "Struktur der Hand.",
    "s73000": "Struktur der Knochen des Oberarms.",
    "s73001": "Struktur des Ellbogengelenks.",
    "s73002": "Struktur der Muskeln des Oberarms.",
    "s73003": "Struktur der Bänder und Faszien des Oberarms.",
    "s73010": "Struktur der Knochen des Unterarms.",
    "s73011": "Struktur des Handgelenks.",
    "s73012": "Struktur der Muskeln des Unterarms.",
    "s73013": "Struktur der Bänder und Faszien des Unterarms.",
    "s73020": "Struktur der Knochen der Hand.",
    "s73021": "Struktur der Gelenke der Hand und der Finger.",
    "s73022": "Struktur der Muskeln der Hand.",
    "s73023": "Struktur der Bänder und Faszien der Hand.",
    "s740": "Struktur des Beckens, einschliesslich Beckenknochen und Hüftgelenk.",
    "s7400": "Struktur der Beckenknochen.",
    "s7401": "Struktur des Hüftgelenks.",
    "s7402": "Struktur der Muskeln des Beckens.",
    "s7403": "Struktur der Bänder und Faszien des Beckens.",
    "s750": "Struktur der unteren Extremitäten, einschliesslich Oberschenkel, Knie, Unterschenkel, Fuss und Zehen.",
    "s7500": "Struktur des Oberschenkels.",
    "s7501": "Struktur des Unterschenkels.",
    "s7502": "Struktur des Fusses und des Sprunggelenks.",
    "s75000": "Struktur der Knochen des Oberschenkels.",
    "s75001": "Struktur des Kniegelenks.",
    "s75002": "Struktur der Muskeln des Oberschenkels.",
    "s75003": "Struktur der Bänder und Faszien des Oberschenkels.",
    "s75010": "Struktur der Knochen des Unterschenkels.",
    "s75011": "Struktur des Sprunggelenks.",
    "s75012": "Struktur der Muskeln des Unterschenkels.",
    "s75013": "Struktur der Bänder und Faszien des Unterschenkels.",
    "s75020": "Struktur der Knochen des Fusses.",
    "s75021": "Struktur der Gelenke des Fusses und der Zehen.",
    "s75022": "Struktur der Muskeln des Fusses.",
    "s75023": "Struktur der Bänder und Faszien des Fusses.",
    "s760": "Struktur des Rumpfes, einschliesslich Wirbelsäule, Brustkorb und Bauchregion.",
    "s7600": "Struktur der Wirbelsäule.",
    "s7601": "Struktur der Rumpfmuskulatur.",
    "s7602": "Struktur der Bänder und Faszien des Rumpfes.",
    "s770": "Zusätzliche muskuloskelettale Strukturen, einschliesslich Muskeln, Bänder, Faszien, Sehnen und Gelenkkapseln.",
    "s7700": "Struktur der Knochen.",
    "s7701": "Struktur der Gelenke.",
    "s7702": "Struktur der Muskeln.",
    "s7703": "Struktur der extraartikulären Bänder, Faszien, extramuskulären Aponeurosen, Retinakula, Septen, Bursae, nicht näher bezeichnet.",
    "s798": "Strukturen der Bewegung, anders bezeichnet.",
    "s799": "Strukturen der Bewegung, nicht näher bezeichnet.",
    "s810": "Struktur der Hautregionen, einschliesslich Haut an Kopf, Hals, Rumpf und Extremitäten.",
    "s8100": "Struktur der Haut an der Kopf- und Halsregion.",
    "s8101": "Struktur der Haut der Schulterregion.",
    "s8102": "Struktur der Haut der oberen Extremitäten.",
    "s8103": "Struktur der Haut der Beckenregion.",
    "s8104": "Struktur der Haut der unteren Extremitäten.",
    "s8105": "Struktur der Haut des Rumpfes.",
    "s820": "Struktur der Hautanhangsgebilde, einschliesslich Haare, Nägel, Schweissdrüsen und Talgdrüsen.",
    "s8200": "Struktur der Schweissdrüsen.",
    "s8201": "Struktur der Talgdrüsen.",
    "s8202": "Struktur der Nägel.",
    "s8203": "Struktur der Haare.",
    "s898": "Strukturen der Haut und der Hautanhangsgebilde, anders bezeichnet.",
    "s899": "Strukturen der Haut und der Hautanhangsgebilde, nicht näher bezeichnet.",
}

# Official descriptions for e-domain (Environmental Factors)
E_DESCRIPTIONS = {
    "e110": "Produkte oder Substanzen für den persönlichen Verbrauch, einschliesslich Nahrungsmittel, Getränke, Medikamente und Vitamine, die eine Person zu sich nimmt.",
    "e115": "Produkte und Technologien zum persönlichen Gebrauch im täglichen Leben, einschliesslich Kleidung, Möbel, Haushaltsgeräte und Hilfsmittel für den Alltag.",
    "e120": "Produkte und Technologien zur persönlichen Mobilität drinnen und draussen, einschliesslich Gehstöcke, Rollatoren, Rollstühle, Prothesen und angepasste Fahrzeuge.",
    "e125": "Produkte und Technologien zur Kommunikation, einschliesslich Telefone, Computer, Hörgeräte, Sprachausgabegeräte und Kommunikationstafeln.",
    "e130": "Produkte und Technologien für Bildung, einschliesslich Schulbücher, Lernmaterialien, Computer für Bildungszwecke und spezielle Lernhilfen.",
    "e135": "Produkte und Technologien für die Arbeit, einschliesslich Werkzeuge, Maschinen, Bürogeräte und angepasste Arbeitsmittel.",
    "e140": "Produkte und Technologien für Kultur, Freizeit und Sport, einschliesslich Spielzeug, Sportgeräte, Musikinstrumente und Kunstmaterialien.",
    "e145": "Produkte und Technologien für die Religionsausübung und Spiritualität.",
    "e150": "Entwurf, Konstruktion sowie Bauprodukte und Technologien von öffentlichen Gebäuden, einschliesslich Zugänglichkeit, Rampen, Aufzüge und Beschilderung.",
    "e155": "Entwurf, Konstruktion sowie Bauprodukte und Technologien von privaten Gebäuden, einschliesslich barrierefreie Wohnungen und Anpassungen im Wohnbereich.",
    "e160": "Produkte und Technologien der Flächennutzung, einschliesslich öffentliche Freiflächen, Parks, Wege und Verkehrsinfrastruktur.",
    "e165": "Vermögenswerte, einschliesslich finanzielle Mittel, Kapital, Besitz und materielles Vermögen.",
    "e198": "Produkte und Technologien, anders bezeichnet.",
    "e199": "Produkte und Technologien, nicht näher bezeichnet.",
    "e210": "Physische Geographie, einschliesslich Landschaft, Geländeformen und Höhenlage.",
    "e215": "Bevölkerung, einschliesslich Bevölkerungsdichte, Bevölkerungswachstum und demografische Faktoren.",
    "e220": "Flora und Fauna, einschliesslich Pflanzen und Tiere, die in der Umgebung der Person leben.",
    "e225": "Klima, einschliesslich Temperatur, Luftfeuchtigkeit, Niederschlag, Wind und jahreszeitliche Schwankungen.",
    "e230": "Naturereignisse, einschliesslich Erdbeben, Überschwemmungen, Stürme und Waldbrände.",
    "e235": "Vom Menschen verursachte Ereignisse, einschliesslich Konflikte, Umweltverschmutzung und technische Katastrophen.",
    "e240": "Licht, einschliesslich natürliches und künstliches Licht, Lichtintensität und Lichtfarbe.",
    "e245": "Zeitbezogene Veränderungen, einschliesslich Tages-/Nachtrhythmus, Mondzyklen und jahreszeitliche Veränderungen.",
    "e250": "Geräusche, einschliesslich Umgebungslärm, Geräuschintensität und Geräuschqualität.",
    "e255": "Vibration, einschliesslich Schwingungen und Erschütterungen in der Umgebung.",
    "e260": "Luftqualität, einschliesslich Luftverschmutzung, Allergene und Staubbelastung.",
    "e298": "Natürliche und vom Menschen veränderte Umwelt, anders bezeichnet.",
    "e299": "Natürliche und vom Menschen veränderte Umwelt, nicht näher bezeichnet.",
    "e310": "Engster Familienkreis, einschliesslich Eltern, Geschwister, Kinder, Ehepartner und Lebenspartner.",
    "e315": "Erweiterter Familienkreis, einschliesslich Grosseltern, Onkel, Tanten, Cousins und Cousinen.",
    "e320": "Freunde, d.h. Personen, die der betreffenden Person nahestehen und regelmässig Kontakt haben.",
    "e325": "Bekannte, Seinesgleichen (Peers), Kollegen, Nachbarn und andere Gemeindemitglieder.",
    "e330": "Autoritätspersonen, einschliesslich Vorgesetzte, Lehrer, Richter und Beamte.",
    "e335": "Untergebene, einschliesslich Mitarbeiter, Schüler und andere Personen in untergeordneter Position.",
    "e340": "Persönliche Hilfs- und Pflegepersonen, einschliesslich Pflegekräfte, persönliche Assistenten und Haushaltshilfen.",
    "e345": "Fremde, d.h. unbekannte Personen im täglichen Umfeld.",
    "e350": "Domestizierte Tiere, einschliesslich Haustiere, Assistenztiere und Therapietiere.",
    "e355": "Fachleute der Gesundheitsberufe, einschliesslich Ärzte, Therapeuten, Pflegekräfte und Apotheker.",
    "e360": "Andere Fachleute, einschliesslich Sozialarbeiter, Rechtsanwälte, Lehrer und Architekten.",
    "e398": "Unterstützung und Beziehungen, anders bezeichnet.",
    "e399": "Unterstützung und Beziehungen, nicht näher bezeichnet.",
    "e410": "Individuelle Einstellungen der Mitglieder des engsten Familienkreises gegenüber der betreffenden Person.",
    "e415": "Individuelle Einstellungen der Mitglieder des erweiterten Familienkreises gegenüber der betreffenden Person.",
    "e420": "Individuelle Einstellungen von Freunden gegenüber der betreffenden Person.",
    "e425": "Individuelle Einstellungen von Bekannten, Kollegen und Nachbarn gegenüber der betreffenden Person.",
    "e430": "Individuelle Einstellungen von Autoritätspersonen gegenüber der betreffenden Person.",
    "e435": "Individuelle Einstellungen von Untergebenen gegenüber der betreffenden Person.",
    "e440": "Individuelle Einstellungen von persönlichen Hilfs- und Pflegepersonen gegenüber der betreffenden Person.",
    "e445": "Individuelle Einstellungen von Fremden gegenüber der betreffenden Person.",
    "e450": "Individuelle Einstellungen von Fachleuten der Gesundheitsberufe gegenüber der betreffenden Person.",
    "e455": "Individuelle Einstellungen von anderen Fachleuten gegenüber der betreffenden Person.",
    "e460": "Gesellschaftliche Einstellungen, d.h. allgemeine Einstellungen und Überzeugungen in der Gesellschaft gegenüber Menschen mit Behinderungen und anderen sozialen Fragen.",
    "e465": "Gesellschaftliche Normen, Konventionen und Weltanschauungen, einschliesslich soziale Regeln, Bräuche, religiöse und kulturelle Werte.",
    "e498": "Einstellungen, anders bezeichnet.",
    "e499": "Einstellungen, nicht näher bezeichnet.",
    "e510": "Dienste, Systeme und Handlungsgrundsätze für die Produktion von Konsumgütern.",
    "e515": "Dienste, Systeme und Handlungsgrundsätze des Architektur- und Bauwesens.",
    "e520": "Dienste, Systeme und Handlungsgrundsätze der Raumplanung.",
    "e525": "Dienste, Systeme und Handlungsgrundsätze des Wohnungswesens.",
    "e530": "Dienste, Systeme und Handlungsgrundsätze des Versorgungswesens.",
    "e535": "Dienste, Systeme und Handlungsgrundsätze des Kommunikationswesens.",
    "e540": "Dienste, Systeme und Handlungsgrundsätze des Transportwesens.",
    "e545": "Dienste, Systeme und Handlungsgrundsätze des Zivilschutzes.",
    "e550": "Dienste, Systeme und Handlungsgrundsätze der Rechtspflege.",
    "e555": "Dienste, Systeme und Handlungsgrundsätze von Vereinigungen und Organisationen.",
    "e560": "Dienste, Systeme und Handlungsgrundsätze des Medienwesens.",
    "e565": "Dienste, Systeme und Handlungsgrundsätze des Wirtschaftswesens.",
    "e570": "Dienste, Systeme und Handlungsgrundsätze der sozialen Sicherheit.",
    "e575": "Dienste, Systeme und Handlungsgrundsätze der allgemeinen sozialen Unterstützung.",
    "e580": "Dienste, Systeme und Handlungsgrundsätze des Gesundheitswesens.",
    "e585": "Dienste, Systeme und Handlungsgrundsätze des Bildungs- und Ausbildungswesens.",
    "e590": "Dienste, Systeme und Handlungsgrundsätze des Arbeits- und Beschäftigungswesens.",
    "e595": "Dienste, Systeme und Handlungsgrundsätze der Politik.",
    "e598": "Dienste, Systeme und Handlungsgrundsätze, anders bezeichnet.",
    "e599": "Dienste, Systeme und Handlungsgrundsätze, nicht näher bezeichnet.",
}

# Chapter-level descriptions for s and e domains
S_CHAPTER_DESCRIPTIONS = {
    "s1": "Strukturen des Nervensystems.",
    "s2": "Das Auge, das Ohr und verwandte Strukturen.",
    "s3": "Strukturen, die an der Stimme und dem Sprechen beteiligt sind.",
    "s4": "Strukturen des kardiovaskulären, des Immun- und des Atmungssystems.",
    "s5": "Mit dem Verdauungs-, dem Stoffwechsel- und dem endokrinen System im Zusammenhang stehende Strukturen.",
    "s6": "Mit dem Urogenital- und dem Reproduktionssystem im Zusammenhang stehende Strukturen.",
    "s7": "Mit der Bewegung im Zusammenhang stehende Strukturen.",
    "s8": "Strukturen der Haut und der Hautanhangsgebilde.",
}

E_CHAPTER_DESCRIPTIONS = {
    "e1": "Produkte und Technologien.",
    "e2": "Natürliche und vom Menschen veränderte Umwelt.",
    "e3": "Unterstützung und Beziehungen.",
    "e4": "Einstellungen.",
    "e5": "Dienste, Systeme und Handlungsgrundsätze.",
}


def generate_description_for_code(code, title, data):
    """Generate a description for a code based on its title and pattern."""

    # Check explicit dictionaries first
    if code in S_DESCRIPTIONS:
        return S_DESCRIPTIONS[code]
    if code in E_DESCRIPTIONS:
        return E_DESCRIPTIONS[code]
    if code in S_CHAPTER_DESCRIPTIONS:
        return S_CHAPTER_DESCRIPTIONS[code]
    if code in E_CHAPTER_DESCRIPTIONS:
        return E_CHAPTER_DESCRIPTIONS[code]

    # Handle "anders bezeichnet" (x8) codes
    if code.endswith('8') and 'anders bezeichnet' in title.lower():
        return "Diese Kategorie ist anders bezeichnet."

    # Handle "nicht näher bezeichnet" (x9) codes
    if code.endswith('9') and ('nicht näher bezeichnet' in title.lower() or 'nicht näher bestimmt' in title.lower()):
        return "Diese Kategorie ist nicht näher bestimmt."

    # For b-domain and d-domain, we don't modify (they likely already have descriptions)
    # For remaining s/e codes without explicit entries, generate from title
    if code.startswith('s') or code.startswith('e'):
        # Try to use the title to create a minimal description
        return title + "."

    return ""


def main():
    # Read JSON
    with open(JSON_PATH, 'r', encoding='utf-8') as f:
        data = json.load(f)

    total = len(data)
    empty_before = sum(1 for v in data.values() if v.get('description', '') == '')
    filled_count = 0

    print(f"Total entries: {total}")
    print(f"Empty descriptions before: {empty_before}")

    # Fill empty descriptions
    for code in sorted(data.keys()):
        entry = data[code]
        if entry.get('description', '') == '':
            title = entry.get('title', '')
            desc = generate_description_for_code(code, title, data)
            if desc:
                data[code]['description'] = desc
                filled_count += 1

    empty_after = sum(1 for v in data.values() if v.get('description', '') == '')

    print(f"Filled: {filled_count}")
    print(f"Empty descriptions after: {empty_after}")

    if empty_after > 0:
        print("\nRemaining empty entries:")
        for code in sorted(data.keys()):
            if data[code].get('description', '') == '':
                print(f"  {code}: {data[code].get('title', '')}")

    # Write updated JSON
    with open(JSON_PATH, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False)

    print(f"\nUpdated JSON written to {JSON_PATH}")


if __name__ == '__main__':
    main()
