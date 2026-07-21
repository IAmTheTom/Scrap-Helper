import '../calculation/integer_rounding.dart';
import 'decimal_value.dart';

abstract final class MileageInput {
  static int milesToMilli(String input) {
    final value = DecimalValue.parse(input);
    if (value.mantissa.isNegative) {
      throw const FormatException('Miles cannot be negative');
    }
    return checkedToInt(
      roundHalfUpSigned(value.mantissa * BigInt.from(1000), value.scaleFactor),
    );
  }
}
