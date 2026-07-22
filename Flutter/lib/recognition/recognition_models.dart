import 'scrap_taxonomy.dart';

final class NormalizedBoundingBox {
  const NormalizedBoundingBox({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : assert(left >= 0 && left <= 1),
       assert(top >= 0 && top <= 1),
       assert(width >= 0 && width <= 1),
       assert(height >= 0 && height <= 1);
  final double left, top, width, height;
}

final class ClassificationCandidate {
  const ClassificationCandidate({
    required this.id,
    required this.label,
    required this.confidence,
    required this.entityKind,
    required this.materialFamily,
    required this.grade,
  });
  final String id, label;
  final double confidence;
  final ScrapEntityKind entityKind;
  final NeutralMaterialFamily materialFamily;
  final NeutralScrapGrade grade;
}

final class EvidenceRecord {
  const EvidenceRecord({
    required this.source,
    required this.summary,
    required this.confidence,
  });
  final EvidenceSource source;
  final String summary;
  final double confidence;
}

final class ImageQualityAssessment {
  const ImageQualityAssessment({
    required this.isUsable,
    required this.score,
    required this.problems,
    required this.retakeGuidance,
  });
  final bool isUsable;
  final double score;
  final List<String> problems;
  final String? retakeGuidance;
  static const good = ImageQualityAssessment(
    isUsable: true,
    score: 1,
    problems: [],
    retakeGuidance: null,
  );
}

final class RecognitionDetection {
  const RecognitionDetection({
    required this.detectionId,
    required this.boundingBox,
    required this.candidates,
    required this.conditions,
    required this.hazards,
    required this.evidence,
  });
  final String detectionId;
  final NormalizedBoundingBox boundingBox;
  final List<ClassificationCandidate> candidates;
  final Set<PreparationCondition> conditions;
  final Set<HazardKind> hazards;
  final List<EvidenceRecord> evidence;
  ClassificationCandidate? get topCandidate =>
      candidates.isEmpty ? null : candidates.first;
  ClassificationCandidate? get secondCandidate =>
      candidates.length < 2 ? null : candidates[1];
  double get confidenceMargin {
    final first = topCandidate;
    if (first == null) return 0;
    final second = secondCandidate;
    return second == null
        ? first.confidence
        : first.confidence - second.confidence;
  }
}

enum ClarificationImpact { grade, safety, preparation, material }

final class ClarificationOption {
  const ClarificationOption({
    required this.id,
    required this.label,
    required this.resultingGrade,
    this.addCondition,
    this.addHazard,
  });
  final String id, label;
  final NeutralScrapGrade resultingGrade;
  final PreparationCondition? addCondition;
  final HazardKind? addHazard;
}

final class ClarificationQuestion {
  const ClarificationQuestion({
    required this.id,
    required this.prompt,
    required this.impact,
    required this.informationGain,
    required this.options,
    required this.allowUnknown,
  });
  final String id, prompt;
  final ClarificationImpact impact;
  final double informationGain;
  final List<ClarificationOption> options;
  final bool allowUnknown;
}

final class RecognitionModelMetadata {
  const RecognitionModelMetadata({
    required this.modelName,
    required this.modelVersion,
    required this.taxonomyVersion,
    required this.supportedClasses,
    required this.checksum,
  });
  final String modelName, modelVersion, taxonomyVersion, checksum;
  final Set<String> supportedClasses;
}

final class RecognitionSessionResult {
  const RecognitionSessionResult({
    required this.quality,
    required this.detections,
    required this.questions,
    required this.modelMetadata,
  });
  final ImageQualityAssessment quality;
  final List<RecognitionDetection> detections;
  final List<ClarificationQuestion> questions;
  final RecognitionModelMetadata modelMetadata;
}

final class RecognitionCorrection {
  const RecognitionCorrection({
    required this.createdAt,
    required this.imagePath,
    required this.detectionId,
    required this.originalLabel,
    required this.originalConfidence,
    required this.correctedLabel,
    required this.correctedGrade,
    required this.modelVersion,
    this.notes,
  });
  final DateTime createdAt;
  final String imagePath,
      detectionId,
      originalLabel,
      correctedLabel,
      modelVersion;
  final double originalConfidence;
  final NeutralScrapGrade correctedGrade;
  final String? notes;
}
