import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/recognition/adaptive_clarification_engine.dart';
import 'package:scrap_helper/recognition/recognition_models.dart';
import 'package:scrap_helper/recognition/scrap_taxonomy.dart';

void main() {
  const engine = AdaptiveClarificationEngine();

  test('asks no question for high-confidence bare bright copper', () {
    final detection = _detection(
      primary: const ClassificationCandidate(
        id: 'bare',
        label: 'Bare bright copper',
        confidence: 0.96,
        entityKind: ScrapEntityKind.looseMaterial,
        materialFamily: NeutralMaterialFamily.copper,
        grade: NeutralScrapGrade.bareBrightCopper,
      ),
    );
    expect(engine.questionsFor(detection), isEmpty);
  });

  test('asks magnet question when brass may be plated steel', () {
    final detection = _detection(
      primary: const ClassificationCandidate(
        id: 'brass',
        label: 'Yellow brass fitting',
        confidence: 0.74,
        entityKind: ScrapEntityKind.fitting,
        materialFamily: NeutralMaterialFamily.brass,
        grade: NeutralScrapGrade.yellowBrass,
      ),
      secondary: const ClassificationCandidate(
        id: 'steel',
        label: 'Brass-plated steel fitting',
        confidence: 0.20,
        entityKind: ScrapEntityKind.fitting,
        materialFamily: NeutralMaterialFamily.ferrous,
        grade: NeutralScrapGrade.shredSteel,
      ),
    );
    final questions = engine.questionsFor(detection);
    expect(questions, hasLength(1));
    expect(questions.single.id, 'magnet_brass_or_steel');
  });
}

RecognitionDetection _detection({
  required ClassificationCandidate primary,
  ClassificationCandidate? secondary,
}) {
  return RecognitionDetection(
    detectionId: 'test',
    boundingBox: const NormalizedBoundingBox(
      left: 0,
      top: 0,
      width: 1,
      height: 1,
    ),
    candidates: [primary, ?secondary],
    conditions: const {},
    hazards: const {},
    evidence: const [],
  );
}
