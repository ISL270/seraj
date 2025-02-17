part of 'daleel_details_bloc.dart';

final class DaleelDetailsState {
  final Daleel daleel;
  final ChangeType action;
  final VoidStatus status;

  const DaleelDetailsState._(
    this.daleel,
    this.action,
    this.status,
  );

  DaleelDetailsState copyWith({
    Daleel? daleel,
    ChangeType? action,
    VoidStatus? status,
  }) {
    return DaleelDetailsState._(
      daleel ?? this.daleel,
      action ?? this.action,
      status ?? this.status,
    );
  }

  factory DaleelDetailsState.initialized(Daleel daleel) =>
      DaleelDetailsState._(daleel, ChangeType.initial, const Initial());

  DaleelDetailsState daleelUpdated(Daleel daleel) =>
      DaleelDetailsState._(daleel, ChangeType.updated, const Success(null));

  DaleelDetailsState daleelDeleted() =>
      DaleelDetailsState._(daleel, ChangeType.deleted, const Success(null));

  DaleelDetailsState daleelFailure(GenericException exception) =>
      DaleelDetailsState._(daleel, action, status.toFailure(exception));
}
