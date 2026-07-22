import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/ai/item_analysis_models.dart';
import 'package:scrap_helper/ai/item_analysis_service.dart';
import 'package:scrap_helper/ai/mock_item_analysis_provider.dart';

void main() {
  test('request reports when it has an image', () {
    const request = ItemAnalysisRequest(
      description: 'microwave',
      imagePath: r'C:\temp\microwave.jpg',
    );

    expect(request.hasImage, isTrue);
  });

  test(
    'deterministic fallback does not claim to inspect image pixels',
    () async {
      const service = ItemAnalysisService(
        provider: MockItemAnalysisProvider(delay: Duration.zero),
        allowAi: false,
        allowImages: false,
      );

      final result = await service.analyze(
        const ItemAnalysisRequest(
          description: 'microwave',
          imagePath: '/tmp/microwave.jpg',
        ),
      );

      expect(result.usedAi, isFalse);
      expect(result.usedImage, isFalse);
    },
  );

  test(
    'simulated provider accepts local image when explicitly enabled',
    () async {
      const service = ItemAnalysisService(
        provider: MockItemAnalysisProvider(delay: Duration.zero),
        allowAi: true,
        allowImages: true,
      );

      final result = await service.analyze(
        const ItemAnalysisRequest(
          description: 'microwave',
          imagePath: '/tmp/microwave.jpg',
        ),
      );

      expect(result.usedAi, isTrue);
      expect(result.usedImage, isTrue);
    },
  );
}
