import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum Priority {
  urgent,
  high,
  normal;
}

extension PriorityX on Priority {
  bool get isUrgent => this == Priority.urgent;
  bool get isHigh => this == Priority.high;
  bool get isNormal => this == Priority.normal;
}

extension PriorityExtension on BuildContext {
  String priorityTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return context.l10n.normal;
      case 1:
        return context.l10n.high;
      case 2:
        return context.l10n.urgent;
      default:
        throw ArgumentError('index must be 0, 1 or 2');
    }
  }
}

extension PriorityExtension2 on double {
  String getPriority(BuildContext context) {
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
