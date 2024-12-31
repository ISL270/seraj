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
