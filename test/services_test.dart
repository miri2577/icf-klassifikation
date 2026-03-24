import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:icf_app/services/favorites_service.dart';
import 'package:icf_app/services/history_service.dart';

void main() {
  group('FavoritesService', () {
    late FavoritesService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      service = FavoritesService(prefs);
    });

    test('initial favorites ist leer', () {
      expect(service.getFavorites(), isEmpty);
    });

    test('toggleFavorite fügt hinzu und entfernt', () async {
      await service.toggleFavorite('b110');
      expect(service.isFavorite('b110'), isTrue);
      expect(service.getFavorites(), ['b110']);

      await service.toggleFavorite('b110');
      expect(service.isFavorite('b110'), isFalse);
      expect(service.getFavorites(), isEmpty);
    });

    test('mehrere Favoriten', () async {
      await service.toggleFavorite('b110');
      await service.toggleFavorite('d450');
      await service.toggleFavorite('e120');

      expect(service.getFavorites(), ['b110', 'd450', 'e120']);
      expect(service.isFavorite('d450'), isTrue);
      expect(service.isFavorite('s710'), isFalse);
    });

    test('clearAll entfernt alle', () async {
      await service.toggleFavorite('b110');
      await service.toggleFavorite('d450');
      await service.clearAll();

      expect(service.getFavorites(), isEmpty);
    });
  });

  group('HistoryService', () {
    late HistoryService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      service = HistoryService(prefs);
    });

    test('initial history ist leer', () {
      expect(service.getHistory(), isEmpty);
    });

    test('addToHistory fügt am Anfang ein', () async {
      await service.addToHistory('b110');
      await service.addToHistory('d450');

      expect(service.getHistory(), ['d450', 'b110']);
    });

    test('doppelter Eintrag wird nach vorne verschoben', () async {
      await service.addToHistory('b110');
      await service.addToHistory('d450');
      await service.addToHistory('b110');

      expect(service.getHistory(), ['b110', 'd450']);
    });

    test('maximal 20 Einträge', () async {
      for (int i = 0; i < 25; i++) {
        await service.addToHistory('code_$i');
      }

      final history = service.getHistory();
      expect(history.length, 20);
      expect(history.first, 'code_24');
    });

    test('clearHistory entfernt alles', () async {
      await service.addToHistory('b110');
      await service.clearHistory();

      expect(service.getHistory(), isEmpty);
    });
  });
}
