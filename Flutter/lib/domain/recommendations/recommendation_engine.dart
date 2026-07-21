import '../../config/app_config.dart';
import '../../data/models/performance_models.dart';

enum RecommendationKind {
  insufficientData,
  highPriority,
  keepTargeting,
  selective,
  bundleOnly,
  lowPriority,
}

final class ObjectRecommendation {
  const ObjectRecommendation({
    required this.kind,
    required this.title,
    required this.explanation,
  });

  final RecommendationKind kind;
  final String title;
  final String explanation;
}

abstract final class RecommendationEngine {
  static ObjectRecommendation evaluate(ObjectPerformance performance) {
    if (performance.sampleCount < AppConfig.minimumRecommendationSamples) {
      return ObjectRecommendation(
        kind: RecommendationKind.insufficientData,
        title: 'Insufficient data',
        explanation:
            'Only ${performance.sampleCount} completed sample(s). '
            'Record at least ${AppConfig.minimumRecommendationSamples} before relying on a recommendation.',
      );
    }

    final netPerItem = performance.averageNetPerItemCents;
    final hourly = performance.netPerHourCents;
    final minutes = performance.averageMinutesPerItem;

    if (performance.sampleCount >= AppConfig.strongRecommendationSamples &&
        netPerItem >= 2500 &&
        hourly >= 5000) {
      return ObjectRecommendation(
        kind: RecommendationKind.highPriority,
        title: 'High priority',
        explanation:
            'Strong personal history: \$${(netPerItem / 100).toStringAsFixed(2)} net per item and '
            '\$${(hourly / 100).toStringAsFixed(2)} net per processing hour.',
      );
    }

    if (netPerItem >= 1200 && hourly >= 3000) {
      return ObjectRecommendation(
        kind: RecommendationKind.keepTargeting,
        title: 'Keep targeting',
        explanation:
            'Your history shows a useful balance of net return and processing time.',
      );
    }

    if (netPerItem >= 600 && hourly >= 1800) {
      return ObjectRecommendation(
        kind: RecommendationKind.selective,
        title: 'Pick up selectively',
        explanation:
            'Profitable in your history, but distance, condition, subtype, and available trailer space matter.',
      );
    }

    if (netPerItem >= 200 && minutes <= 15) {
      return ObjectRecommendation(
        kind: RecommendationKind.bundleOnly,
        title: 'Bundle only',
        explanation:
            'Low return per item. It may still make sense when already nearby or filling unused load space.',
      );
    }

    return ObjectRecommendation(
      kind: RecommendationKind.lowPriority,
      title: 'Low priority',
      explanation:
          'Your recorded net return or hourly return is too low to prioritize this item.',
    );
  }
}
