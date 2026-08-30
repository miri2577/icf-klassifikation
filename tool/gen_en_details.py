#!/usr/bin/env python3
"""Generate complete English ICF details from German source."""
import json, re, sys

with open('/Users/mirkorichter/Desktop/icf_app/assets/data/icf_codes_en.json') as f:
    codes_en = json.load(f)
with open('/Users/mirkorichter/Desktop/icf_app/assets/data/icf_details.json') as f:
    details_de = json.load(f)

en_map = codes_en["codes"]

# Comprehensive German->English description translations
# Key: German description text, Value: English translation
translations = {
    # ===== b110 =====
    "Allgemeine mentale Funktionen, die die bewusste Wahrnehmung und Wachheit einschliesslich Klarheit und Kontinuität des Wachheitszustandes betreffen.":
        "General mental functions of the state of awareness and alertness, including the clarity and continuity of the wakeful state.",
    "Mentale Funktionen, die sich bei Veränderung als Zustände wie Bewusstseinstrübung, Stupor oder Koma äussern.":
        "Mental functions that when disturbed produce states such as clouding of consciousness, stupor or coma.",
    "Mentale Funktionen, die sich in Erhalt der Wachheit, Aufmerksamkeit und bewusster Wahrnehmung äussern und die bei einer Störung zu Dämmerzustand (Fugü), Trance oder ähnlichen Zuständen führen können.":
        "Mental functions that produce sustained wakefulness, alertness and awareness and when disturbed may produce fugue, trance or other similar states.",
    "Mentale Funktionen, die sich bei Veränderungen auf die Art des Empfindens von Wachheit, Aufmerksamkeit und bewusster Wahrnehmung auswirken, wie drogeninduzierte Bewusstseinsveränderungen oder ein Delir.":
        "Mental functions that when altered affect changes in the quality of conscious awareness, such as drug-induced states of consciousness or delirium.",
    # b114
    "Allgemeine mentale Funktionen, die Selbstwahrnehmung, Ich-Bewusstsein und realistische Wahrnehmung anderer Personen sowie der Zeit und der Umgebung betreffen.":
        "General mental functions of knowing and ascertaining one's relation to self, to others, to time and to one's surroundings.",
    "Mentale Funktionen, die sich im bewussten Gewahrsein von Wochentag, Datum, Tag, Monat und Jahr äussern.":
        "Mental functions that produce awareness of day, date, month and year.",
    "Mentale Funktionen, die sich im bewussten Gewahrsein der örtlichen Situation äussern, z.B. in welcher unmittelbaren Umgebung, in welcher Stadt oder in welchem Land man sich befindet.":
        "Mental functions that produce awareness of one's location, such as one's immediate surroundings, one's town or country.",
    "Mentale Funktionen, die sich im bewussten Gewahrsein der eigenen Identität und von Personen in der unmittelbaren Umgebung äussern.":
        "Mental functions that produce awareness of one's own identity and of individuals in one's immediate environment.",
    "Mentale Funktionen, die sich im bewussten Gewahrsein der eigenen Identität äussern.":
        "Mental functions that produce awareness of one's own identity.",
    "Mentale Funktionen, die sich im bewussten Gewahrsein von Personen in der unmittelbaren Umgebung äussern.":
        "Mental functions that produce awareness of the identity of other individuals in one's immediate environment.",
    # b117
    "Allgemeine mentale Funktionen, die erforderlich sind, die verschiedenen mentalen Funktionen einschliesslich aller kognitiven Funktionen zu verstehen und konstruktiv zu integrieren sowie diese über die gesamte Lebensdauer hinweg fortzüntwickeln.":
        "General mental functions, required to understand and constructively integrate the various mental functions, including all cognitive functions and their development over the life span.",
    # b122
    "Sich über das gesamte Leben entwickelnde allgemeine mentale Funktionen, die für das Verständnis und die konstruktive Integration jener mentalen Funktionen erforderlich sind, die zur Bildung interpersoneller Fähigkeiten führen, welche für den Aufbau reziproker sozialer Interaktionen, die sinnvoll und zweckmässig sind, benötigt werden.":
        "General mental functions, as they develop over the life span, required to understand and constructively integrate the mental functions that lead to the formation of the interpersonal skills needed to establish reciprocal social interactions, in terms of both meaning and purpose.",
    # b126
    "Allgemeine mentale Funktionen, die das anlagebedingte Naturell einer Person betreffen, individüll auf Situationen zu reagieren, einschliesslich der psychischen Charakteristika, die eine Person von einer anderen unterscheiden.":
        "General mental functions of constitutional disposition of the individual to react in a particular way to situations, including the set of mental characteristics that makes the individual distinct from others.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Kontaktfreudigkeit, Geselligkeit und (emotionale) Ausdrucksfähigkeit gekennzeichnet ist, im Gegensatz zu Schüchternheit, Zurückgezogenheit oder Gehemmtheit.":
        "Mental functions that produce a personal disposition that is outgoing, sociable and demonstrative, as contrasted to being shy, restricted and inhibited.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Kooperationsbereitschaft, Freundschaftlichkeit und Zuvorkommenheit gekennzeichnet ist, im Gegensatz zu Unfreundlichkeit, Streitbarkeit und Aufsässigkeit.":
        "Mental functions that produce a personal disposition that is cooperative, amicable and accommodating, as contrasted to being unfriendly, opposing and defiant.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Fleiss, Genauigkeit und Sorgfalt gekennzeichnet ist, im Gegensatz zu Faulheit, Unzuverlässigkeit und Verantwortungslosigkeit.":
        "Mental functions that produce a personal disposition such as in being hard-working, methodical and scrupulous, as contrasted to mental functions producing dispositions such as being lazy, unreliable and irresponsible.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Ausgeglichenheit, Ruhe und Gefasstheit gekennzeichnet ist, im Gegensatz zu Reizbarkeit, Besorgtheit, Unbeständigkeit und Launenhaftigkeit.":
        "Mental functions that produce a personal disposition that is even-tempered, calm and composed, as contrasted to being irritable, worried, erratic and moody.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Neugier, Vorstellungsvermögen und Suche nach Erfahrungen gekennzeichnet ist, im Gegensatz zu Abgestumpftheit, Unaufmerksamkeit und emotionaler Ausdruckslosigkeit.":
        "Mental functions that produce a personal disposition that is curious, imaginative, inquisitive and experience-seeking, as contrasted to being stagnant, inattentive and emotionally inexpressive.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Heiterkeit, Lebhaftigkeit und Zuversichtlichkeit gekennzeichnet ist, im Gegensatz zu Niedergeschlagenheit, Trübsinn und Verzweiflung.":
        "Mental functions that produce a personal disposition that is cheerful, buoyant and hopeful, as contrasted to being downhearted, gloomy and despairing.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Selbstsicherheit, Mut und Durchsetzungsvermögen gekennzeichnet ist, im Gegensatz zu Zaghaftigkeit, Unsicherheit und Zurückhaltung.":
        "Mental functions that produce a personal disposition that is self-assured, bold and assertive, as contrasted to being timid, insecure and self-effacing.",
    "Mentale Funktionen, die sich in einer Persönlichkeit äussern, die durch Verlässlichkeit und Prinzipientreue gekennzeichnet ist, im Gegensatz zu Hinterlistigkeit und unsozialem Verhalten.":
        "Mental functions that produce a personal disposition that is dependable and principled, as contrasted to being deceitful and antisocially disposed.",
    # b130
    "Allgemeine mentale Funktionen, die physiologische und psychologische Vorgänge betreffen, welche bei einer Person ein nachhaltiges Streben nach Befriedigung bestimmter Bedürfnisse und die Verfolgung allgemeiner Ziele verursachen.":
        "General mental functions of physiological and psychological mechanisms that cause the individual to move towards satisfying specific needs and general goals in a persistent manner.",
    "Mentale Funktionen, die sich in Durchsetzungskraft und Durchhaltevermögen äussern.":
        "Mental functions that produce vigour and stamina.",
    "Mentale Funktionen, die sich in einem Anreiz zu handeln und in einer bewussten oder unbewussten Antriebskraft zu Handlungen äussern.":
        "Mental functions that produce the incentive to act; the conscious or unconscious driving force for action.",
    "Mentale Funktionen, die sich in einem natürlichen Verlangen oder einem Wunsch äussern, insbesondere das natürliche und wiederkehrende Verlangen nach Essen und Trinken.":
        "Mental functions that produce a natural longing or desire, especially the natural and recurring desire for food and drink.",
    "Mentale Funktionen, die sich in einem Drang äussern, Substanzen zu konsumieren einschliesslich solcher, die zu Missbrauch führen können.":
        "Mental functions that produce the urge to consume substances, including substances that can be abused.",
    "Mentale Funktionen, die plötzliche intensive Handlungsimpulse regulieren und unterdrücken.":
        "Mental functions that regulate and resist sudden intense urges to do something.",
    # b134
    "Allgemeine mentale Funktionen, die sich in einer periodischen, reversiblen und selektiven physischen und mentalen Loslösung von der unmittelbaren Umgebung äussern, und die von charakteristischen physiologischen Veränderungen begleitet sind.":
        "General mental functions of periodic, reversible and selective physical and mental disengagement from one's immediate environment accompanied by characteristic physiological changes.",
    "Mentale Funktionen, die an der Zeit, die im diurnalen oder circadianen Zyklus im Schlaf verbracht wird, beteiligt sind.":
        "Mental functions involved in the time spent in the state of sleep in the diurnal cycle or circadian rhythm.",
    "Mentale Funktionen, die sich in einem Übergang zwischen Wachheit und Schlaf äussern.":
        "Mental functions that produce the transition between wakefulness and sleep.",
    "Mentale Funktionen, die sich im Durchschlafvermögen äussern.":
        "Mental functions that sustain the state of being asleep.",
    "Mentale Funktionen, die sich in einem natürlichen Schlaf mit einer optimalen physischen und geistigen Erholung und Entspannung äussern.":
        "Mental functions that produce the natural sleep leading to optimal physical and mental rest and relaxation.",
    "Mentale Funktionen, die sich in Rapid Eye Movements (REM)-Schlaf (verbunden mit Träumen) und in Non-Rapid Eye Movement Sleep (NREM) äussern.":
        "Mental functions that produce rapid eye movement (REM) sleep and non-REM sleep associated with dreaming, the sleep cycle and its deviation.",
    # b140
    "Spezifische mentale Funktionen, die die Fokussierung auf einen externen Reiz oder auf innere Vorgänge für eine geforderte Zeitspanne betreffen.":
        "Specific mental functions of focusing on an external stimulus or internal experience for the required period of time.",
    "Mentale Funktionen, die sich in der Konzentration über eine geforderte Zeitspanne äussern.":
        "Mental functions that produce concentration for the period of time required.",
    "Mentale Funktionen, die die Umlenkung der Konzentration von einem Reiz auf einen anderen zulassen.":
        "Mental functions that permit refocusing concentration from one stimulus to another.",
    "Mentale Funktionen, die die gleichzeitige Fokussierung auf zwei oder mehr Reize zulassen.":
        "Mental functions that permit focusing on two or more stimuli at the same time.",
    "Mentale Funktionen, die die Fokussierung auf denselben Reiz durch zwei oder mehr Personen zulassen, wenn z.B. ein Kind und ein Betreuer sich gemeinsam auf ein Spielzeug konzentrieren.":
        "Mental functions that permit focusing on the same stimulus by two or more people.",
    # b144
    "Spezifische mentale Funktionen, die die adäquate Registrierung, die Speicherung und den Abruf von Informationen betreffen.":
        "Specific mental functions of registering and storing information and retrieving it as needed.",
    "Mentale Funktionen, die sich in einer vorübergehenden, störbaren Gedächtnisspeicherung von etwa 30 Sekunden äussern. Aus diesem Speicher gehen Informationen verloren, wenn sie nicht im Langzeitgedächtnis verankert werden.":
        "Mental functions that produce a temporary, disruptable memory store of around 30 seconds duration from which information is lost if not consolidated into long-term memory.",
    "Mentale Funktionen, die sich in einem Gedächtnissystem zur langzeitigen Übernahme von Informationen aus dem Kurzzeitgedächtnis und zum Abruf dieser Informationen äussern. Es gibt zwei unterschiedliche Formen des Langzeitgedächtnisses: ein autobiographisches (für Ereignisse der Vergangenheit) und semantisches (für Sprache und Sachverhalte).":
        "Mental functions that produce a memory system permitting the long-term storage of information from short-term memory, both autobiographic memory for past events and semantic memory for language and facts.",
    "Spezifische mentale Funktionen, die das Erinnern von Informationen aus dem Langzeitgedächtnis und zur Überleitung ins Bewusstsein betreffen.":
        "Specific mental functions of recalling information stored in long-term memory and bringing it into awareness.",
    # b147
    "Spezifische mentale Funktionen, die die Kontrolle über motorische und psychologische Vorgänge auf körperlicher Ebene betreffen.":
        "Specific mental functions of control over both motor and psychological events at the body level.",
    "Mentale Funktionen, die Tempo des Verhaltens oder Reaktionszeiten regulieren und an denen sowohl motorische als auch psychologische Komponenten beteiligt sind. Störungen der Kontrolle führen zu einer psychomotorischen Retardierung (langsames Sprechen und Bewegen, Verminderung von Gestik und spontanen Bewegungen). Störungen der Kontrolle können auch zu psychomotorischer Erregung führen (überschiessendes Verhalten oder überschiessende kognitive Aktivitäten, die im Allgemeinen unproduktiv sind und auf einer inneren Anspannung beruhen, wie Klopfen mit den Füssen, ständiges Händereiben, agitiertes Verhalten und Ruhelosigkeit).":
        "Mental functions that regulate speed of behaviour or response time that involves both motor and psychological components, such as disruptions in control producing psychomotor retardation or psychomotor excitement.",
    "Mentale Funktionen, die sich in einer angemessenen Abfolge und Art der Teilkomponenten nicht-verbalen Verhaltens äussern, wie Augen- und Handkoordination oder Gang.":
        "Mental functions that produce non-verbal behaviour in the proper sequence and character of its sub-components, such as hand and eye coordination, or gait.",
    # b152
    "Spezifische mentale Funktionen, die im Zusammenhang mit Gefühlen und den affektiven Komponenten von Bewusstseinsprozessen stehen.":
        "Specific mental functions related to the feeling and affective components of the processes of the mind.",
    "Mentale Funktionen, die sich in der Übereinstimmung des Gefühls oder des Affektes mit der Situation äussern, wie Glücksgefühl, wenn man gute Nachrichten erhält.":
        "Mental functions that produce congruence of feeling or affect with the situation, such as happiness at receiving good news.",
    "Mentale Funktion, die Erleben und Ausdruck von Affekten kontrolliert.":
        "Mental functions that control the experience and display of affect.",
    "Mentale Funktionen, die sich im Spektrum von Gefühlsregungen oder Gefühlen äussern, wie Liebe, Hass, Angst, Sorgen, Freude, Furcht und Ärger.":
        "Mental functions that produce the spectrum of experience of arousal of affect or feelings such as love, hate, anxiousness, sorrow, joy, fear and anger.",
    # b156
    "Spezifische mentale Funktionen, die die Erkennung und Interpretation sensorischer Reize betreffen.":
        "Specific mental functions of recognizing and interpreting sensory stimuli.",
    "Mentale Funktionen, die an der Unterscheidung von Geräuschen, Tönen, Tonhöhe und anderen auditiven Reizen beteiligt sind.":
        "Mental functions involved in discriminating sounds, tones, pitches and other acoustic stimuli.",
    "Mentale Funktionen, die an der Unterscheidung von Form, Grösse, Farbe und anderen visüllen Reizen beteiligt sind.":
        "Mental functions involved in discriminating shape, size, colour and other ocular stimuli.",
    "Mentale Funktionen, die an der Erkennung unterschiedlicher Gerüche beteiligt sind.":
        "Mental functions involved in distinguishing differences in smells.",
    "Mentale Funktionen, die an der Unterscheidung von Geschmackseigenschaften wie süss, sauer, salzig und bitter auf der Zunge beteiligt sind.":
        "Mental functions involved in distinguishing differences in tastes, such as sweet, sour, salty and bitter stimuli, detected by the tongue.",
    "Mentale Funktionen, die an der Differenzierung der Beschaffenheit von Oberflächen wie rau oder glatt durch Berührung beteiligt sind.":
        "Mental functions involved in distinguishing differences in texture, such as rough or smooth stimuli, detected by touch.",
    "Mentale Funktion, die am visüllen Erkennen von räumlichen Bezügen der Objekte in der Umgebung züinander oder zu einem selbst beteiligt sind.":
        "Mental function involved in distinguishing by sight the relative position of objects in the environment or in relation to oneself.",
    # b160
    "Spezifische mentale Funktionen, die im Zusammenhang mit dem formalen und inhaltlichen Ablauf des Denkens stehen.":
        "Specific mental functions related to the ideational component of the mind.",
    "Mentale Funktionen, die sich in der Geschwindigkeit des Denkprozesses äussern.":
        "Mental functions that govern speed of the thinking process.",
    "Mentale Funktionen, die Kohärenz und Logik des Denkprozesses gewährleisten (formales Denken).":
        "Mental functions that organize the thinking process as to its coherence and logic.",
    "Mentale Funktionen, die Ideen und Inhalte im Denkprozess und das, was konzeptualisiert wird, betreffen (inhaltliches Denken).":
        "Mental functions consisting of the ideas that are present in the thinking process and what is being conceptualized.",
    "Mentale Funktionen, die die willkürliche Kontrolle über das Denken beinhalten und die als solche von der Person selbst erkannt werden.":
        "Mental functions that provide volitional control of thinking and are recognized as such by the person.",
    # b164
    "Spezifische mentale Funktionen, die insbesondere von den Frontallappen des Gehirns abhängen, einschliesslich komplexe zielgerichtete Verhaltensweisen wie Entscheidungen treffen, abstrakt denken sowie einen Plan aufstellen und durchführen, mentale Flexibilität, sowie entscheiden, welche Verhaltensweisen unter welchen Umständen angemessen sind (häufig exekutive Funktionen genannt).":
        "Specific mental functions especially dependent on the frontal lobes of the brain, including complex goal-directed behaviours such as decision-making, abstract thinking, planning and carrying out plans, mental flexibility, and deciding which behaviours are appropriate under what circumstances; often called executive or frontal-lobe functions.",
    "Mentale Funktionen, die die Entwicklung von allgemeinen Vorstellungen, Qualitäten oder Charakteristiken betreffen, hervorgegangen aus und losgelöst von den konkreten Realitäten, spezifischen Gegenständen oder aktüllen Gegebenheiten.":
        "Mental functions of creating general ideas, qualities or characteristics out of, and distinct from, concrete realities, specific objects or actual instances.",
    "Mentale Funktionen, die das Zusammenfügen von Teilen zu einem Ganzen und das Systematisieren betreffen; diese mentale Funktion trägt dazu bei, eine methodische Vorgehens- oder Handlungsweise zu entwickeln.":
        "Mental functions of coordinating parts into a whole, of systematizing; the mental function involved in developing a method of proceeding or acting.",
    "Mentale Funktionen, die das Ordnen von Ereignissen in eine chronologische Reihenfolge und das Zuweisen von Zeiten zu Ereignissen und Aktivitäten betreffen.":
        "Mental functions of ordering events in a chronological sequence, allocating amounts of time to events and activities.",
    "Mentale Funktionen, die das Ändern von Strategien oder Denkansätzen betreffen, insbesondere beim Problemlösen.":
        "Mental functions of changing strategies, or shifting mental sets, especially as involved in problem-solving.",
    "Mentale Funktionen, die Bewusstsein und Verstehen der eigenen Person und des eigenen Verhaltens betreffen.":
        "Mental functions of awareness and understanding of oneself and one's behaviour.",
    "Mentale Funktionen, die daran beteiligt sind, zwischen verschiedenen Möglichkeiten zu unterscheiden und diese zu bewerten, wie solche, die an der Meinungsbildung beteiligt sind.":
        "Mental functions involved in discriminating between and evaluating different options, such as those involved in forming an opinion.",
    "Mentale Funktionen, die Identifizieren, Analysieren und Integrieren nicht übereinstimmender oder sich widersprechender Informationen in eine Lösung betreffen.":
        "Mental functions of identifying, analysing and integrating incongruent or conflicting information into a solution.",
    # b167
    "Spezifische mentale Funktionen, die das Erkennen und Verwenden von Zeichen, Symbolen und anderen Teilbereichen einer Sprache betreffen.":
        "Specific mental functions of recognizing and using signs, symbols and other components of a language.",
    "Spezifische mentale Funktionen, die Verstehen und Erfassen der Bedeutung von Mitteilungen in gesprochener, geschriebener, symbolisierter oder anderer Form betreffen.":
        "Specific mental functions of decoding messages in spoken, written or other forms, such as sign language, to obtain their meaning.",
    "Mentale Funktionen, die Verstehen und Erfassen der Bedeutung von gesprochenen Mitteilungen betreffen.":
        "Mental functions of decoding spoken messages to obtain their meaning.",
    "Mentale Funktionen, die Verstehen und Erfassen der Bedeutung von schriftlichen Mitteilungen betreffen.":
        "Mental functions of decoding written messages to obtain their meaning.",
    "Mentale Funktionen, die das Verstehen und Erfassen der Bedeutung von Mitteilungen in Sprachen, die mittels Hand- und anderen Bewegungen erzeugte Zeichen benutzen, betreffen.":
        "Mental functions of decoding messages in languages that use signs made by hands and other movements, to obtain their meaning.",
    "Spezifische mentale Funktionen, die notwendig sind, um sinnvolle Mitteilungen in gesprochener, geschriebener, symbolischer oder anderer Form zu produzieren.":
        "Specific mental functions necessary to produce meaningful messages in spoken, written, signed or other forms of language.",
    "Mentale Funktionen, die notwendig sind, in der gesprochenen Sprache sinnvolle Mitteilungen auszudrücken.":
        "Mental functions necessary to produce meaningful spoken messages.",
    "Mentale Funktionen, die notwendig sind, schriftsprachlich sinnvolle Mitteilungen zu verfassen.":
        "Mental functions necessary to produce meaningful written messages.",
    "Mentale Funktionen, die notwendig sind, sinnvolle Mitteilungen in Sprachen auszudrücken, die mittels Hand- und anderen Bewegungen erzeugte Zeichen verwenden.":
        "Mental functions necessary to produce meaningful messages in languages that use signs made by hands and other movements.",
}

# Build inclusion translations
incl_map = {
    "Funktionen, die Zustand, Kontinuität und Qualität des Bewusstseins betreffen": "Functions of the state, continuity and quality of consciousness",
    "Bewusstseinsverlust, Koma, vegetativer Status (Apallisches Syndrom)": "Loss of consciousness, coma, vegetative states",
    "Dämmerzustand (Fugü), Trance, Besessenheit": "Fugue, trance states, possession states",
    "Drogeninduzierte Bewusstseinsveränderungen, Delir, Stupor": "Drug-induced altered consciousness, delirium, stupor",
    "Funktionen der Orientierung zu Zeit, Ort und Person": "Functions of orientation to time, place and person",
    "Funktionen der Orientierung zur eigenen Person und zu anderen Personen": "Functions of orientation to self and others",
    "Desorientierung zu Zeit, Ort und Person": "Disorientation to time, place and person",
    "Die Intelligenzentwicklung betreffende Funktionen": "Functions of intellectual growth",
    "Intellektülle und mentale Retardierung, Demenz": "Intellectual disability, mental retardation, dementia",
    "Störungen wie bei Autismus": "Conditions such as autism",
    "Funktionen, die Extraversion, Introversion, Umgänglichkeit, Gewissenhaftigkeit betreffen": "Functions of extraversion, introversion, agreeableness, conscientiousness",
    "Psychische und emotionale Stabilität, Offenheit gegenüber Erfahrungen": "Psychic and emotional stability, openness to experience",
    "Optimismus, Neugier, Vertrauen und Zuverlässigkeit": "Optimism, novelty seeking, confidence, trustworthiness",
    "Funktionen, die psychische Energie, Motivation, Appetit betreffen": "Functions of energy level, motivation, appetite",
    "Sucht (einschliesslich Sucht nach Substanzen, die zu einer Abhängigkeit führen)": "Craving (including craving for substances that can be abused)",
    "Impulskontrolle": "Impulse control",
    "Funktionen, die Schlafdauer, Schlafbeginn betreffen": "Functions of amount of sleep, onset of sleep",
    "Aufrechterhaltung des Schlafs, Schlafqualität, Schlafzyklus": "Maintenance of sleep, quality of sleep, functions involving the sleep cycle",
    "Insomnie, Hypersomnie, Narkolepsie": "Insomnia, hypersomnia and narcolepsy",
    "Daueraufmerksamkeit": "Sustaining attention",
    "Wechsel der Aufmerksamkeit": "Shifting attention",
    "Geteilte Aufmerksamkeit": "Dividing attention",
    "Mit anderen geteilte Aufmerksamkeit": "Sharing attention",
    "Konzentration": "Concentration",
    "Ablenkbarkeit": "Distractibility",
    "Kurzzeitgedächtnis und Langzeitgedächtnis": "Functions of short-term and long-term memory",
    "Sofort-, Frisch- und Altgedächtnis": "Immediate, recent and remote memory",
    "Gedächtnisspanne und Abrufen": "Memory span, retrieval of memory",
    "Funktionen beim Wiedererkennen und Lernen": "Remembering; functions used in recalling and learning",
    "Nominale, selektive und dissoziative Amnesie": "Nominal, selective and dissociative amnesia",
    "Psychomotorische Kontrolle": "Functions of psychomotor control",
    "Psychomotorische Retardierung": "Psychomotor retardation",
    "Erregung und Agitiertheit": "Excitement and agitation",
    "Katatonie, Negativismus, Ambitendenz": "Catatonia, negativism, ambitendency",
    "Echopraxie und Echolalie": "Echopraxia and echolalia",
    "Qualität der psychomotorischen Funktionen": "Quality of psychomotor function",
    "(Situations)Angemessenheit der Emotion": "Appropriateness of emotion",
    "Affektive Kontrolle und Schwingungsfähigkeit": "Regulation and range of emotion",
    "Affekt": "Affect",
    "Trauer, Glück, Liebe, Furcht, Ärger, Hass": "Sadness, happiness, love, fear, anger, hate",
    "Anspannung, Angst, Freude, Sorgen": "Tension, anxiety, joy, sorrow",
    "Emotionale Labilität": "Lability of emotion",
    "Affektverflachung": "Flattening of affect",
    "Visülle Wahrnehmung": "Visual perception",
    "Auditive Wahrnehmung": "Auditory perception",
    "Olfaktorische Wahrnehmung": "Olfactory perception",
    "Gustatorische Wahrnehmung": "Gustatory perception",
    "Taktile Wahrnehmung": "Tactile perception",
    "Räumlich-visülle Wahrnehmung": "Visuospatial perception",
    "Halluzination oder Illusion": "Hallucination or illusion",
    "Tempo des Denkens": "Pace of thought",
    "Form des Denkens": "Form of thought",
    "Kontrolle des Denkens": "Control of thought",
    "Inhalt des Denkens": "Content of thought",
    "Zielgerichtetes und nicht zielgerichtetes Denken": "Goal-directed and non-goal-directed thought functions",
    "Logisches Denken": "Logically coherent thought functions",
    "Gedankendruck, Ideenflüechtigkeit": "Pressured thinking, flight of ideas",
    "Denkhemmung, inkohärentes Denken": "Thought block, incoherence of thought",
    "Vorbeidenken/Vorbeireden": "Tangentiality",
    "Umständliches Denken": "Circumstantiality",
    "Wahn, Zwangsgedanken, Zwangshandlungen": "Delusions, obsessions and compulsions",
    "Perseveration": "Ideational perseveration",
    "Umständlichkeit": "Circumstantiality",
    "Wahn": "Delusions",
    "Überwertige Ideen": "Overvalued ideas",
    "Somatisierung": "Somatization",
    "Deja-vu-Erleben": "Deja vu experience",
    "Zwang": "Obsessions",
    "Gedankenbeeinflussung": "Thought influence",
    "Gedankeneingebung": "Thought insertion",
    "Abstraktionsvermögen und Ordnen von Ideen": "Functions of abstraction and organization of ideas",
    "Zeitmanagement": "Time management",
    "Einsichts- und Urteilsvermögen": "Insight and judgement",
    "Konzeptbildung": "Concept formation",
    "Kategorisierung": "Categorization",
    "Kognitive Flexibilität": "Cognitive flexibility",
    "Depersonalisation, Derealisation": "Depersonalization, derealization",
}

def translate_incl_item(item):
    """Translate an inclusion/exclusion item."""
    if item in incl_map:
        return incl_map[item]
    # Try to find code reference and replace with English title
    m = re.search(r'\(([bsde]\d+)\)', item)
    if m:
        code = m.group(1)
        if code in en_map:
            return f"{en_map[code]} ({code})"
    # Try range references like (b210-b229)
    m = re.search(r'\(([bsde]\d+)-([bsde]\d+)\)', item)
    if m:
        c1, c2 = m.group(1), m.group(2)
        return f"{en_map.get(c1, c1)}-{en_map.get(c2, c2)} ({c1}-{c2})"
    # Chapter references
    m = re.search(r'Kapitel\s+([bsde]\d)', item)
    if m:
        code = m.group(1)
        if code in en_map:
            return f"{en_map[code]} (Chapter {code})"
    return item

def translate_desc(desc):
    """Translate a description using the translations dict."""
    if not desc:
        return ""
    if desc in translations:
        return translations[desc]
    return desc  # Return original if no translation found

# Build output
details_en = {}
for code in details_de:
    de = details_de[code]
    en_title = en_map.get(code, de["title"])
    en_desc = translate_desc(de.get("description", ""))
    en_incl = [translate_incl_item(i) for i in de.get("inclusions", [])]
    en_excl = [translate_incl_item(i) for i in de.get("exclusions", [])]

    details_en[code] = {
        "title": en_title,
        "description": en_desc,
        "inclusions": en_incl,
        "exclusions": en_excl
    }

with open('/Users/mirkorichter/Desktop/icf_app/assets/data/icf_details_en.json', 'w', encoding='utf-8') as f:
    json.dump(details_en, f, indent=2, ensure_ascii=False)

# Stats
total = len(details_en)
empty = sum(1 for v in details_en.values() if not v["description"])
translated = sum(1 for c, v in details_en.items()
                 if v["description"] and v["description"] != details_de[c].get("description",""))
remaining = total - empty - translated
print(f"Total: {total}, Empty desc: {empty}, Translated: {translated}, German remaining: {remaining}")
