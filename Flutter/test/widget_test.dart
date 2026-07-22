import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/app.dart';

void main() {
  testWidgets('shows core field navigation and utility menu', (tester) async {
    await tester.pumpWidget(const ScrapHelperApp());
    await tester.pump();

    expect(find.byType(NavigationBar), findsOneWidget);

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Pickups'), findsOneWidget);
    expect(find.text('Load'), findsOneWidget);
    expect(find.text('Objects'), findsOneWidget);
    expect(find.text('Storage'), findsOneWidget);

    expect(find.byType(PopupMenuButton<String>), findsOneWidget);
    expect(find.text('Search Everything'), findsNothing);
  });
}
