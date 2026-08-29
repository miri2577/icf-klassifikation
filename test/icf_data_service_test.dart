import 'package:flutter_test/flutter_test.dart';
import 'package:icf_app/models/icf_detail.dart';
import 'package:icf_app/services/icf_data_service.dart';

void main() {
  group('IcfDataService.normalize', () {
    test('Kleinschreibung und Umlaute', () {
      expect(IcfDataService.normalize('Gedächtnis'), 'gedaechtnis');
      expect(IcfDataService.normalize('HÖREN'), 'hoeren');
      expect(IcfDataService.normalize('Füße'), 'fuesse');
      expect(IcfDataService.normalize('b110'), 'b110');
    });

    test('bereits umschriebene Eingabe bleibt stabil', () {
      expect(IcfDataService.normalize('gedaechtnis'), 'gedaechtnis');
    });
  });

  group('IcfDetail', () {
    test('fromJson erstellt korrekte Instanz', () {
      final json = {
        'title': 'Test Titel',
        'description': 'Test Beschreibung',
        'inclusions': ['Inkl 1', 'Inkl 2'],
        'exclusions': ['Exkl 1'],
      };

      final detail = IcfDetail.fromJson(json);

      expect(detail.title, 'Test Titel');
      expect(detail.description, 'Test Beschreibung');
      expect(detail.inclusions, ['Inkl 1', 'Inkl 2']);
      expect(detail.exclusions, ['Exkl 1']);
    });

    test('fromJson mit fehlenden Feldern', () {
      final json = {'title': 'Nur Titel'};
      final detail = IcfDetail.fromJson(json);

      expect(detail.title, 'Nur Titel');
      expect(detail.description, '');
      expect(detail.inclusions, isEmpty);
      expect(detail.exclusions, isEmpty);
    });

    test('toJson roundtrip', () {
      const detail = IcfDetail(
        title: 'Test',
        description: 'Beschreibung',
        inclusions: ['A', 'B'],
        exclusions: ['C'],
      );

      final json = detail.toJson();
      final restored = IcfDetail.fromJson(json);

      expect(restored.title, detail.title);
      expect(restored.description, detail.description);
      expect(restored.inclusions, detail.inclusions);
      expect(restored.exclusions, detail.exclusions);
    });
  });
}
