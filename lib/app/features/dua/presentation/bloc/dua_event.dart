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

final class DuaFiltered extends DuaEvent {
  final FavouriteFilters filters;

  const DuaFiltered(this.filters);
}

final class DuaFavouriteToggled extends DuaEvent {
  final Dua dua;

  const DuaFavouriteToggled(this.dua);

  @override
  List<Object> get props => [dua];
}
