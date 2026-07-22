import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder fieldWithLabel(String label) {
  return find.byWidgetPredicate(
    (widget) => widget is TextField && widget.decoration?.labelText == label,
    description: 'TextField with label "$label"',
  );
}

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  expect(finder, findsWidgets);
  final target = finder.first;
  await tester.ensureVisible(target);
  await tester.tap(target);
  await tester.pumpAndSettle(const Duration(seconds: 10));
}

Future<void> selectBottomDestination(WidgetTester tester, String label) async {
  await tapVisible(tester, find.text(label));
}

Future<void> enterLabeledText(
  WidgetTester tester,
  String label,
  String value,
) async {
  final finder = fieldWithLabel(label);
  expect(finder, findsOneWidget);
  await tester.ensureVisible(finder);
  await tester.enterText(finder, value);
  await tester.pump();
}
