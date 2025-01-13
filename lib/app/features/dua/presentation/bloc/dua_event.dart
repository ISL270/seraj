part of 'dua_bloc.dart';

sealed class DuaEvent extends Equatable {
  const DuaEvent();

  @override
  List<Object> get props => [];
}

final class DuaSearched extends DuaEvent {
  final String searchTerm;

  const DuaSearched(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}

final class _DuaSubscriptionRequested extends DuaEvent {}

final class DuaNextPageFetched extends DuaEvent {}

/// New event for adding a Dua to favorites
final class DuaAddToFavorite extends DuaEvent {
  final String duaId;
  final bool currantStatus;

  const DuaAddToFavorite(this.duaId, this.currantStatus);

  @override
  List<Object> get props => [duaId, currantStatus];
}
