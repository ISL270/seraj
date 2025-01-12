import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum Priority { normal, high, urgent }

extension PriorityX on Priority {
  bool get isUrgent => this == Priority.urgent;
  bool get isHigh => this == Priority.high;
  bool get isNormal => this == Priority.normal;
}

extension PriorityExtension on double {
  Priority getPriorityType() {
    switch (toInt()) {
      case 0:
        return Priority.normal;
      case 1:
        return Priority.high;
      case 2:
        return Priority.urgent;
      default:
        throw ArgumentError('Value must be 0.0, 1.0, or 2.0');
    }
  }

  String getPriorityName(BuildContext context) {
    switch (toInt()) {
      case 0:
        return context.l10n.normal;
      case 1:
        return context.l10n.high;
      case 2:
        return context.l10n.urgent;
      default:
        throw ArgumentError('Value must be 0.0, 1.0, or 2.0');
    }
  }
}
