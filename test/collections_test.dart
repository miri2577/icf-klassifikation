import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:icf_app/models/code_collection.dart';
import 'package:icf_app/services/collections_service.dart';
import 'package:icf_app/services/search_history_service.dart';
import 'package:icf_app/services/qualifier_memory_service.dart';

void main() {
  group('CollectionsService', () {
    late CollectionsService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      service = CollectionsService(prefs);
    });

    test('create legt Sammlung an', () async {
      final c = await service.create('Fall A');
      expect(service.getAll().length, 1);
      expect(service.getAll().first.name, 'Fall A');
      expect(c.id, isNotEmpty);
    });

    test('addEntry fügt hinzu und ersetzt bei gleichem Code', () async {
      final c = await service.create('Test');
      await service.addEntry(
          c.id, const CollectionEntry(code: 'b144', qualifier: '.2'));
      await service.addEntry(
          c.id,
          const CollectionEntry(
              code: 'b144', qualifier: '.3', note: 'aktualisiert'));
      final entries = service.getAll().first.entries;
      expect(entries.length, 1);
      expect(entries.first.qualifier, '.3');
      expect(entries.first.note, 'aktualisiert');
      expect(entries.first.qualifiedCode, 'b144.3');
    });

    test('removeEntry und delete', () async {
      final c = await service.create('Test');
      await service.addEntry(c.id, const CollectionEntry(code: 'd450'));
      await service.removeEntry(c.id, 'd450');
      expect(service.getAll().first.entries, isEmpty);
      await service.delete(c.id);
      expect(service.getAll(), isEmpty);
    });

    test('rename ändert Namen', () async {
      final c = await service.create('Alt');
      await service.rename(c.id, 'Neu');
      expect(service.getAll().first.name, 'Neu');
    });

    test('Export/Import-Roundtrip', () async {
      final c = await service.create('Fall A');
      await service.addEntry(
          c.id,
          const CollectionEntry(
              code: 'b144', qualifier: '.2', note: 'Notiz'));
      final exported = service.exportJson(['b110', 'd450']);

      SharedPreferences.setMockInitialValues({});
      final prefs2 = await SharedPreferences.getInstance();
      final service2 = CollectionsService(prefs2);
      final (count, favorites) = await service2.importJson(exported);

      expect(count, 1);
      expect(favorites, ['b110', 'd450']);
      final imported = service2.getAll().first;
      expect(imported.name, 'Fall A');
      expect(imported.entries.first.qualifiedCode, 'b144.2');
      expect(imported.entries.first.note, 'Notiz');
    });

    test('Import bei Namenskollision hängt Suffix an', () async {
      await service.create('Fall A');
      final exported = service.exportJson([]);
      final (count, _) = await service.importJson(exported);
      expect(count, 1);
      final names = service.getAll().map((c) => c.name).toList();
      expect(names, containsAll(['Fall A', 'Fall A (2)']));
    });

    test('Import lehnt fremdes JSON ab', () async {
      expect(
        () => service.importJson('{"app": "andere_app"}'),
        throwsFormatException,
      );
    });

    test('toCsv escaped Anführungszeichen', () {
      final collection = CodeCollection(
        id: 'x',
        name: 'Test',
        entries: const [
          CollectionEntry(code: 'b144', qualifier: '.2', note: 'mit "Zitat"'),
        ],
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );
      final csv =
          CollectionsService.toCsv(collection, (c) => 'Gedächtnis');
      expect(csv, contains('"b144";".2";"Gedächtnis";"mit ""Zitat"""'));
    });
  });

  group('SearchHistoryService', () {
    late SearchHistoryService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      service = SearchHistoryService(prefs);
    });

    test('addQuery dedupliziert und begrenzt auf 10', () async {
      for (var i = 0; i < 12; i++) {
        await service.addQuery('begriff$i');
      }
      expect(service.getQueries().length, 10);
      expect(service.getQueries().first, 'begriff11');

      await service.addQuery('begriff5');
      expect(service.getQueries().first, 'begriff5');
      expect(
          service.getQueries().where((q) => q == 'begriff5').length, 1);
    });

    test('zu kurze Queries werden ignoriert', () async {
      await service.addQuery('a');
      expect(service.getQueries(), isEmpty);
    });
  });

  group('QualifierMemoryService', () {
    test('merkt und löscht Qualifier', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final service = QualifierMemoryService(prefs);

      await service.set('b144', '.2');
      expect(service.get('b144'), '.2');
      await service.set('b144', '');
      expect(service.get('b144'), '');
    });
  });
}
