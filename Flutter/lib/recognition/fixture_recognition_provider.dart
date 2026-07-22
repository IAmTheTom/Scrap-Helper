import 'recognition_models.dart';
import 'recognition_provider.dart';
import 'scrap_taxonomy.dart';

final class FixtureRecognitionProvider implements OnDeviceRecognitionProvider {
  const FixtureRecognitionProvider();

  @override
  RecognitionModelMetadata get metadata => const RecognitionModelMetadata(
    modelName: 'Fixture Scrap Detector',
    modelVersion: '0.1.0',
    taxonomyVersion: '1.0.0',
    supportedClasses: {
      'bare_bright_copper',
      'copper_tubing',
      'yellow_brass_fitting',
      'aluminum_extrusion',
      'microwave',
      'unknown',
    },
    checksum: 'fixture-only-no-model',
  );

  @override
  Future<ImageQualityAssessment> assessImageQuality(String imagePath) async {
    final lower = imagePath.toLowerCase();
    if (lower.contains('dark')) {
      return const ImageQualityAssessment(
        isUsable: false,
        score: 0.25,
        problems: ['Image is too dark.'],
        retakeGuidance: 'Use brighter lighting and move closer.',
      );
    }
    if (lower.contains('blur')) {
      return const ImageQualityAssessment(
        isUsable: false,
        score: 0.30,
        problems: ['Image is blurry.'],
        retakeGuidance: 'Hold the phone steady and retake the photo.',
      );
    }
    return ImageQualityAssessment.good;
  }

  @override
  Future<List<RecognitionDetection>> detect(RecognitionRequest request) async {
    final source = '${request.imagePath} ${request.description ?? ''}'
        .toLowerCase();
    if (source.contains('brass')) {
      return [
        _detection(
          label: 'Yellow brass fitting',
          confidence: 0.76,
          entityKind: ScrapEntityKind.fitting,
          materialFamily: NeutralMaterialFamily.brass,
          grade: NeutralScrapGrade.yellowBrass,
          secondLabel: 'Brass-plated steel fitting',
          secondConfidence: 0.19,
          secondMaterial: NeutralMaterialFamily.ferrous,
          secondGrade: NeutralScrapGrade.shredSteel,
        ),
      ];
    }
    if (source.contains('solder') || source.contains('copper_pipe')) {
      return [
        _detection(
          label: 'Copper tubing',
          confidence: 0.73,
          entityKind: ScrapEntityKind.looseMaterial,
          materialFamily: NeutralMaterialFamily.copper,
          grade: NeutralScrapGrade.copperTubingClean,
          secondLabel: 'Soldered copper tubing',
          secondConfidence: 0.22,
          secondMaterial: NeutralMaterialFamily.copper,
          secondGrade: NeutralScrapGrade.copperTubingSoldered,
        ),
      ];
    }
    if (source.contains('bare_bright')) {
      return [
        _detection(
          label: 'Bare bright copper',
          confidence: 0.95,
          entityKind: ScrapEntityKind.looseMaterial,
          materialFamily: NeutralMaterialFamily.copper,
          grade: NeutralScrapGrade.bareBrightCopper,
        ),
      ];
    }
    return [
      _detection(
        label: 'Unknown scrap item',
        confidence: 0.41,
        entityKind: ScrapEntityKind.unknown,
        materialFamily: NeutralMaterialFamily.unknown,
        grade: NeutralScrapGrade.unknown,
      ),
    ];
  }

  RecognitionDetection _detection({
    required String label,
    required double confidence,
    required ScrapEntityKind entityKind,
    required NeutralMaterialFamily materialFamily,
    required NeutralScrapGrade grade,
    String? secondLabel,
    double? secondConfidence,
    NeutralMaterialFamily? secondMaterial,
    NeutralScrapGrade? secondGrade,
  }) {
    return RecognitionDetection(
      detectionId: 'fixture-1',
      boundingBox: const NormalizedBoundingBox(
        left: 0.1,
        top: 0.1,
        width: 0.8,
        height: 0.8,
      ),
      candidates: [
        ClassificationCandidate(
          id: 'primary',
          label: label,
          confidence: confidence,
          entityKind: entityKind,
          materialFamily: materialFamily,
          grade: grade,
        ),
        if (secondLabel != null)
          ClassificationCandidate(
            id: 'secondary',
            label: secondLabel,
            confidence: secondConfidence ?? 0,
            entityKind: entityKind,
            materialFamily: secondMaterial ?? materialFamily,
            grade: secondGrade ?? NeutralScrapGrade.unknown,
          ),
      ],
      conditions: const {},
      hazards: const {HazardKind.sharpEdges},
      evidence: const [
        EvidenceRecord(
          source: EvidenceSource.visionModel,
          summary: 'Fixture result for architecture testing.',
          confidence: 1,
        ),
      ],
    );
  }

  @override
  Future<void> close() async {}
}
