import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:scrap_helper/main.dart' as app;

import 'test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('core Scrap Helper workflow', (tester) async {
    await app.main();
    await tester.pumpAndSettle(const Duration(seconds: 15));

    // --------------------------------------------------------
    // Primary navigation
    // --------------------------------------------------------

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Pickups'), findsOneWidget);
    expect(find.text('Load'), findsOneWidget);
    expect(find.text('Objects'), findsOneWidget);
    expect(find.text('Storage'), findsOneWidget);

    // --------------------------------------------------------
    // Object Library
    // --------------------------------------------------------

    await selectBottomDestination(tester, 'Objects');

    expect(find.text('Object Library'), findsOneWidget);
    expect(find.byType(SearchBar), findsOneWidget);

    final searchField = find.byType(SearchBar);

    await tester.enterText(searchField, 'Microwave');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final microwaveTile = find.widgetWithText(ListTile, 'Microwave');

    expect(microwaveTile, findsOneWidget);

    await tester.ensureVisible(microwaveTile);
    await tester.tap(microwaveTile);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Microwave'), findsWidgets);

    final addButton = find.text('Add to Current Load');

    await tester.scrollUntilVisible(
      addButton,
      250,
      scrollable: find.byType(Scrollable).last,
    );

    await tester.pump(const Duration(milliseconds: 500));

    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pump(const Duration(seconds: 1));

    expect(find.textContaining('added to current load'), findsOneWidget);

    // Return to the main shell.
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Verify that the Load destination itself still opens.
    await selectBottomDestination(tester, 'Load');

    expect(find.text('Current Load'), findsWidgets);

    // --------------------------------------------------------
    // Pickup workflow
    // --------------------------------------------------------

    await selectBottomDestination(tester, 'Pickups');

    final addPickup = find.text('Add Pickup');
    expect(addPickup, findsWidgets);

    await tapVisible(tester, addPickup);

    expect(find.text('New Pickup Opportunity'), findsOneWidget);

    expect(find.text('Object Library item'), findsOneWidget);

    await enterLabeledText(
      tester,
      'Pickup title',
      'Integration Test Microwave Pickup',
    );

    await enterLabeledText(tester, 'Round-trip miles', '2');

    await enterLabeledText(tester, 'Estimated low payout', '8');

    await enterLabeledText(tester, 'Estimated likely payout', '12');

    await enterLabeledText(tester, 'Estimated high payout', '16');

    await enterLabeledText(tester, 'Estimated processing minutes', '20');

    final saveOpportunity = find.text('Save Opportunity');

    await tester.scrollUntilVisible(
      saveOpportunity,
      250,
      scrollable: find.byType(Scrollable).last,
    );

    await tester.tap(saveOpportunity);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Integration Test Microwave Pickup'), findsWidgets);

    // --------------------------------------------------------
    // Utility menu and reports
    // --------------------------------------------------------

    await selectBottomDestination(tester, 'Dashboard');

    final utilityMenu = find.byType(PopupMenuButton<String>);

    expect(utilityMenu, findsOneWidget);

    await tester.tap(utilityMenu);
    await tester.pumpAndSettle();

    expect(find.text('Reports'), findsOneWidget);

    await tester.tap(find.text('Reports'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Last 7 Days'), findsOneWidget);
    expect(find.text('This Month'), findsOneWidget);
  });
}
