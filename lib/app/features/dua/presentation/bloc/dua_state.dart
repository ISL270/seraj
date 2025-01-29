part of 'dua_bloc.dart';

final class DuaScreenState extends Equatable {
  final String searchTerm;
  final PaginatedResult<Dua> result;

  const DuaScreenState._({
    required this.result,
    required this.searchTerm,
  });

  DuaScreenState._initial()
      : this._(
          searchTerm: '',
          result: PaginatedResult.empty(),
        );

  DuaScreenState _copyWith({
    String? searchTerm,
    PaginatedResult<Dua>? result,
  }) {
    return DuaScreenState._(
      result: result ?? this.result,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [searchTerm, result];
}
