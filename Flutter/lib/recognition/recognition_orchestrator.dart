import 'adaptive_clarification_engine.dart';
import 'recognition_models.dart';
import 'recognition_provider.dart';

final class RecognitionOrchestrator {
  const RecognitionOrchestrator({
    required this.provider,
    this.clarificationEngine = const AdaptiveClarificationEngine(),
  });

  final OnDeviceRecognitionProvider provider;
  final AdaptiveClarificationEngine clarificationEngine;

  Future<RecognitionSessionResult> analyze(RecognitionRequest request) async {
    final quality = await provider.assessImageQuality(request.imagePath);
    if (!quality.isUsable) {
      return RecognitionSessionResult(
        quality: quality,
        detections: const [],
        questions: const [],
        modelMetadata: provider.metadata,
      );
    }

    final detections = await provider.detect(request);
    final questions = <ClarificationQuestion>[];
    for (final detection in detections) {
      questions.addAll(clarificationEngine.questionsFor(detection));
      if (questions.length >= clarificationEngine.maximumQuestions) break;
    }

    return RecognitionSessionResult(
      quality: quality,
      detections: detections,
      questions: questions
          .take(clarificationEngine.maximumQuestions)
          .toList(growable: false),
      modelMetadata: provider.metadata,
    );
  }
}
