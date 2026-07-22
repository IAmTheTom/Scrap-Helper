import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:scrap_helper/main.dart' as app;

import 'test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('storage finalize receipt and utility workflow', (tester) async {
    await app.main();
    await tester.pumpAndSettle(const Duration(seconds: 15));

    await selectBottomDestination(tester, 'Storage');
    expect(find.text('Storage & Processing Queue'), findsOneWidget);

    await tapVisible(tester, find.text('Add Stored Item'));

    await enterLabeledText(
      tester,
      'Item label',
      'Integration Test Electric Motor',
    );
    await enterLabeledText(tester, 'Quantity', '2');
    await enterLabeledText(tester, 'Estimated total value', '18');
    await enterLabeledText(tester, 'Processing minutes', '25');

    await tapVisible(tester, find.text('Save Stored Item'));

    expect(
      find.textContaining('Integration Test Electric Motor'),
      findsWidgets,
    );

    await selectBottomDestination(tester, 'Dashboard');
    await selectBottomDestination(tester, 'Storage');

    expect(
      find.textContaining('Integration Test Electric Motor'),
      findsWidgets,
    );

    await selectBottomDestination(tester, 'Objects');

    final searchField = find.byType(SearchBar);
    expect(searchField, findsOneWidget);
    await tester.enterText(searchField, 'Microwave');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final microwaveTile = find.widgetWithText(ListTile, 'Microwave');
    expect(microwaveTile, findsOneWidget);
    await tester.tap(microwaveTile);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final addToLoad = find.text('Add to Current Load');
    await tester.scrollUntilVisible(
      addToLoad,
      250,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(addToLoad);
    await tester.pump(const Duration(seconds: 1));

    expect(find.textContaining('added to current load'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await selectBottomDestination(tester, 'Dashboard');

    final utilityMenu = find.byType(PopupMenuButton<String>);
    expect(utilityMenu, findsOneWidget);
    await tester.tap(utilityMenu);
    await tester.pumpAndSettle();

    await tapVisible(tester, find.text('Finalize Current Load'));
    expect(find.text('Finalize and Lock Estimate'), findsOneWidget);

    await tapVisible(tester, find.text('Finalize and Lock Estimate'));
    expect(find.text('Finalize this load?'), findsOneWidget);

    final confirmFinalize = find.text('Finalize');
    expect(confirmFinalize, findsOneWidget);

    await tester.tap(confirmFinalize);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Load finalized'), findsOneWidget);

    final continueButton = find.text('Continue');
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('Load History'), findsOneWidget);
    expect(find.text('Receipt'), findsWidgets);

    await tapVisible(tester, find.text('Receipt').first);
    expect(find.textContaining('Receipt for Load #'), findsOneWidget);

    await tester.tap(find.text('Choose category'));
    await tester.pumpAndSettle();

    final categoryOptions = find.byType(DropdownMenuItem<int>);
    expect(categoryOptions, findsWidgets);
    await tester.tap(categoryOptions.first);
    await tester.pumpAndSettle();

    await enterLabeledText(tester, 'Receipt weight', '10');
    await enterLabeledText(tester, 'Receipt rate', '0.25');

    await tapVisible(tester, find.text('Save Receipt'));
    expect(find.text('Load History'), findsOneWidget);
    expect(find.textContaining('Actual:'), findsWidgets);

    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final menuAgain = find.byType(PopupMenuButton<String>);
    expect(menuAgain, findsOneWidget);
    await tester.tap(menuAgain);
    await tester.pumpAndSettle();

    await tapVisible(tester, find.text('Backup & Restore'));
    expect(find.text('Create Full Backup'), findsOneWidget);
    expect(find.text('Validate and Restore Backup'), findsOneWidget);
  });
}
