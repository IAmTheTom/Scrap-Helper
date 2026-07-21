import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/domain/units/rate_input.dart';

void main() {
  test('converts entered dollars to rate units', () {
    expect(RateInput.dollarsToRateUnits('0.0725'), 725);
    expect(RateInput.dollarsToRateUnits('1.10'), 11000);
  });

  test('rejects negative rates', () {
    expect(() => RateInput.dollarsToRateUnits('-1'), throwsFormatException);
  });
}
