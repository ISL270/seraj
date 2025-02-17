part of 'dua_bloc.dart';

final class DuaScreenState extends Equatable {
  final String searchTerm;
  final PaginatedResult<Dua> result;
  final FavouriteFilters duaFilters;

  const DuaScreenState._({
    required this.result,
    required this.searchTerm,
    required this.duaFilters,
  });

  DuaScreenState._initial()
      : this._(
          searchTerm: '',
          result: PaginatedResult.empty(),
          duaFilters: FavouriteFilters(),
        );

  DuaScreenState _copyWith({
    String? searchTerm,
    PaginatedResult<Dua>? duas,
    FavouriteFilters? duaFilters,
  }) {
    return DuaScreenState._(
      result: duas ?? result,
      searchTerm: searchTerm ?? this.searchTerm,
      duaFilters: duaFilters ?? this.duaFilters,
    );
  }

  @override
  List<Object> get props => [searchTerm, result, duaFilters];
}
