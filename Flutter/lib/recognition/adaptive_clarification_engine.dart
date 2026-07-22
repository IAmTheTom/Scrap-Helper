import 'recognition_models.dart';
import 'scrap_taxonomy.dart';

final class AdaptiveClarificationEngine {
  const AdaptiveClarificationEngine({
    this.maximumQuestions = 1,
    this.lowConfidenceThreshold = 0.68,
    this.closeCandidateMargin = 0.12,
    this.minimumInformationGain = 0.45,
  });

  final int maximumQuestions;
  final double lowConfidenceThreshold,
      closeCandidateMargin,
      minimumInformationGain;

  List<ClarificationQuestion> questionsFor(RecognitionDetection detection) {
    if (maximumQuestions <= 0) return const [];
    final top = detection.topCandidate;
    if (top == null) return const [];

    final questions = <ClarificationQuestion>[];

    if (top.materialFamily == NeutralMaterialFamily.brass &&
        (top.confidence < 0.88 ||
            detection.confidenceMargin < closeCandidateMargin)) {
      questions.add(
        const ClarificationQuestion(
          id: 'magnet_brass_or_steel',
          prompt: 'Does a magnet stick strongly?',
          impact: ClarificationImpact.material,
          informationGain: 0.92,
          allowUnknown: true,
          options: [
            ClarificationOption(
              id: 'yes',
              label: 'Yes',
              resultingGrade: NeutralScrapGrade.shredSteel,
              addCondition: PreparationCondition.plated,
            ),
            ClarificationOption(
              id: 'no',
              label: 'No',
              resultingGrade: NeutralScrapGrade.yellowBrass,
            ),
          ],
        ),
      );
    }

    final hasCopperTubing = detection.candidates.any(
      (candidate) =>
          candidate.grade == NeutralScrapGrade.copperTubingClean ||
          candidate.grade == NeutralScrapGrade.copperTubingSoldered,
    );

    if (hasCopperTubing &&
        (top.confidence < 0.90 ||
            detection.confidenceMargin < closeCandidateMargin)) {
      questions.add(
        const ClarificationQuestion(
          id: 'copper_tubing_solder',
          prompt: 'Are any joints visibly soldered?',
          impact: ClarificationImpact.grade,
          informationGain: 0.88,
          allowUnknown: true,
          options: [
            ClarificationOption(
              id: 'yes',
              label: 'Yes',
              resultingGrade: NeutralScrapGrade.copperTubingSoldered,
              addCondition: PreparationCondition.soldered,
            ),
            ClarificationOption(
              id: 'no',
              label: 'No',
              resultingGrade: NeutralScrapGrade.copperTubingClean,
              addCondition: PreparationCondition.clean,
            ),
          ],
        ),
      );
    }

    if (top.materialFamily == NeutralMaterialFamily.aluminum &&
        detection.conditions.contains(PreparationCondition.attachedSteel)) {
      questions.add(
        const ClarificationQuestion(
          id: 'aluminum_steel_removal',
          prompt: 'Can the steel attachments be removed easily?',
          impact: ClarificationImpact.preparation,
          informationGain: 0.64,
          allowUnknown: true,
          options: [
            ClarificationOption(
              id: 'yes',
              label: 'Yes',
              resultingGrade: NeutralScrapGrade.cleanAluminumExtrusion,
              addCondition: PreparationCondition.clean,
            ),
            ClarificationOption(
              id: 'no',
              label: 'No',
              resultingGrade: NeutralScrapGrade.mixedMaterial,
              addCondition: PreparationCondition.attachedSteel,
            ),
          ],
        ),
      );
    }

    if (detection.hazards.contains(HazardKind.refrigerant) &&
        top.entityKind == ScrapEntityKind.wholeObject &&
        top.confidence < 0.80) {
      questions.add(
        const ClarificationQuestion(
          id: 'sealed_refrigerant_system',
          prompt: 'Are sealed refrigerant lines or a compressor attached?',
          impact: ClarificationImpact.safety,
          informationGain: 0.96,
          allowUnknown: true,
          options: [
            ClarificationOption(
              id: 'yes',
              label: 'Yes',
              resultingGrade: NeutralScrapGrade.sealedUnit,
              addCondition: PreparationCondition.sealed,
              addHazard: HazardKind.refrigerant,
            ),
            ClarificationOption(
              id: 'no',
              label: 'No',
              resultingGrade: NeutralScrapGrade.mixedMaterial,
            ),
          ],
        ),
      );
    }

    questions.sort((a, b) => b.informationGain.compareTo(a.informationGain));
    return questions
        .where((q) => q.informationGain >= minimumInformationGain)
        .take(maximumQuestions)
        .toList(growable: false);
  }
}
