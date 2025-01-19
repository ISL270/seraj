import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum Priority {
  normal,
  high,
  urgent;

  factory Priority.fromDouble(double value) => switch (value.toInt()) {
        0 => Priority.normal,
        1 => Priority.high,
        2 => Priority.urgent,
        _ => throw ArgumentError('Value must be 0.0, 1.0, or 2.0'),
      };

  static String translate(BuildContext context, double value) => switch (value.toInt()) {
        0 => context.l10n.normal,
        1 => context.l10n.high,
        2 => context.l10n.urgent,
        _ => throw ArgumentError('Value must be 0.0, 1.0, or 2.0'),
      };

  String toTranslate(BuildContext context) => switch (this) {
        Priority.normal => context.l10n.normal,
        Priority.high => context.l10n.high,
        Priority.urgent => context.l10n.urgent,
      };

  bool get isUrgent => this == Priority.urgent;
  bool get isHigh => this == Priority.high;
  bool get isNormal => this == Priority.normal;
}
