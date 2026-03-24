import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/icf_detail.dart';

class IcfDataService {
  Map<String, String> _domains = {};
  Map<String, String> _codes = {};
  Map<String, String> _qualifierScale = {};
  Map<String, String> _environmentalQualifiers = {};
  Map<String, IcfDetail> _details = {};

  // Pre-built search index
  Map<String, List<String>> _searchIndex = {};

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

    _currentLocale = locale;
    _buildSearchIndex();
    _loaded = true;
  }

  Future<void> switchLocale(String locale) async {
    if (locale == _currentLocale && _loaded) return;
    _loaded = false;
    await loadData(locale: locale);
  }

  void _buildSearchIndex() {
    _searchIndex = {};
    for (final entry in _codes.entries) {
      final terms = <String>{
        entry.key.toLowerCase(),
        ...entry.value.toLowerCase().split(RegExp(r'\s+')),
      };
      for (final term in terms) {
        if (term.length < 2) continue;
        _searchIndex.putIfAbsent(term, () => []).add(entry.key);
      }
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

  List<MapEntry<String, String>> search(String query) {
    if (query.isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    final results = <String>{};

    for (final code in _codes.keys) {
      if (code.toLowerCase().contains(lowerQuery)) {
        results.add(code);
      }
    }

    for (final entry in _codes.entries) {
      if (entry.value.toLowerCase().contains(lowerQuery)) {
        results.add(entry.key);
      }
    }

    return results.map((code) => MapEntry(code, _codes[code]!)).toList();
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
