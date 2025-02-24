// ignore_for_file: unused_element, must_be_immutable, strict_raw_type

part of 'daleel_bloc.dart';

final class DaleelState extends Equatable {
  bool filterDaleelTypeActive;
  bool filterPriorityActive;
  bool filterDateActive;
  DaleelType selectedDaleelType;
  double selectedPriority;
  final PaginatedResult<Daleel> daleels;
  final DaleelFilters daleelFilters;
  final String searchTerm;
  VoidStatus status;
  List<Tag> searchedTags;

  DaleelState._({
    required this.filterDaleelTypeActive,
    required this.filterPriorityActive,
    required this.filterDateActive,
    required this.selectedDaleelType,
    required this.selectedPriority,
    required this.daleelFilters,
    required this.searchTerm,
    required this.daleels,
    required this.status,
    required this.searchedTags,
  });

  DaleelState._initial()
      : this._(
          filterDaleelTypeActive: false,
          filterPriorityActive: false,
          filterDateActive: false,
          selectedDaleelType: DaleelType.hadith,
          selectedPriority: 0,
          searchTerm: '',
          daleels: PaginatedResult.empty(),
          searchedTags: [],
          status: const Initial(),
          daleelFilters: DaleelFilters(),
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
    List<Tag>? searchedTags,
    VoidStatus? status,
    DaleelFilters? daleelFilters,
  }) =>
      DaleelState._(
        filterDaleelTypeActive: filterDaleelTypeActive ?? this.filterDaleelTypeActive,
        filterPriorityActive: filterPriorityActive ?? this.filterPriorityActive,
        filterDateActive: filterDateActive ?? this.filterDateActive,
        selectedDaleelType: selectedDaleelType ?? this.selectedDaleelType,
        selectedPriority: selectedPriority ?? this.selectedPriority,
        searchTerm: searchTerm ?? this.searchTerm,
        daleels: daleels ?? this.daleels,
        searchedTags: searchedTags ?? this.searchedTags,
        status: status ?? this.status,
        daleelFilters: daleelFilters ?? this.daleelFilters,
      );

  @override
  List<Object> get props => [
        filterDaleelTypeActive,
        filterPriorityActive,
        filterDateActive,
        selectedDaleelType,
        selectedPriority,
        searchTerm,
        searchedTags,
        daleels,
        status,
        daleelFilters,
      ];
}
