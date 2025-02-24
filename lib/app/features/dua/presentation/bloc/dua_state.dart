// ignore_for_file: must_be_immutable

part of 'dua_bloc.dart';

final class DuaState extends Equatable {
  final String searchTerm;
  final PaginatedResult<Dua> result;
  final DuaFilters duaFilters;
  List<Tag> searchedTags;

  DuaState._({
    required this.result,
    required this.searchTerm,
    required this.duaFilters,
    required this.searchedTags,
  });

  DuaState._initial()
      : this._(
          searchTerm: '',
          result: PaginatedResult.empty(),
          duaFilters: DuaFilters(),
          searchedTags: [],
        );

  DuaState _copyWith({
    String? searchTerm,
    PaginatedResult<Dua>? duas,
    DuaFilters? duaFilters,
    List<Tag>? searchedTags,
  }) {
    return DuaState._(
      result: duas ?? result,
      searchTerm: searchTerm ?? this.searchTerm,
      duaFilters: duaFilters ?? this.duaFilters,
      searchedTags: searchedTags ?? this.searchedTags,
    );
  }

  @override
  List<Object> get props => [searchTerm, result, duaFilters, searchedTags];
}
