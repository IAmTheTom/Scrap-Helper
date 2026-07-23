import '../recognition_models.dart';
import '../scrap_taxonomy.dart';

final class ClassificationScore {
  const ClassificationScore({required this.label, required this.score});

  final String label;
  final double score;
}

final class ClassificationOutputAdapter {
  const ClassificationOutputAdapter();

  List<ClassificationScore> flattenAndRank({
    required Object rawOutput,
    required List<String> labels,
    double minimumConfidence = 0.35,
    int topK = 3,
  }) {
    final values = <double>[];

    void walk(Object? value) {
      if (value is num) {
        values.add(value.toDouble());
        return;
      }
      if (value is Iterable) {
        for (final item in value) {
          walk(item);
        }
      }
    }

    walk(rawOutput);

    final count = values.length < labels.length ? values.length : labels.length;
    final result = <ClassificationScore>[
      for (var index = 0; index < count; index++)
        if (values[index] >= minimumConfidence)
          ClassificationScore(label: labels[index], score: values[index]),
    ]..sort((a, b) => b.score.compareTo(a.score));

    return result.take(topK).toList(growable: false);
  }

  RecognitionDetection toDetection(List<ClassificationScore> scores) {
    return RecognitionDetection(
      detectionId: 'classification-primary',
      boundingBox: const NormalizedBoundingBox(
        left: 0,
        top: 0,
        width: 1,
        height: 1,
      ),
      candidates: [
        for (final score in scores)
          ClassificationCandidate(
            id: score.label,
            label: score.label.replaceAll('_', ' '),
            confidence: score.score,
            entityKind: ScrapEntityKind.unknown,
            materialFamily: _family(score.label),
            grade: _grade(score.label),
          ),
      ],
      conditions: const {},
      hazards: const {},
      evidence: const [
        EvidenceRecord(
          source: EvidenceSource.visionModel,
          summary: 'On-device TFLite classification.',
          confidence: 1,
        ),
      ],
    );
  }

  NeutralMaterialFamily _family(String label) {
    if (label.contains('copper')) return NeutralMaterialFamily.copper;
    if (label.contains('brass')) return NeutralMaterialFamily.brass;
    if (label.contains('aluminum')) return NeutralMaterialFamily.aluminum;
    if (label.contains('steel') || label.contains('iron')) {
      return NeutralMaterialFamily.ferrous;
    }
    return NeutralMaterialFamily.unknown;
  }

  NeutralScrapGrade _grade(String label) {
    final name = _camel(label);
    for (final grade in NeutralScrapGrade.values) {
      if (grade.name == name) return grade;
    }
    return NeutralScrapGrade.unknown;
  }

  String _camel(String value) {
    final parts = value.split('_');
    return parts.first +
        parts.skip(1).map((part) {
          if (part.isEmpty) return '';
          return part[0].toUpperCase() + part.substring(1);
        }).join();
  }
}
