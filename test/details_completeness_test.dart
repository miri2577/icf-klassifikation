import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:icf_app/services/icf_data_service.dart';

/// Als Nachschlagewerk darf kein Code ohne Beschreibung dastehen — in keiner
/// Sprache. Die lokalisierten Detaildateien sind unvollständig; der Service
/// füllt fehlende Einträge aus der deutschen Referenz auf. Diese Tests
/// sichern beides: die Vollständigkeit der deutschen Quelle und den Fallback.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // rootBundle im Test auf die echten Asset-Dateien umleiten.
  setUpAll(() {
    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) async {
      final key = utf8.decode(message!.buffer
          .asUint8List(message.offsetInBytes, message.lengthInBytes));
      final file = File(key);
      if (!file.existsSync()) return null;
      return file.readAsBytesSync().buffer.asByteData();
    });
  });

  test('Deutsche Quelle: jeder Code hat eine nichtleere Beschreibung', () {
    final codes = (json.decode(
                File('assets/data/icf_codes.json').readAsStringSync())
            as Map<String, dynamic>)['codes'] as Map<String, dynamic>;
    final details =
        json.decode(File('assets/data/icf_details.json').readAsStringSync())
            as Map<String, dynamic>;
    for (final code in codes.keys) {
      final detail = details[code] as Map<String, dynamic>?;
      expect(detail, isNotNull, reason: '$code hat keinen Details-Eintrag');
      expect((detail!['description'] as String? ?? '').trim(), isNotEmpty,
          reason: '$code hat eine leere Beschreibung');
    }
  });

  test('Fallback: nach Laden mit locale=en ist keine Beschreibung leer',
      () async {
    final service = IcfDataService();
    await service.loadData(locale: 'en');
    expect(service.details.length, service.codes.length);
    final leer = service.codes.keys
        .where((c) =>
            service.details[c] == null ||
            service.details[c]!.description.trim().isEmpty)
        .toList();
    expect(leer, isEmpty,
        reason: 'Codes ohne Beschreibung bei locale=en: '
            '${leer.take(10).toList()} (${leer.length} gesamt)');
  });
}
