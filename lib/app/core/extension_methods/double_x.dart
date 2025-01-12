import 'dart:math';

extension DoubleX on double {
  double roundTo([int decimalPlaces = 1]) {
    final factor = pow(10, decimalPlaces);
    return (this * factor).round() / factor;
  }
}
