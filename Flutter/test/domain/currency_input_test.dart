import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/domain/units/currency_input.dart';

void main() {
  test('parses signed dollar adjustments', () {
    expect(CurrencyInput.dollarsToCents('12.34'), 1234);
    expect(CurrencyInput.dollarsToCents('-1.25'), -125);
  });

  test('formats cents as dollars', () {
    expect(CurrencyInput.centsToDollars(1234), '12.34');
    expect(CurrencyInput.centsToDollars(-125), '-1.25');
  });
}
