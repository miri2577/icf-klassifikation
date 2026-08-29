import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/code_collection.dart';

class CollectionsService {
  static const _key = 'icf_collections';
  final SharedPreferences _prefs;

  CollectionsService(this._prefs);

  List<CodeCollection> getAll() {
    final raw = _prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = json.decode(raw) as List<dynamic>;
      return list
          .map((e) => CodeCollection.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> _saveAll(List<CodeCollection> collections) async {
    await _prefs.setString(
        _key, json.encode(collections.map((c) => c.toJson()).toList()));
  }

  Future<CodeCollection> create(String name) async {
    final all = getAll();
    final now = DateTime.now();
    final collection = CodeCollection(
      id: now.microsecondsSinceEpoch.toRadixString(36),
      name: name,
      createdAt: now,
      updatedAt: now,
    );
    all.add(collection);
    await _saveAll(all);
    return collection;
  }

  Future<void> rename(String id, String newName) async {
    final all = getAll();
    final idx = all.indexWhere((c) => c.id == id);
    if (idx == -1) return;
    all[idx] = all[idx].copyWith(name: newName, updatedAt: DateTime.now());
    await _saveAll(all);
  }

  Future<void> delete(String id) async {
    final all = getAll()..removeWhere((c) => c.id == id);
    await _saveAll(all);
  }

  /// Fügt einen Eintrag hinzu. Existiert der Code bereits in der Sammlung,
  /// wird der Eintrag (Qualifier/Notiz) aktualisiert.
  Future<void> addEntry(String collectionId, CollectionEntry entry) async {
    final all = getAll();
    final idx = all.indexWhere((c) => c.id == collectionId);
    if (idx == -1) return;
    final entries = List<CollectionEntry>.from(all[idx].entries);
    final existing = entries.indexWhere((e) => e.code == entry.code);
    if (existing >= 0) {
      entries[existing] = entry;
    } else {
      entries.add(entry);
    }
    all[idx] =
        all[idx].copyWith(entries: entries, updatedAt: DateTime.now());
    await _saveAll(all);
  }

  Future<void> updateEntry(
      String collectionId, String code, CollectionEntry entry) async {
    final all = getAll();
    final idx = all.indexWhere((c) => c.id == collectionId);
    if (idx == -1) return;
    final entries = List<CollectionEntry>.from(all[idx].entries);
    final existing = entries.indexWhere((e) => e.code == code);
    if (existing == -1) return;
    entries[existing] = entry;
    all[idx] =
        all[idx].copyWith(entries: entries, updatedAt: DateTime.now());
    await _saveAll(all);
  }

  Future<void> removeEntry(String collectionId, String code) async {
    final all = getAll();
    final idx = all.indexWhere((c) => c.id == collectionId);
    if (idx == -1) return;
    final entries = List<CollectionEntry>.from(all[idx].entries)
      ..removeWhere((e) => e.code == code);
    all[idx] =
        all[idx].copyWith(entries: entries, updatedAt: DateTime.now());
    await _saveAll(all);
  }

  /// Exportiert alle Sammlungen und Favoriten als JSON-String.
  String exportJson(List<String> favorites) {
    return const JsonEncoder.withIndent('  ').convert({
      'app': 'icf_klassifikation',
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'favorites': favorites,
      'collections': getAll().map((c) => c.toJson()).toList(),
    });
  }

  /// Importiert Sammlungen aus einem Export-JSON. Importierte Sammlungen
  /// erhalten neue IDs; bei Namensgleichheit wird ein Suffix angehängt.
  /// Gibt (Anzahl Sammlungen, importierte Favoriten) zurück.
  Future<(int, List<String>)> importJson(String raw) async {
    final data = json.decode(raw) as Map<String, dynamic>;
    if (data['app'] != 'icf_klassifikation') {
      throw const FormatException('Kein ICF-Export');
    }
    final all = getAll();
    final existingNames = all.map((c) => c.name).toSet();
    var count = 0;
    for (final item in (data['collections'] as List<dynamic>? ?? [])) {
      final imported =
          CodeCollection.fromJson(item as Map<String, dynamic>);
      var name = imported.name;
      var suffix = 2;
      while (existingNames.contains(name)) {
        name = '${imported.name} ($suffix)';
        suffix++;
      }
      existingNames.add(name);
      final now = DateTime.now();
      all.add(CodeCollection(
        id: '${now.microsecondsSinceEpoch.toRadixString(36)}$count',
        name: name,
        entries: imported.entries,
        createdAt: imported.createdAt,
        updatedAt: now,
      ));
      count++;
    }
    await _saveAll(all);
    final favorites = (data['favorites'] as List<dynamic>? ?? [])
        .map((e) => e as String)
        .toList();
    return (count, favorites);
  }

  /// Erzeugt eine CSV-Darstellung einer Sammlung (Semikolon-getrennt,
  /// Excel-freundlich für den deutschsprachigen Raum).
  static String toCsv(
      CodeCollection collection, String? Function(String) titleOf) {
    String esc(String s) => '"${s.replaceAll('"', '""')}"';
    final buffer = StringBuffer('Code;Qualifier;Titel;Notiz\r\n');
    for (final entry in collection.entries) {
      buffer.write([
        esc(entry.code),
        esc(entry.qualifier),
        esc(titleOf(entry.code) ?? ''),
        esc(entry.note),
      ].join(';'));
      buffer.write('\r\n');
    }
    return buffer.toString();
  }
}
