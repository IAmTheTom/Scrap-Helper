import '../../config/app_config.dart';
import '../enums/app_enums.dart';
import 'integer_rounding.dart';

abstract final class RateCalculator {
  static int payoutCents({
    required int rateUnits,
    required PriceUnit rateUnit,
    int? weightGrams,
    int? itemCount,
  }) {
    if (rateUnits < 0) throw ArgumentError('rateUnits cannot be negative');

    if (rateUnit == PriceUnit.perItem) {
      if (itemCount == null || itemCount <= 0) {
        throw ArgumentError('itemCount must be positive');
      }
      return checkedToInt(
        roundHalfUpSigned(
          BigInt.from(itemCount) * BigInt.from(rateUnits),
          BigInt.from(AppConfig.rateUnitsPerCent),
        ),
      );
    }

    if (weightGrams == null || weightGrams < 0) {
      throw ArgumentError('weightGrams must be nonnegative');
    }

    final unit = switch (rateUnit) {
      PriceUnit.perGram => WeightUnit.gram,
      PriceUnit.perKilogram => WeightUnit.kilogram,
      PriceUnit.perOunce => WeightUnit.ounce,
      PriceUnit.perPound => WeightUnit.pound,
      PriceUnit.perShortTon => WeightUnit.shortTon,
      PriceUnit.perMetricTonne => WeightUnit.metricTonne,
      PriceUnit.perItem => throw StateError('unreachable'),
    };

    return checkedToInt(
      roundHalfUpSigned(
        BigInt.from(weightGrams) *
            BigInt.from(unit.gramsDenominator) *
            BigInt.from(rateUnits),
        BigInt.from(unit.gramsNumerator) *
            BigInt.from(AppConfig.rateUnitsPerCent),
      ),
    );
  }

  static int feeCents({
    required FeeScope scope,
    required int feeAmountCents,
    required int feeRateUnits,
    PriceUnit? feeUnit,
    int? weightGrams,
    int? itemCount,
  }) {
    return switch (scope) {
      FeeScope.none => 0,
      FeeScope.perLoad => feeAmountCents,
      FeeScope.perItem =>
        (itemCount == null || itemCount <= 0)
            ? throw ArgumentError('itemCount must be positive')
            : itemCount * feeAmountCents,
      FeeScope.perUnit =>
        (feeUnit == null || feeUnit == PriceUnit.perItem)
            ? throw ArgumentError('feeUnit must be weight-based')
            : payoutCents(
                rateUnits: feeRateUnits,
                rateUnit: feeUnit,
                weightGrams: weightGrams,
              ),
    };
  }
}
