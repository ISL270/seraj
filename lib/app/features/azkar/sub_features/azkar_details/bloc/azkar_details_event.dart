// ignore_for_file: unused_element

part of 'azkar_details_bloc.dart';

sealed class _AzkarDetailsEvent extends Equatable {
  const _AzkarDetailsEvent();

  @override
  List<Object> get props => [];
}

final class _SubscriptionRequested extends _AzkarDetailsEvent {
  const _SubscriptionRequested();
}

final class AzkarFavouriteToggled extends _AzkarDetailsEvent {
  const AzkarFavouriteToggled();
}

final class AzkarDeleted extends _AzkarDetailsEvent {
  const AzkarDeleted();
}

class IncrementCounter extends _AzkarDetailsEvent {}

class ResetCounter extends _AzkarDetailsEvent {}
