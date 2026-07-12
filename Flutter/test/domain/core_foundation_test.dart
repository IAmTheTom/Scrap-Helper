import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/domain/calculation/integer_rounding.dart';
import 'package:scrap_helper/domain/calculation/rate_calculator.dart';
import 'package:scrap_helper/domain/enums/app_enums.dart';
import 'package:scrap_helper/domain/units/decimal_value.dart';
import 'package:scrap_helper/domain/units/weight_converter.dart';

void main() {
  test('signed round-half-up works', () {
    expect(roundHalfUpSigned(BigInt.from(5), BigInt.two), BigInt.from(3));
    expect(roundHalfUpSigned(BigInt.from(-5), BigInt.two), BigInt.from(-3));
  });

  test('decimal parser accepts required forms', () {
    for (final value in ['12', '12.5', '.5', '0.5', '+12.5', '-0.5']) {
      expect(() => DecimalValue.parse(value), returnsNormally);
    }
  });

  test('decimal parser rejects malformed forms', () {
    for (final value in ['', '.', '+', '-', '1.2.3', 'abc']) {
      expect(() => DecimalValue.parse(value), throwsFormatException);
    }
  });

  test('weight conversions work', () {
    expect(WeightConverter.toGrams('1', WeightUnit.kilogram), 1000);
    expect(WeightConverter.toGrams('1', WeightUnit.pound), 454);
    expect(WeightConverter.toGrams('1.5', WeightUnit.pound), 680);
    expect(WeightConverter.toGrams('1', WeightUnit.shortTon), 907185);
  });

  test('rate calculations work', () {
    final grams = WeightConverter.toGrams('10', WeightUnit.pound);
    expect(
      RateCalculator.payoutCents(
        rateUnits: 10000,
        rateUnit: PriceUnit.perPound,
        weightGrams: grams,
      ),
      1000,
    );
    expect(
      RateCalculator.payoutCents(
        rateUnits: 25000,
        rateUnit: PriceUnit.perItem,
        itemCount: 3,
      ),
      750,
    );
  });

  test('fee calculations work', () {
    expect(
      RateCalculator.feeCents(
        scope: FeeScope.perLoad,
        feeAmountCents: 500,
        feeRateUnits: 0,
      ),
      500,
    );
  });
}
