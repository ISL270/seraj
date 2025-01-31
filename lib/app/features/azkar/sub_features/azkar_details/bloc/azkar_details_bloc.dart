// ignore_for_file: unused_field, unused_element, library_private_types_in_public_api

import 'package:athar/app/core/enums/change_type.dart';
import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/domain/azkar_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'azkar_details_event.dart';
part 'azkar_details_state.dart';

class AzkarDetailsBloc extends Bloc<_AzkarDetailsEvent, AzkarDetailsState> {
  final AzkarRepository _repository;
  AzkarDetailsBloc(this._repository, Azkar azkar) : super(AzkarDetailsState.initialized(azkar)) {
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<AzkarFavouriteToggled>(_onAzkarFavouriteToggled);
    on<AzkarDeleted>(onAzkarDeleted);
    //used for counter
    on<IncrementCounter>(_onIncrement);
    on<DecrementCounter>(_onDecrement);

    add(const _SubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<AzkarDetailsState> emit,
  ) async {
    await emit.forEach(
      _repository.watchObject(state.azkar.id!),
      onData: (azkar) {
        if (azkar == null) {
          return state.azkarDeleted();
        }
        if (event is AzkarFavouriteToggled) {
          return state.azkar.isFavourite != azkar.isFavourite ? state.azkarUpdated(azkar) : state;
        }

        return state.azkarUpdated(azkar);
      },
    );
  }

  void _onAzkarFavouriteToggled(
    AzkarFavouriteToggled event,
    Emitter<AzkarDetailsState> emit,
  ) =>
      _repository.toggleFavorite(state.azkar);

  void onAzkarDeleted(AzkarDeleted event, Emitter<AzkarDetailsState> emit) =>
      _repository.deleteDoc(state.azkar.id!);

  void _onIncrement(IncrementCounter event, Emitter<AzkarDetailsState> emit) {
    if (state.counterValue < state.azkar.noOfRepetitions) {
      emit(state.copyWith(counterValue: state.counterValue + 1));
    }
  }

  void _onDecrement(DecrementCounter event, Emitter<AzkarDetailsState> emit) {
    if (state.counterValue > 1) {
      emit(state.copyWith(counterValue: state.counterValue - 1));
    }
  }
}
