part of 'dua_bloc.dart';

final class DuaScreenState extends Equatable {
  final VoidStatus status;
  final String searchTerm;
  final PaginatedResult<Dua> duas;

  const DuaScreenState._({
    required this.status,
    required this.searchTerm,
    required this.duas,
  });

  const DuaScreenState._initial()
      : this._(
          status: const Initial(),
          searchTerm: '',
          duas: const PaginatedResult(),
        );

  DuaScreenState copyWith({
    VoidStatus? status,
    String? searchTerm,
    PaginatedResult<Dua>? duas,
  }) {
    return DuaScreenState._(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      duas: duas ?? this.duas,
    );
  }

  @override
  List<Object> get props => [status, searchTerm, duas];
}
