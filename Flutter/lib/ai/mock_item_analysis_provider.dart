import 'dart:async';

import 'deterministic_item_advisor.dart';
import 'item_analysis_models.dart';
import 'item_analysis_provider.dart';

final class MockItemAnalysisProvider implements ItemAnalysisProvider {
  const MockItemAnalysisProvider({
    this.delay = const Duration(milliseconds: 500),
  });

  final Duration delay;

  @override
  String get name => 'Mock Vision Provider';

  @override
  bool get requiresNetwork => false;

  @override
  Future<ItemAnalysisResult> analyze(ItemAnalysisRequest request) async {
    await Future<void>.delayed(delay);
    final fallback = const DeterministicItemAdvisor().analyze(request);

    return ItemAnalysisResult(
      objectName: fallback.objectName,
      confidence: (fallback.confidence + 0.02).clamp(0.0, 0.99),
      materials: [
        for (final material in fallback.materials)
          ItemMaterialSuggestion(
            name: material.name,
            likelihood: material.likelihood,
            evidenceKind: AiEvidenceKind.aiSuggestion,
          ),
      ],
      hazards: fallback.hazards,
      estimatedProcessingMinutes: fallback.estimatedProcessingMinutes,
      recommendation: fallback.recommendation,
      reasoning: [
        'Simulated visual classification for development and testing.',
        ...fallback.reasoning,
      ],
      providerName: name,
      usedAi: true,
    );
  }
}
