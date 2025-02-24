import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:equatable/equatable.dart';

final class DaleelFilters with EquatableMixin {
  final Set<DaleelType> daleelType = {};
  final Set<Priority> priority = {};
  final Set<DateTime> date = {};
  final Set<Tag> tag = {};

  bool get isEmpty => daleelType.isEmpty && priority.isEmpty && date.isEmpty && tag.isEmpty;

  @override
  List<Object?> get props => [daleelType, priority, tag, date];

  DaleelFilters clone() {
    return DaleelFilters()
      ..daleelType.addAll(daleelType)
      ..priority.addAll(priority)
      ..tag.addAll(tag)
      ..date.addAll(date);
  }
}
