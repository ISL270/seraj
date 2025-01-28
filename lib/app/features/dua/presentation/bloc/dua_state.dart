part of 'dua_bloc.dart';

final class DuaScreenState extends Equatable {
  final VoidStatus status;
  final String searchTerm;
  final PaginatedResult<Dua> paginatedResult;
  final FavouriteFilters duaFilters;

  const DuaScreenState._({
    required this.paginatedResult,
    required this.status,
    required this.searchTerm,
    required this.duaFilters,
  });

  DuaScreenState._initial()
      : this._(
          searchTerm: '',
          status: const Initial(),
          paginatedResult: PaginatedResult.empty(),
          duaFilters: FavouriteFilters(),
        );

  DuaScreenState _copyWith({
    VoidStatus? status,
    String? searchTerm,
    PaginatedResult<Dua>? duas,
    FavouriteFilters? duaFilters,
  }) {
    return DuaScreenState._(
      paginatedResult: duas ?? paginatedResult,
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      duaFilters: duaFilters ?? this.duaFilters,
    );
  }

  @override
  List<Object> get props => [status, searchTerm, paginatedResult, duaFilters];
}
