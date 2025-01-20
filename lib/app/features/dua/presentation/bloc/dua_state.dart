part of 'dua_bloc.dart';

final class DuaScreenState extends Equatable {
  final VoidStatus status;
  final String searchTerm;
  final PaginatedResult<Dua> paginatedResult;

  const DuaScreenState._({
    required this.paginatedResult,
    required this.status,
    required this.searchTerm,
  });

  DuaScreenState._initial()
      : this._(
          searchTerm: '',
          status: const Initial(),
          paginatedResult: PaginatedResult.empty(),
        );

  DuaScreenState _copyWith({
    VoidStatus? status,
    String? searchTerm,
    PaginatedResult<Dua>? duas,
  }) {
    return DuaScreenState._(
      paginatedResult: duas ?? this.paginatedResult,
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [status, searchTerm, paginatedResult];
}
