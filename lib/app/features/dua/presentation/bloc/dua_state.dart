part of 'dua_bloc.dart';

final class DuaState extends Equatable {
  final VoidStatus status;
  final String searchTerm;
  final PaginatedResult<Dua> duas;

  const DuaState({
    this.searchTerm = '',
    this.status = const Initial(),
    this.duas = const PaginatedResult(),
  });

  DuaState copyWith({
    VoidStatus? status,
    String? searchTerm,
    PaginatedResult<Dua>? dua,
  }) {
    return DuaState(
      status: status ?? this.status,
      duas: dua ?? this.duas,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [status, searchTerm, Dua];
}
