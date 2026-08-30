import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

/// Jedes Core Set darf nur auf Codes verweisen, die im jeweiligen
/// Datenbestand existieren — sonst zeigt die App leere Einträge.
void main() {
  group('Core Sets', () {
    for (final (codesFile, coreSetsFile) in [
      ('assets/data/icf_codes.json', 'assets/data/icf_core_sets.json'),
      ('assets/data/icf_codes_en.json', 'assets/data/icf_core_sets_en.json'),
    ]) {
      test('$coreSetsFile verweist nur auf existierende Codes', () {
        final codes = (json.decode(File(codesFile).readAsStringSync())
            as Map<String, dynamic>)['codes'] as Map<String, dynamic>;
        final sets = json.decode(File(coreSetsFile).readAsStringSync())
            as List<dynamic>;

        expect(sets, isNotEmpty);
        for (final set in sets) {
          final map = set as Map<String, dynamic>;
          final setCodes = map['codes'] as List<dynamic>;
          expect(setCodes, isNotEmpty,
              reason: 'Core Set ${map['id']} ist leer');
          expect(setCodes.toSet().length, setCodes.length,
              reason: 'Core Set ${map['id']} enthält Duplikate');
          for (final code in setCodes) {
            expect(codes.containsKey(code), isTrue,
                reason:
                    'Core Set ${map['id']}: Code $code fehlt in $codesFile');
          }
        }
      });
    }

    test('de und en enthalten dieselben Sets mit denselben Codes', () {
      final de = json.decode(
              File('assets/data/icf_core_sets.json').readAsStringSync())
          as List<dynamic>;
      final en = json.decode(
              File('assets/data/icf_core_sets_en.json').readAsStringSync())
          as List<dynamic>;
      expect(de.length, en.length);
      for (var i = 0; i < de.length; i++) {
        expect((de[i] as Map)['id'], (en[i] as Map)['id']);
        expect((de[i] as Map)['codes'], (en[i] as Map)['codes']);
      }
    });
  });
}
