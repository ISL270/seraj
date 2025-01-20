part of 'dua_bloc.dart';

final class DuaScreenState extends Equatable {
  final VoidStatus status;
  final String searchTerm;
  final PaginatedResult<Dua> duas;

  const DuaScreenState._({
    required this.duas,
    required this.status,
    required this.searchTerm,
  });

  DuaScreenState._initial()
      : this._(
          searchTerm: '',
          status: const Initial(),
          duas: PaginatedResult.empty(),
        );

  DuaScreenState copyWith({
    VoidStatus? status,
    String? searchTerm,
    PaginatedResult<Dua>? duas,
  }) {
    return DuaScreenState._(
      duas: duas ?? this.duas,
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [status, searchTerm, duas];
}
