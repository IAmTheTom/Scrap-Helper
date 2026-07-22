import 'item_analysis_models.dart';

final class DeterministicItemAdvisor {
  const DeterministicItemAdvisor();

  ItemAnalysisResult analyze(ItemAnalysisRequest request) {
    final text = request.description.trim().toLowerCase();

    if (text.contains('microwave')) {
      return _result(
        objectName: 'Microwave',
        confidence: 0.96,
        materials: const [
          ('Shred Steel', 0.98),
          ('Copper', 0.82),
          ('Electric Motor', 0.58),
          ('Low Grade Circuit Boards', 0.72),
          ('Power Cord', 0.96),
        ],
        hazards: const [
          'High-voltage capacitor may retain a dangerous charge.',
          'Magnetron ceramics may contain hazardous material if broken.',
          'Sharp sheet-metal edges.',
        ],
        minutes: 25,
        recommendation: ItemActionRecommendation.take,
        reasoning: const [
          'Common object with predictable recoverable materials.',
          'Usually compact enough for efficient transport.',
          'Only process after following capacitor safety procedures.',
        ],
      );
    }

    if (text.contains('dryer')) {
      return _result(
        objectName: 'Electric Dryer',
        confidence: 0.93,
        materials: const [
          ('Shred Steel', 0.99),
          ('Electric Motor', 0.95),
          ('Insulated Copper Wire', 0.78),
          ('Power Cord', 0.90),
        ],
        hazards: const [
          'Sharp sheet-metal edges.',
          'Heavy and awkward to move.',
          'Check for gas fittings before assuming it is electric.',
        ],
        minutes: 35,
        recommendation: ItemActionRecommendation.takeIfNearby,
        reasoning: const [
          'Good predictable metal mass.',
          'Transport space and handling effort reduce hourly value.',
        ],
      );
    }

    if (text.contains('washer')) {
      return _result(
        objectName: 'Top-Load Washer',
        confidence: 0.91,
        materials: const [
          ('Shred Steel', 0.99),
          ('Electric Motor', 0.96),
          ('Insulated Copper Wire', 0.74),
          ('Low Grade Circuit Boards', 0.42),
        ],
        hazards: const [
          'Heavy and difficult to move alone.',
          'Residual water may leak during transport.',
          'Sharp sheet-metal edges.',
        ],
        minutes: 45,
        recommendation: ItemActionRecommendation.takeIfNearby,
        reasoning: const [
          'Useful motor and steel recovery.',
          'Weight and processing time make route distance important.',
        ],
      );
    }

    if (text.contains('refrigerator') || text.contains('fridge')) {
      return _result(
        objectName: 'Refrigerator',
        confidence: 0.95,
        materials: const [
          ('Shred Steel', 0.98),
          ('Electric Motor', 0.86),
          ('Insulated Copper Wire', 0.62),
        ],
        hazards: const [
          'Refrigerant handling may require certified recovery.',
          'Compressor oil and refrigerant lines must not be vented.',
          'Very heavy and bulky.',
        ],
        minutes: 70,
        recommendation: ItemActionRecommendation.skip,
        reasoning: const [
          'Regulated refrigerant handling can eliminate practical value.',
          'Bulky transport footprint is poor for a small pickup vehicle.',
        ],
      );
    }

    return _result(
      objectName: 'Unknown Scrap Object',
      confidence: 0.35,
      materials: const [
        ('Shred Steel', 0.45),
        ('Insulated Copper Wire', 0.28),
        ('Low Grade Circuit Boards', 0.20),
      ],
      hazards: const [
        'Inspect for batteries, capacitors, pressurized cylinders, and refrigerants.',
        'Wear gloves and eye protection before opening.',
      ],
      minutes: 30,
      recommendation: ItemActionRecommendation.inspectFirst,
      reasoning: const [
        'The description is not specific enough for a confident identification.',
        'Confirm the object type and visible components before pickup.',
      ],
    );
  }

  ItemAnalysisResult _result({
    required String objectName,
    required double confidence,
    required List<(String, double)> materials,
    required List<String> hazards,
    required int minutes,
    required ItemActionRecommendation recommendation,
    required List<String> reasoning,
  }) {
    return ItemAnalysisResult(
      objectName: objectName,
      confidence: confidence,
      materials: [
        for (final material in materials)
          ItemMaterialSuggestion(
            name: material.$1,
            likelihood: material.$2,
            evidenceKind: AiEvidenceKind.calculatedEstimate,
          ),
      ],
      hazards: hazards,
      estimatedProcessingMinutes: minutes,
      recommendation: recommendation,
      reasoning: reasoning,
      providerName: 'Deterministic Scrap Rules',
      usedAi: false,
    );
  }
}
