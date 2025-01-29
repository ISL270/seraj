part of 'dua_details_bloc.dart';

final class DuaDetailsState {
  final Dua dua;
  final ChangeType action;

  const DuaDetailsState._(this.dua, this.action);

  factory DuaDetailsState.initialized(Dua dua) => DuaDetailsState._(dua, ChangeType.initial);

  DuaDetailsState duaUpdated(Dua dua) => DuaDetailsState._(dua, ChangeType.updated);

  DuaDetailsState duaDeleted() => DuaDetailsState._(dua, ChangeType.deleted);

  DuaDetailsState failure(GenericException exception) => DuaDetailsState._(dua, action);
}
