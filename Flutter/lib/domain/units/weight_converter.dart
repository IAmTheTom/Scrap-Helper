import '../calculation/integer_rounding.dart';
import '../enums/app_enums.dart';
import 'decimal_value.dart';

abstract final class WeightConverter {
  static int toGrams(String input, WeightUnit unit) {
    final value = DecimalValue.parse(input);
    return checkedToInt(
      roundHalfUpSigned(
        value.mantissa * BigInt.from(unit.gramsNumerator),
        value.scaleFactor * BigInt.from(unit.gramsDenominator),
      ),
    );
  }
}
