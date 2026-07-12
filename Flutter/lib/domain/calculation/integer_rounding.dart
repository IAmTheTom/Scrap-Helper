BigInt roundHalfUpSigned(BigInt numerator, BigInt denominator) {
  if (denominator <= BigInt.zero) {
    throw ArgumentError('denominator must be positive');
  }
  if (numerator == BigInt.zero) return BigInt.zero;
  final sign = numerator.isNegative ? -BigInt.one : BigInt.one;
  return sign * ((numerator.abs() + denominator ~/ BigInt.two) ~/ denominator);
}

int checkedToInt(BigInt value) {
  final max = BigInt.parse('9223372036854775807');
  final min = BigInt.parse('-9223372036854775808');
  if (value > max || value < min) {
    throw RangeError('Value exceeds signed 64-bit integer range');
  }
  return value.toInt();
}
