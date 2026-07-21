import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/data/models/performance_models.dart';
import 'package:scrap_helper/domain/recommendations/recommendation_engine.dart';

void main() {
  test('requires enough evidence', () {
    const performance = ObjectPerformance(
      objectTemplateId: 1,
      objectName: 'Microwave',
      sampleCount: 2,
      totalQuantity: 2,
      totalMinutes: 30,
      totalEstimatedCents: 2400,
      totalActualCents: 2800,
      totalDirectCostCents: 0,
    );

    expect(
      RecommendationEngine.evaluate(performance).kind,
      RecommendationKind.insufficientData,
    );
  });

  test('identifies strong high-priority history', () {
    const performance = ObjectPerformance(
      objectTemplateId: 1,
      objectName: 'Aluminum Wheel',
      sampleCount: 10,
      totalQuantity: 10,
      totalMinutes: 120,
      totalEstimatedCents: 30000,
      totalActualCents: 35000,
      totalDirectCostCents: 5000,
    );

    expect(
      RecommendationEngine.evaluate(performance).kind,
      RecommendationKind.highPriority,
    );
  });
}
