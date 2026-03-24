import 'package:flutter_test/flutter_test.dart';
import 'package:icf_app/models/icf_detail.dart';

void main() {
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
