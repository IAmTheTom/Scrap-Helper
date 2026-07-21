import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/data/models/load_models.dart';
import 'package:scrap_helper/data/models/reference_models.dart';
import 'package:scrap_helper/domain/calculation/load_estimator.dart';
import 'package:scrap_helper/domain/enums/app_enums.dart';

void main() {
  test('calculates payout and identifies missing prices', () {
    final items = <LoadObjectItem>[
      const LoadObjectItem(
        id: 1,
        loadId: 1,
        objectTemplateId: 10,
        quantity: 2,
        recoveryLevel: RecoveryLevel.standard,
        objectName: 'Test object',
      ),
    ];

    final components = <int, List<RecoverableComponent>>{
      10: const <RecoverableComponent>[
        RecoverableComponent(
          id: 1,
          objectTemplateId: 10,
          componentName: 'Steel',
          categoryId: 1,
          recoveryLevel: RecoveryLevel.standard,
          lowWeightG: 4536,
          typicalWeightG: 4536,
          highWeightG: 4536,
          confidence: ConfidenceLevel.low,
        ),
        RecoverableComponent(
          id: 2,
          objectTemplateId: 10,
          componentName: 'Unpriced',
          categoryId: 2,
          recoveryLevel: RecoveryLevel.standard,
          lowWeightG: 100,
          typicalWeightG: 100,
          highWeightG: 100,
          confidence: ConfidenceLevel.low,
        ),
      ],
    };

    final prices = <YardPrice>[
      const YardPrice(
        id: 1,
        scrapyardId: 1,
        categoryId: 1,
        yardCategoryName: 'Steel',
        rateUnits: 10000,
        rateUnit: PriceUnit.perPound,
        effectiveFrom: '2026-07-21',
      ),
    ];

    final estimate = LoadEstimator.calculate(
      items: items,
      componentsByObject: components,
      prices: prices,
    );

    expect(estimate.typicalPayoutCents, 2000);
    expect(estimate.missingPriceCategoryIds, contains(2));
  });
}
