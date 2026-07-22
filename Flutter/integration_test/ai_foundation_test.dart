import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:scrap_helper/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('opens item advisor and returns structured result', (
    tester,
  ) async {
    await app.main();
    await tester.pumpAndSettle(const Duration(seconds: 15));

    final utilityMenu = find.byType(PopupMenuButton<String>);
    expect(utilityMenu, findsOneWidget);
    await tester.tap(utilityMenu);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Item Advisor'));
    await tester.pumpAndSettle();

    expect(find.text('Item Advisor'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('ai_item_description')),
      'Countertop microwave with intact power cord',
    );

    await tester.tap(find.byKey(const Key('analyze_item_button')));
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.byKey(const Key('ai_analysis_result')), findsOneWidget);
    expect(find.text('Microwave'), findsOneWidget);
    expect(find.textContaining('Deterministic estimate'), findsOneWidget);
  });
}
