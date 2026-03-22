import 'package:flutter_test/flutter_test.dart';
import 'package:icf_app/main.dart';

void main() {
  testWidgets('App startet korrekt', (WidgetTester tester) async {
    await tester.pumpWidget(const IcfApp());
    expect(find.text('ICF Klassifikation'), findsOneWidget);
  });
}
