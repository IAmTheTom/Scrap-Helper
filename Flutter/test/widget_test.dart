import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/app.dart';

void main() {
  testWidgets('shows first usable dashboard', (tester) async {
    await tester.pumpWidget(const ScrapHelperApp());

    expect(find.text('Scrap Helper'), findsOneWidget);
    expect(find.text('Field Dashboard'), findsOneWidget);
    expect(find.text('Update Yard Prices'), findsOneWidget);
    expect(find.text('Evaluate an Object'), findsOneWidget);
    expect(find.text('Current Load'), findsOneWidget);
  });
}
