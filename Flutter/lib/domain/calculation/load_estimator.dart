import '../../data/models/load_models.dart';
import '../../data/models/reference_models.dart';
import 'rate_calculator.dart';

final class CategoryEstimate {
  const CategoryEstimate({
    required this.categoryId,
    required this.lowWeightG,
    required this.typicalWeightG,
    required this.highWeightG,
    required this.lowPayoutCents,
    required this.typicalPayoutCents,
    required this.highPayoutCents,
  });

  final int categoryId;
  final int lowWeightG;
  final int typicalWeightG;
  final int highWeightG;
  final int lowPayoutCents;
  final int typicalPayoutCents;
  final int highPayoutCents;
}

final class LoadEstimate {
  const LoadEstimate({
    required this.lowPayoutCents,
    required this.typicalPayoutCents,
    required this.highPayoutCents,
    required this.categoryEstimates,
    required this.missingPriceCategoryIds,
  });

  final int lowPayoutCents;
  final int typicalPayoutCents;
  final int highPayoutCents;
  final List<CategoryEstimate> categoryEstimates;
  final Set<int> missingPriceCategoryIds;
}

abstract final class LoadEstimator {
  static LoadEstimate calculate({
    required List<LoadObjectItem> items,
    required Map<int, List<RecoverableComponent>> componentsByObject,
    required List<YardPrice> prices,
  }) {
    final priceByCategory = <int, YardPrice>{
      for (final price in prices) price.categoryId: price,
    };
    final weights = <int, _WeightRange>{};

    for (final item in items) {
      final components =
          componentsByObject[item.objectTemplateId] ??
          const <RecoverableComponent>[];
      final selected = components.where(
        (component) => component.recoveryLevel == item.recoveryLevel,
      );

      for (final component in selected) {
        final current = weights.putIfAbsent(
          component.categoryId,
          _WeightRange.new,
        );
        current.low += component.lowWeightG * item.quantity;
        current.typical += component.typicalWeightG * item.quantity;
        current.high += component.highWeightG * item.quantity;
      }
    }

    var lowTotal = 0;
    var typicalTotal = 0;
    var highTotal = 0;
    final missing = <int>{};
    final categories = <CategoryEstimate>[];

    for (final entry in weights.entries) {
      final price = priceByCategory[entry.key];
      var low = 0;
      var typical = 0;
      var high = 0;

      if (price == null) {
        missing.add(entry.key);
      } else {
        low = RateCalculator.payoutCents(
          rateUnits: price.rateUnits,
          rateUnit: price.rateUnit,
          weightGrams: entry.value.low,
        );
        typical = RateCalculator.payoutCents(
          rateUnits: price.rateUnits,
          rateUnit: price.rateUnit,
          weightGrams: entry.value.typical,
        );
        high = RateCalculator.payoutCents(
          rateUnits: price.rateUnits,
          rateUnit: price.rateUnit,
          weightGrams: entry.value.high,
        );
      }

      lowTotal += low;
      typicalTotal += typical;
      highTotal += high;
      categories.add(
        CategoryEstimate(
          categoryId: entry.key,
          lowWeightG: entry.value.low,
          typicalWeightG: entry.value.typical,
          highWeightG: entry.value.high,
          lowPayoutCents: low,
          typicalPayoutCents: typical,
          highPayoutCents: high,
        ),
      );
    }

    return LoadEstimate(
      lowPayoutCents: lowTotal,
      typicalPayoutCents: typicalTotal,
      highPayoutCents: highTotal,
      categoryEstimates: categories,
      missingPriceCategoryIds: missing,
    );
  }
}

final class _WeightRange {
  int low = 0;
  int typical = 0;
  int high = 0;
}
