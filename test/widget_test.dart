import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icf_app/l10n/app_localizations.dart';
import 'package:icf_app/widgets/qualifier_builder.dart';

Widget createTestApp(Widget child) {
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('de'),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  group('QualifierBuilder Widget', () {
    testWidgets('zeigt Qualifier-Builder Titel', (tester) async {
      await tester.pumpWidget(createTestApp(
        const QualifierBuilder(
          code: 'b110',
          domain: 'b',
          qualifiers: {
            '0': 'Problem nicht vorhanden',
            '1': 'Problem leicht',
          },
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Qualifier-Builder'), findsOneWidget);
      expect(find.text('b110'), findsOneWidget);
    });

    testWidgets('Qualifier auswählen aktualisiert Code', (tester) async {
      await tester.pumpWidget(createTestApp(
        const QualifierBuilder(
          code: 'b110',
          domain: 'b',
          qualifiers: {
            '0': 'Problem nicht vorhanden (0-4%)',
            '1': 'Problem leicht ausgeprägt (5-24%)',
            '3': 'Problem erheblich ausgeprägt (50-95%)',
          },
        ),
      ));
      await tester.pumpAndSettle();

      // Tap on qualifier "3"
      await tester.tap(find.text('3'));
      await tester.pumpAndSettle();

      expect(find.text('b110.3'), findsOneWidget);
    });

    testWidgets('d-Code: Leistung und Leistungsfähigkeit ergeben zwei Stellen',
        (tester) async {
      await tester.pumpWidget(createTestApp(
        SingleChildScrollView(
          child: const QualifierBuilder(
            code: 'd450',
            domain: 'd',
            qualifiers: {
              '0': 'kein Problem',
              '1': 'leicht',
              '2': 'mäßig',
            },
          ),
        ),
      ));
      await tester.pumpAndSettle();

      // Erste Stelle (Leistung) wählen: erste "2"-Chip
      await tester.tap(find.text('2').first);
      await tester.pumpAndSettle();
      expect(find.text('d450.2'), findsOneWidget);

      // Zweite Stelle (Leistungsfähigkeit) wählen: "1" in der zweiten Reihe
      await tester.tap(find.text('1').last);
      await tester.pumpAndSettle();
      expect(find.text('d450.21'), findsOneWidget);
    });

    testWidgets('s-Code: drei Stellen inkl. Art und Lokalisation',
        (tester) async {
      await tester.pumpWidget(createTestApp(
        SingleChildScrollView(
          child: const QualifierBuilder(
            code: 's730',
            domain: 's',
            qualifiers: {'0': 'kein Problem', '4': 'voll ausgeprägt'},
            natureQualifiers: {'1': 'vollständiges Fehlen'},
            locationQualifiers: {'2': 'links'},
            initialQualifier: '.41',
          ),
        ),
      ));
      await tester.pumpAndSettle();

      // initialQualifier .41 wird wiederhergestellt
      expect(find.text('s730.41'), findsOneWidget);

      // Dritte Stelle (Lokalisation "2") ergänzen
      await tester.tap(find.text('2'));
      await tester.pumpAndSettle();
      expect(find.text('s730.412'), findsOneWidget);
    });
  });
}
