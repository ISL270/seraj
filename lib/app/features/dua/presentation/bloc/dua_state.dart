part of 'dua_bloc.dart';

final class DuaScreenState extends Equatable {
  final VoidStatus status;
  final String searchTerm;
  final PaginatedResult<Dua> duas;

  const DuaScreenState({
    this.searchTerm = '',
    this.status = const Initial(),
    this.duas = const PaginatedResult(),
  });

  DuaScreenState copyWith({
    VoidStatus? status,
    String? searchTerm,
    PaginatedResult<Dua>? dua,
  }) {
    return DuaScreenState(
      status: status ?? this.status,
      duas: dua ?? this.duas,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [status, searchTerm, Dua];
}
