// ignore_for_file: unused_element, must_be_immutable, strict_raw_type

part of 'daleel_bloc.dart';

final class DaleelState extends Equatable with FormzMixin {
  bool filterDaleelTypeActive;
  bool filterPriorityActive;
  bool filterDateActive;
  DaleelType selectedDaleelType;
  double selectedPriority;
  DateTime selectedDate;
  VoidStatus status;

  DaleelState._({
    required this.filterDaleelTypeActive,
    required this.filterPriorityActive,
    required this.filterDateActive,
    required this.selectedDaleelType,
    required this.selectedPriority,
    required this.selectedDate,
    required this.status,
  });

  DaleelState._initial()
      : this._(
          filterDaleelTypeActive: false,
          filterPriorityActive: false,
          filterDateActive: false,
          selectedDaleelType: DaleelType.hadith,
          selectedPriority: 0,
          selectedDate: DateTime.now(),
          status: const Initial(),
        );

  DaleelState copyWith({
    bool? filterDaleelTypeActive,
    bool? filterPriorityActive,
    bool? filterDateActive,
    DaleelType? selectedDaleelType,
    double? selectedPriority,
    DateTime? selectedDate,
    VoidStatus? status,
  }) =>
      DaleelState._(
        filterDaleelTypeActive: filterDaleelTypeActive ?? this.filterDaleelTypeActive,
        filterPriorityActive: filterPriorityActive ?? this.filterPriorityActive,
        filterDateActive: filterDateActive ?? this.filterDateActive,
        selectedDaleelType: selectedDaleelType ?? this.selectedDaleelType,
        selectedPriority: selectedPriority ?? this.selectedPriority,
        selectedDate: selectedDate ?? this.selectedDate,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [
        filterDaleelTypeActive,
        filterPriorityActive,
        filterDateActive,
        selectedDaleelType,
        selectedPriority,
        selectedDate,
        status,
      ];

  @override
  List<FormzInput> get inputs => [];
}
