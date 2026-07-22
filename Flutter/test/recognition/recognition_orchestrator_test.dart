import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/recognition/fixture_recognition_provider.dart';
import 'package:scrap_helper/recognition/recognition_orchestrator.dart';
import 'package:scrap_helper/recognition/recognition_provider.dart';

void main() {
  const orchestrator = RecognitionOrchestrator(
    provider: FixtureRecognitionProvider(),
  );

  test('rejects unusable images before classification', () async {
    final result = await orchestrator.analyze(
      const RecognitionRequest(imagePath: 'fixture_dark.jpg'),
    );
    expect(result.quality.isUsable, isFalse);
    expect(result.detections, isEmpty);
    expect(result.questions, isEmpty);
  });

  test('returns confident result without questions', () async {
    final result = await orchestrator.analyze(
      const RecognitionRequest(imagePath: 'bare_bright_fixture.jpg'),
    );
    expect(result.detections, hasLength(1));
    expect(result.questions, isEmpty);
  });

  test('returns one adaptive question for ambiguous brass', () async {
    final result = await orchestrator.analyze(
      const RecognitionRequest(imagePath: 'brass_fixture.jpg'),
    );
    expect(result.detections, hasLength(1));
    expect(result.questions, hasLength(1));
    expect(result.questions.single.id, 'magnet_brass_or_steel');
  });
}
