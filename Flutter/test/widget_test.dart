import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/app.dart';

void main() {
  testWidgets('shows productized app shell', (tester) async {
    await tester.pumpWidget(const ScrapHelperApp());
    await tester.pump();

    expect(find.text('Scrap Helper'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });
}
