import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/icf_detail.dart';

class IcfDataService {
  Map<String, String> _domains = {};
  Map<String, String> _codes = {};
  Map<String, String> _qualifierScale = {};
  Map<String, String> _environmentalQualifiers = {};
  Map<String, IcfDetail> _details = {};

  // Vorberechnete normalisierte Texte für die Suche
  Map<String, String> _normalizedTitles = {};
  Map<String, String> _normalizedDetails = {};

  // Synonym-Lexikon: normalisierter Alltagsbegriff -> ICF-Codes
  Map<String, List<String>> _synonyms = {};

  bool _loaded = false;
  String _currentLocale = 'de';

  Map<String, String> get domains => _domains;
  Map<String, String> get codes => _codes;
  Map<String, String> get qualifierScale => _qualifierScale;
  Map<String, String> get environmentalQualifiers => _environmentalQualifiers;
  Map<String, IcfDetail> get details => _details;
  bool get isLoaded => _loaded;
  String get currentLocale => _currentLocale;

  Future<void> loadData({String locale = 'de'}) async {
    final suffix = locale == 'de' ? '' : '_$locale';

    try {
      final codesJson =
          await rootBundle.loadString('assets/data/icf_codes$suffix.json');
      final codesData = json.decode(codesJson) as Map<String, dynamic>;

      _domains = Map<String, String>.from(codesData['domains'] as Map);
      _codes = Map<String, String>.from(codesData['codes'] as Map);
      _qualifierScale =
          Map<String, String>.from(codesData['qualifierScale'] as Map);
      _environmentalQualifiers =
          Map<String, String>.from(codesData['environmentalQualifiers'] as Map);

      final detailsJson =
          await rootBundle.loadString('assets/data/icf_details$suffix.json');
      final detailsData = json.decode(detailsJson) as Map<String, dynamic>;

      _details = detailsData.map(
        (key, value) =>
            MapEntry(key, IcfDetail.fromJson(value as Map<String, dynamic>)),
      );
    } catch (_) {
      // Fallback to German if locale-specific files don't exist
      if (locale != 'de') {
        await loadData(locale: 'de');
        _currentLocale = locale; // Keep the locale setting even with DE data
        return;
      }
      rethrow;
    }

    await _loadSynonyms(suffix);

    _currentLocale = locale;
    _buildSearchIndex();
    _loaded = true;
  }

  Future<void> _loadSynonyms(String suffix) async {
    _synonyms = {};
    try {
      final raw = await rootBundle
          .loadString('assets/data/icf_synonyms$suffix.json');
      final data = json.decode(raw) as Map<String, dynamic>;
      data.forEach((key, value) {
        _synonyms[normalize(key)] =
            (value as List<dynamic>).map((e) => e as String).toList();
      });
    } catch (_) {
      // Synonyme sind optional — ohne Datei einfach leer lassen.
    }
  }

  Future<void> switchLocale(String locale) async {
    if (locale == _currentLocale && _loaded) return;
    _loaded = false;
    await loadData(locale: locale);
  }

  /// Kleinschreibung + Umlaut-Normalisierung, damit z.B. "gedaechtnis"
  /// auch "Gedächtnis" findet (und umgekehrt).
  static String normalize(String s) {
    return s
        .toLowerCase()
        .replaceAll('ä', 'ae')
        .replaceAll('ö', 'oe')
        .replaceAll('ü', 'ue')
        .replaceAll('ß', 'ss');
  }

  void _buildSearchIndex() {
    _normalizedTitles = {
      for (final e in _codes.entries) e.key: normalize(e.value),
    };
    _normalizedDetails = {};
    for (final e in _details.entries) {
      final d = e.value;
      _normalizedDetails[e.key] = normalize(
        '${d.description} ${d.inclusions.join(' ')} ${d.exclusions.join(' ')}',
      );
    }
  }

  List<String> getChapters(String domain) {
    return _codes.keys
        .where((code) => code.startsWith(domain) && code.length == 2)
        .toList();
  }

  List<String> getChildren(String parentCode) {
    return _codes.keys
        .where((code) =>
            code.startsWith(parentCode) &&
            code.length == parentCode.length + 1)
        .toList();
  }

  List<String> getAllDescendants(String parentCode) {
    return _codes.keys
        .where((code) =>
            code.startsWith(parentCode) && code.length > parentCode.length)
        .toList();
  }

  String? getTitle(String code) => _codes[code];

  String? getParentCode(String code) {
    if (code.length <= 1) return null;
    if (code.length == 2) return code[0];
    for (int len = code.length - 1; len >= 2; len--) {
      final parent = code.substring(0, len);
      if (_codes.containsKey(parent)) return parent;
    }
    return code.substring(0, 2);
  }

  IcfDetail? getDetail(String code) => _details[code];

  /// Liefert die Codes, auf die das Synonym-Lexikon für [q] verweist.
  /// Ein Synonym greift, wenn der Suchbegriff den Lexikon-Schlüssel
  /// anschneidet (Präfix in beide Richtungen), z.B. "rollst" -> "rollstuhl".
  Set<String> _synonymHits(String q) {
    final hits = <String>{};
    for (final entry in _synonyms.entries) {
      if (entry.key.startsWith(q) || q.startsWith(entry.key)) {
        hits.addAll(entry.value);
      }
    }
    return hits;
  }

  /// Sucht in Codes, Titeln, Synonymen und Detailtexten (Beschreibung,
  /// Inkl./Exkl.). Ergebnisse sind nach Relevanz sortiert: exakter Code,
  /// Code-Präfix, Wortanfang im Titel, Titel-Treffer, Synonym-Treffer,
  /// Detailtext-Treffer.
  List<MapEntry<String, String>> search(String query) {
    if (query.isEmpty) return [];
    final q = normalize(query.trim());
    if (q.isEmpty) return [];

    final synonymHits = q.length >= 3 ? _synonymHits(q) : const <String>{};

    final scored = <(String, int)>[];
    for (final code in _codes.keys) {
      final normCode = code.toLowerCase();
      final title = _normalizedTitles[code] ?? '';
      int? score;
      if (normCode == q) {
        score = 0;
      } else if (normCode.startsWith(q)) {
        score = 1;
      } else if (normCode.contains(q)) {
        score = 2;
      } else if (title.startsWith(q) || title.contains(' $q')) {
        score = 3;
      } else if (title.contains(q)) {
        score = 4;
      } else if (synonymHits.contains(code)) {
        score = 5;
      } else if (_normalizedDetails[code]?.contains(q) ?? false) {
        score = 6;
      }
      if (score != null) scored.add((code, score));
    }

    scored.sort((a, b) {
      final byScore = a.$2.compareTo(b.$2);
      return byScore != 0 ? byScore : a.$1.compareTo(b.$1);
    });
    return scored.map((e) => MapEntry(e.$1, _codes[e.$1]!)).toList();
  }

  Map<String, String> getCodesForDomain(String domainPrefix) {
    return Map.fromEntries(
      _codes.entries.where((e) => e.key.startsWith(domainPrefix)),
    );
  }

  List<MapEntry<String, String>> getCategoriesForChapter(String chapterCode) {
    return _codes.entries
        .where((e) => e.key.startsWith(chapterCode) && e.key.length == 4)
        .toList();
  }

  List<MapEntry<String, String>> getSubCategories(String categoryCode) {
    return _codes.entries
        .where((e) =>
            e.key.startsWith(categoryCode) &&
            e.key.length > categoryCode.length)
        .toList();
  }
}
