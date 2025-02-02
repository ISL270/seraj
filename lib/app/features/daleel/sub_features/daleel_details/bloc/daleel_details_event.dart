part of 'daleel_details_bloc.dart';

sealed class _DaleelDetailsEvent extends Equatable {
  const _DaleelDetailsEvent();

  @override
  List<Object> get props => [];
}

final class _SubscriptionRequested extends _DaleelDetailsEvent {}

final class DaleelDeleted extends _DaleelDetailsEvent {}
