import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/features/recognition/recognition_review_page.dart';
import 'package:scrap_helper/recognition/fixture_recognition_provider.dart';
import 'package:scrap_helper/recognition/recognition_orchestrator.dart';
import 'package:scrap_helper/recognition/recognition_provider.dart';

void main() {
  testWidgets('shows only needed clarification question', (tester) async {
    final result = await const RecognitionOrchestrator(
      provider: FixtureRecognitionProvider(),
    ).analyze(const RecognitionRequest(imagePath: 'brass_fixture.jpg'));

    await tester.pumpWidget(
      MaterialApp(
        home: RecognitionReviewPage(imagePath: 'missing.jpg', result: result),
      ),
    );

    expect(
      find.byKey(const Key('adaptive_clarification_card')),
      findsOneWidget,
    );
    expect(find.text('Does a magnet stick strongly?'), findsOneWidget);
  });

  testWidgets('shows no question for confident copper', (tester) async {
    final result = await const RecognitionOrchestrator(
      provider: FixtureRecognitionProvider(),
    ).analyze(const RecognitionRequest(imagePath: 'bare_bright_fixture.jpg'));

    await tester.pumpWidget(
      MaterialApp(
        home: RecognitionReviewPage(imagePath: 'missing.jpg', result: result),
      ),
    );

    expect(find.byKey(const Key('adaptive_clarification_card')), findsNothing);
  });
}
