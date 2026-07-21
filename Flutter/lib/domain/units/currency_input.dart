import '../../config/app_config.dart';
import '../calculation/integer_rounding.dart';
import 'decimal_value.dart';

abstract final class CurrencyInput {
  static int dollarsToCents(String input) {
    final value = DecimalValue.parse(input);
    return checkedToInt(
      roundHalfUpSigned(value.mantissa * BigInt.from(100), value.scaleFactor),
    );
  }

  static String centsToDollars(int cents) {
    final negative = cents.isNegative;
    final magnitude = cents.abs();
    final whole = magnitude ~/ 100;
    final fraction = (magnitude % 100).toString().padLeft(2, '0');
    return '${negative ? '-' : ''}$whole.$fraction';
  }

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
