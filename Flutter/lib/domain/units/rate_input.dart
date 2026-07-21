import '../../config/app_config.dart';
import '../calculation/integer_rounding.dart';
import 'decimal_value.dart';

abstract final class RateInput {
  static int dollarsToRateUnits(String input) {
    final value = DecimalValue.parse(input);
    if (value.mantissa.isNegative) {
      throw const FormatException('Rate cannot be negative');
    }
    return checkedToInt(
      roundHalfUpSigned(
        value.mantissa * BigInt.from(AppConfig.rateUnitsPerDollar),
        value.scaleFactor,
      ),
    );
  }
}
