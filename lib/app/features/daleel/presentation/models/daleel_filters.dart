import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:equatable/equatable.dart';

final class DaleelFilters with EquatableMixin {
  final Set<DaleelType> daleelType;
  final Set<Priority> priority;
  final Set<DateTime> date;

  DaleelFilters({
    this.daleelType = const {},
    this.priority = const {},
    this.date = const {},
  });

  bool get isEmpty => daleelType.isEmpty && priority.isEmpty && date.isEmpty;

  bool apply(Daleel daleel) {
    if (daleelType.isNotEmpty && !daleelType.contains(daleel.daleelType)) {
      return false;
    }

    if (priority.isNotEmpty && !priority.contains(daleel.priority)) {
      return false;
    }

    return true;
  }

  @override
  List<Object?> get props => [daleelType, priority, date];

  DaleelFilters copyWith({
    Set<DaleelType>? daleelType,
    Set<Priority>? priority,
    Set<DateTime>? date,
  }) {
    return DaleelFilters(
      daleelType: daleelType ?? this.daleelType,
      priority: priority ?? this.priority,
      date: date ?? this.date,
    );
  }

  DaleelFilters clone() {
    return DaleelFilters()
      ..daleelType.addAll(daleelType)
      ..priority.addAll(priority)
      ..date.addAll(date);
  }
}
