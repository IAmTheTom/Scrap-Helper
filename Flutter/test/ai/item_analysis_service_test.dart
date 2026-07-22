import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/ai/item_analysis_models.dart';
import 'package:scrap_helper/ai/item_analysis_service.dart';
import 'package:scrap_helper/ai/mock_item_analysis_provider.dart';

void main() {
  test('uses deterministic fallback when AI is disabled', () async {
    const service = ItemAnalysisService(
      provider: MockItemAnalysisProvider(delay: Duration.zero),
      allowAi: false,
    );

    final result = await service.analyze(
      const ItemAnalysisRequest(description: 'countertop microwave'),
    );

    expect(result.objectName, 'Microwave');
    expect(result.usedAi, isFalse);
    expect(result.recommendation, ItemActionRecommendation.take);
  });

  test('uses configured provider when AI is explicitly enabled', () async {
    const service = ItemAnalysisService(
      provider: MockItemAnalysisProvider(delay: Duration.zero),
      allowAi: true,
    );

    final result = await service.analyze(
      const ItemAnalysisRequest(description: 'electric clothes dryer'),
    );

    expect(result.objectName, 'Electric Dryer');
    expect(result.usedAi, isTrue);
    expect(result.providerName, 'Mock Vision Provider');
  });

  test('recommends skipping refrigerators', () async {
    const service = ItemAnalysisService(
      provider: MockItemAnalysisProvider(delay: Duration.zero),
      allowAi: false,
    );

    final result = await service.analyze(
      const ItemAnalysisRequest(description: 'old refrigerator'),
    );

    expect(result.recommendation, ItemActionRecommendation.skip);
    expect(result.hazards, isNotEmpty);
  });
}
