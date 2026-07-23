import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:scrap_helper/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('exposes offline advisor and local model management', (
    tester,
  ) async {
    await app.main();
    await tester.pumpAndSettle(const Duration(seconds: 15));

    final menu = find.byType(PopupMenuButton<String>);
    expect(menu, findsOneWidget);

    await tester.tap(menu);
    await tester.pumpAndSettle();

    expect(find.text('Item Advisor'), findsOneWidget);
    expect(find.text('Local AI Model'), findsOneWidget);

    await tester.tap(find.text('Local AI Model'));
    await tester.pumpAndSettle();

    expect(find.text('Local AI Model'), findsOneWidget);
    expect(find.byKey(const Key('import_local_model_pack')), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.byType(PopupMenuButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Item Advisor'));
    await tester.pumpAndSettle();

    expect(find.text('Analyze Offline'), findsOneWidget);
    expect(find.byKey(const Key('item_image_input')), findsOneWidget);
  });
}
