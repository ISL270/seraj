part of 'dua_details_bloc.dart';

final class DuaDetailsState {
  final Dua dua;
  final ChangeType action;
  final VoidStatus status;

  const DuaDetailsState._(this.dua, this.action, this.status);

  factory DuaDetailsState.initialized(Dua dua) => DuaDetailsState._(
        dua,
        ChangeType.initial,
        const Initial(),
      );

  DuaDetailsState duaUpdated(Dua dua) => DuaDetailsState._(
        dua,
        ChangeType.updated,
        const Success(null),
      );

  DuaDetailsState duaDeleted() => DuaDetailsState._(
        dua,
        ChangeType.deleted,
        const Success(null),
      );

  DuaDetailsState failure(GenericException exception) => DuaDetailsState._(
        dua,
        action,
        status.toFailure(exception),
      );
}
