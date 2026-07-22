import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:scrap_helper/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('item advisor exposes local photo workflow', (tester) async {
    await app.main();
    await tester.pumpAndSettle(const Duration(seconds: 15));

    final utilityMenu = find.byType(PopupMenuButton<String>);
    expect(utilityMenu, findsOneWidget);

    await tester.tap(utilityMenu);
    await tester.pumpAndSettle();

    final itemAdvisor = find.text('Item Advisor');
    expect(itemAdvisor, findsOneWidget);

    await tester.tap(itemAdvisor);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('item_image_input')), findsOneWidget);
    expect(find.byKey(const Key('choose_item_photo')), findsOneWidget);
    expect(find.text('No item photo selected'), findsOneWidget);

    final description = find.byKey(const Key('ai_item_description'));

    expect(description, findsOneWidget);

    await tester.enterText(
      description,
      'Countertop microwave with intact power cord',
    );
    await tester.pump();

    final analyzeButton = find.byKey(const Key('analyze_item_button'));

    expect(analyzeButton, findsOneWidget);

    await tester.ensureVisible(analyzeButton);
    await tester.pump();

    await tester.tap(analyzeButton);

    // Deterministic analysis completes synchronously except for normal frames.
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pump(const Duration(seconds: 1));

    // Scroll the visible ListView rather than attempting to locate a lazily
    // built result widget before it exists.
    final advisorList = find.byType(ListView);
    expect(advisorList, findsOneWidget);

    await tester.drag(advisorList, const Offset(0, -900));
    await tester.pump(const Duration(milliseconds: 500));

    final resultCard = find.byKey(const Key('ai_analysis_result'));

    expect(resultCard, findsOneWidget);
    expect(find.text('Microwave'), findsOneWidget);
    expect(find.textContaining('Deterministic estimate'), findsOneWidget);
  });
}
