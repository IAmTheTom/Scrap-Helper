import '../adaptive_clarification_engine.dart';
import '../recognition_models.dart';
import 'classification_output_adapter.dart';
import 'image_tensor_preprocessor.dart';
import 'installed_model_registry.dart';
import 'local_model_runtime.dart';

final class LocalRecognitionAttempt {
  const LocalRecognitionAttempt({
    required this.usedLocalModel,
    required this.message,
    this.result,
  });

  final bool usedLocalModel;
  final String message;
  final RecognitionSessionResult? result;
}

final class LocalClassificationRecognitionService {
  LocalClassificationRecognitionService({
    InstalledModelRegistry? registry,
    ImageTensorPreprocessor? preprocessor,
    ClassificationOutputAdapter? adapter,
    AdaptiveClarificationEngine? clarificationEngine,
  }) : registry = registry ?? const InstalledModelRegistry(),
       preprocessor = preprocessor ?? const ImageTensorPreprocessor(),
       adapter = adapter ?? const ClassificationOutputAdapter(),
       clarificationEngine =
           clarificationEngine ?? const AdaptiveClarificationEngine();

  final InstalledModelRegistry registry;
  final ImageTensorPreprocessor preprocessor;
  final ClassificationOutputAdapter adapter;
  final AdaptiveClarificationEngine clarificationEngine;

  Future<LocalRecognitionAttempt> analyze({required String imagePath}) async {
    final installed = await registry.findNewestValid();

    if (installed == null) {
      return const LocalRecognitionAttempt(
        usedLocalModel: false,
        message:
            'No valid local recognition model is installed. '
            'Import one through Local AI Model.',
      );
    }

    final validation = installed.validation;
    final manifest = validation.manifest!;

    if (manifest.output.kind != 'classification') {
      return LocalRecognitionAttempt(
        usedLocalModel: false,
        message:
            'Installed model uses ${manifest.output.kind}. '
            'This build currently supports classification output; '
            'object-detection output wiring comes next.',
      );
    }

    final runtime = LocalModelRuntime();

    try {
      final status = await runtime.load(
        modelPath: validation.modelPath!,
        labelsPath: validation.labelsPath!,
      );

      if (!status.isReady) {
        return LocalRecognitionAttempt(
          usedLocalModel: false,
          message: status.message,
        );
      }

      final tensor = await preprocessor.prepareFile(
        imagePath: imagePath,
        input: manifest.input,
      );

      final raw = runtime.runClassification(tensor: tensor, manifest: manifest);

      final scores = adapter.flattenAndRank(
        rawOutput: raw.values.first,
        labels: runtime.labels,
        minimumConfidence: 0.35,
        topK: 3,
      );

      if (scores.isEmpty) {
        return LocalRecognitionAttempt(
          usedLocalModel: true,
          message:
              'The local model ran, but no result met the confidence threshold.',
          result: RecognitionSessionResult(
            quality: ImageQualityAssessment.good,
            detections: const [],
            questions: const [],
            modelMetadata: RecognitionModelMetadata(
              modelName: manifest.modelName,
              modelVersion: manifest.modelVersion,
              taxonomyVersion: manifest.taxonomyVersion,
              supportedClasses: runtime.labels.toSet(),
              checksum: manifest.modelSha256,
            ),
          ),
        );
      }

      final detection = adapter.toDetection(scores);
      final questions = clarificationEngine.questionsFor(detection);

      return LocalRecognitionAttempt(
        usedLocalModel: true,
        message:
            'Analyzed entirely on-device with '
            '${manifest.modelName} ${manifest.modelVersion}.',
        result: RecognitionSessionResult(
          quality: ImageQualityAssessment.good,
          detections: [detection],
          questions: questions,
          modelMetadata: RecognitionModelMetadata(
            modelName: manifest.modelName,
            modelVersion: manifest.modelVersion,
            taxonomyVersion: manifest.taxonomyVersion,
            supportedClasses: runtime.labels.toSet(),
            checksum: manifest.modelSha256,
          ),
        ),
      );
    } catch (error) {
      return LocalRecognitionAttempt(
        usedLocalModel: false,
        message: 'Local model analysis failed: $error',
      );
    } finally {
      await runtime.close();
    }
  }
}
