import 'recognition_models.dart';

final class RecognitionRequest {
  const RecognitionRequest({
    required this.imagePath,
    this.description,
    this.maxDetections = 10,
    this.minimumConfidence = 0.35,
  });
  final String imagePath;
  final String? description;
  final int maxDetections;
  final double minimumConfidence;
}

abstract interface class OnDeviceRecognitionProvider {
  RecognitionModelMetadata get metadata;
  Future<ImageQualityAssessment> assessImageQuality(String imagePath);
  Future<List<RecognitionDetection>> detect(RecognitionRequest request);
  Future<void> close();
}
