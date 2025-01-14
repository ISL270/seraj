// ignore_for_file: unused_element, must_be_immutable, strict_raw_type

part of 'daleel_bloc.dart';

final class DaleelState extends Equatable {
  bool filterDaleelTypeActive;
  bool filterPriorityActive;
  bool filterDateActive;
  DaleelType selectedDaleelType;
  double selectedPriority;
  // DateTime selectedDate;

  final PaginatedResult<Daleel> daleels;
  final String searchTerm;
  VoidStatus status;

  DaleelState({
    this.filterDaleelTypeActive = false,
    this.filterPriorityActive = false,
    this.filterDateActive = false,
    this.selectedDaleelType = DaleelType.others,
    this.selectedPriority = 0,
    // this.selectedDate = DateTime.now(),
    this.searchTerm = '',
    this.daleels = const PaginatedResult(),
    this.status = const Initial(),
  });

  DaleelState._({
    required this.filterDaleelTypeActive,
    required this.filterPriorityActive,
    required this.filterDateActive,
    required this.selectedDaleelType,
    required this.selectedPriority,
    // required this.selectedDate,
    required this.searchTerm,
    required this.daleels,
    required this.status,
  });

  DaleelState._initial()
      : this._(
          filterDaleelTypeActive: false,
          filterPriorityActive: false,
          filterDateActive: false,
          selectedDaleelType: DaleelType.hadith,
          selectedPriority: 0,
          searchTerm: '',
          daleels: const PaginatedResult(),
          // selectedDate: DateTime.now(),
          status: const Initial(),
        );

  DaleelState copyWith({
    bool? filterDaleelTypeActive,
    bool? filterPriorityActive,
    bool? filterDateActive,
    DaleelType? selectedDaleelType,
    double? selectedPriority,
    DateTime? selectedDate,
    String? searchTerm,
    PaginatedResult<Daleel>? daleels,
    VoidStatus? status,
  }) =>
      DaleelState._(
        filterDaleelTypeActive: filterDaleelTypeActive ?? this.filterDaleelTypeActive,
        filterPriorityActive: filterPriorityActive ?? this.filterPriorityActive,
        filterDateActive: filterDateActive ?? this.filterDateActive,
        selectedDaleelType: selectedDaleelType ?? this.selectedDaleelType,
        selectedPriority: selectedPriority ?? this.selectedPriority,
        // selectedDate: selectedDate ?? this.selectedDate,
        searchTerm: searchTerm ?? this.searchTerm,
        daleels: daleels ?? this.daleels,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [
        filterDaleelTypeActive,
        filterPriorityActive,
        filterDateActive,
        selectedDaleelType,
        selectedPriority,
        // selectedDate,
        searchTerm,
        daleels,
        status,
      ];
}
