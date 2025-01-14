import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:equatable/equatable.dart';

final class DaleelFilters with EquatableMixin {
  final Set<DaleelType> daleelType = {};
  final Set<Priority> priority = {};
  final Set<DateTime> date = {};

  bool get isEmpty => daleelType.isEmpty && priority.isEmpty && date.isEmpty;

  @override
  List<Object?> get props => [daleelType, priority, date];

  DaleelFilters clone() {
    return DaleelFilters()
      ..daleelType.addAll(daleelType)
      ..priority.addAll(priority)
      ..date.addAll(date);
  }
}
