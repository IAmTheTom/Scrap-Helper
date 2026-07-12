final class DecimalValue {
  const DecimalValue(this.mantissa, this.scaleFactor);

  final BigInt mantissa;
  final BigInt scaleFactor;

  static final _valid = RegExp(r'^[+-]?(?:\d+|\d+\.\d+|\.\d+)$');

  factory DecimalValue.parse(String input) {
    final value = input.trim();
    if (!_valid.hasMatch(value)) {
      throw const FormatException('Invalid decimal value');
    }

    final negative = value.startsWith('-');
    final unsigned = value.startsWith('-') || value.startsWith('+')
        ? value.substring(1)
        : value;
    final parts = unsigned.split('.');
    final whole = parts.first.isEmpty ? '0' : parts.first;
    final fraction = parts.length == 2 ? parts[1] : '';
    var mantissa = BigInt.parse('$whole$fraction');
    if (negative) mantissa = -mantissa;

    return DecimalValue(mantissa, BigInt.from(10).pow(fraction.length));
  }
}
