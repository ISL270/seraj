part of 'azkar_details_bloc.dart';

final class AzkarDetailsState {
  final Azkar azkar;
  final ChangeType action;
  final VoidStatus status;
  final int counterValue;

  const AzkarDetailsState._(this.azkar, this.action, this.status, this.counterValue);

  AzkarDetailsState copyWith({
    int? counterValue,
    Azkar? azkar,
    ChangeType? action,
    VoidStatus? status,
  }) {
    return AzkarDetailsState._(
      azkar ?? this.azkar,
      action ?? this.action,
      status ?? this.status,
      counterValue ?? this.counterValue,
    );
  }

  factory AzkarDetailsState.initialized(Azkar azkar) =>
      AzkarDetailsState._(azkar, ChangeType.initial, const Initial(), 1);

  AzkarDetailsState azkarUpdated(Azkar azkar) =>
      AzkarDetailsState._(azkar, ChangeType.updated, const Success(null), counterValue);

  AzkarDetailsState azkarDeleted() =>
      AzkarDetailsState._(azkar, ChangeType.deleted, const Success(null), counterValue);

  AzkarDetailsState failure(GenericException exception) =>
      AzkarDetailsState._(azkar, action, status.toFailure(exception), counterValue);
}
