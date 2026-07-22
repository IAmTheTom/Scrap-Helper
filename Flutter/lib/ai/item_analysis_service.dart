import 'deterministic_item_advisor.dart';
import 'item_analysis_models.dart';
import 'item_analysis_provider.dart';

final class ItemAnalysisService {
  const ItemAnalysisService({
    required this.provider,
    this.allowAi = false,
    this.allowNetwork = false,
    this.allowImages = false,
    this.fallback = const DeterministicItemAdvisor(),
  });

  final ItemAnalysisProvider provider;
  final bool allowAi;
  final bool allowNetwork;
  final bool allowImages;
  final DeterministicItemAdvisor fallback;

  Future<ItemAnalysisResult> analyze(ItemAnalysisRequest request) async {
    if (!allowAi) {
      return fallback.analyze(request);
    }

    if (provider.requiresNetwork && !allowNetwork) {
      return fallback.analyze(request);
    }

    if (request.hasImage && (!allowImages || !provider.supportsImages)) {
      return fallback.analyze(request);
    }

    try {
      return await provider.analyze(request);
    } catch (_) {
      return fallback.analyze(request);
    }
  }
}
