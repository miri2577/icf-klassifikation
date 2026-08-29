import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Merkt sich pro ICF-Code den zuletzt im Qualifier-Builder gewählten
/// Qualifier-Suffix (z.B. ".2" oder "+3"), damit er beim erneuten Öffnen
/// der Detailseite wiederhergestellt wird.
class QualifierMemoryService {
  static const _key = 'icf_qualifier_memory';
  final SharedPreferences _prefs;

  QualifierMemoryService(this._prefs);

  Map<String, String> _load() {
    final raw = _prefs.getString(_key);
    if (raw == null || raw.isEmpty) return {};
    try {
      return Map<String, String>.from(json.decode(raw) as Map);
    } catch (_) {
      return {};
    }
  }

  String get(String code) => _load()[code] ?? '';

  Future<void> set(String code, String qualifier) async {
    final map = _load();
    if (qualifier.isEmpty) {
      map.remove(code);
    } else {
      map[code] = qualifier;
    }
    await _prefs.setString(_key, json.encode(map));
  }
}
