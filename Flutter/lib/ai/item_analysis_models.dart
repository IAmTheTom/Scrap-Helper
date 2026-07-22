enum AiEvidenceKind { userFact, calculatedEstimate, aiSuggestion }

enum ItemActionRecommendation { take, takeIfNearby, inspectFirst, skip }

final class ItemAnalysisRequest {
  const ItemAnalysisRequest({
    required this.description,
    this.roundTripMiles,
    this.availableMinutes,
  });

  final String description;
  final double? roundTripMiles;
  final int? availableMinutes;
}

final class ItemMaterialSuggestion {
  const ItemMaterialSuggestion({
    required this.name,
    required this.likelihood,
    required this.evidenceKind,
  });

  final String name;
  final double likelihood;
  final AiEvidenceKind evidenceKind;
}

final class ItemAnalysisResult {
  const ItemAnalysisResult({
    required this.objectName,
    required this.confidence,
    required this.materials,
    required this.hazards,
    required this.estimatedProcessingMinutes,
    required this.recommendation,
    required this.reasoning,
    required this.providerName,
    required this.usedAi,
  });

  final String objectName;
  final double confidence;
  final List<ItemMaterialSuggestion> materials;
  final List<String> hazards;
  final int estimatedProcessingMinutes;
  final ItemActionRecommendation recommendation;
  final List<String> reasoning;
  final String providerName;
  final bool usedAi;
}
