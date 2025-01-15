import 'dart:math';

import 'package:athar/app/features/daleel/domain/models/priority.dart';

extension DoubleX on double {
  double roundTo([int decimalPlaces = 1]) {
    final factor = pow(10, decimalPlaces);
    return (this * factor).round() / factor;
  }

  Priority getPriority() {
    if (this == 0.0) {
      return Priority.normal;
    } else if (this == 1.0) {
      return Priority.high;
    } else {
      return Priority.urgent;
    }
  }
}
