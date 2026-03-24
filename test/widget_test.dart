import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icf_app/l10n/app_localizations.dart';
import 'package:icf_app/providers/icf_providers.dart';
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
  });
}
