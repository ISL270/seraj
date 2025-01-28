part of 'dua_details_bloc.dart';

sealed class _DuaDetailsEvent extends Equatable {
  const _DuaDetailsEvent();

  @override
  List<Object> get props => [];
}

final class _SubscriptionRequested extends _DuaDetailsEvent {
  const _SubscriptionRequested();
}

final class DuaFavouriteToggled extends _DuaDetailsEvent {
  const DuaFavouriteToggled();
}

final class DuaDeleted extends _DuaDetailsEvent {
  const DuaDeleted();
}
