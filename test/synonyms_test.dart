import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

/// Stellt sicher, dass jeder Code im Synonym-Lexikon tatsächlich in den
/// ICF-Daten existiert — sonst zeigen Suchtreffer ins Leere.
void main() {
  group('Synonym-Lexikon', () {
    for (final (codesFile, synonymsFile) in [
      ('icf_codes.json', 'icf_synonyms.json'),
      ('icf_codes_en.json', 'icf_synonyms_en.json'),
    ]) {
      test('$synonymsFile verweist nur auf existierende Codes', () {
        final codes = (json.decode(
                File('assets/data/$codesFile').readAsStringSync())
            as Map<String, dynamic>)['codes'] as Map<String, dynamic>;
        final synonyms = json.decode(
                File('assets/data/$synonymsFile').readAsStringSync())
            as Map<String, dynamic>;

        expect(synonyms, isNotEmpty);
        for (final entry in synonyms.entries) {
          final targets = (entry.value as List<dynamic>).cast<String>();
          expect(targets, isNotEmpty,
              reason: 'Synonym "${entry.key}" hat keine Codes');
          for (final code in targets) {
            expect(codes.containsKey(code), isTrue,
                reason:
                    'Synonym "${entry.key}" verweist auf unbekannten Code "$code"');
          }
        }
      });
    }
  });
}
