import 'package:athar/app/core/enums/change_type.dart';
import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dua_details_event.dart';
part 'dua_details_state.dart';

class DuaDetailsBloc extends Bloc<_DuaDetailsEvent, DuaDetailsState> {
  final DuaRepository repository;

  DuaDetailsBloc(this.repository, Dua dua) : super(DuaDetailsState.initialized(dua)) {
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<DuaFavouriteToggled>(_onDuaFavouriteToggled);
    on<DuaDeleted>(_onDuaDeleted);

    add(const _SubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<DuaDetailsState> emit,
  ) async {
    await emit.forEach(
      repository.watchLocalObject(state.dua.id),
      onData: (dua) {
        if (dua == null) {
          return state.duaDeleted();
        }
        return state.duaUpdated(dua);
      },
    );
  }

  Future<void> _onDuaFavouriteToggled(
    DuaFavouriteToggled event,
    Emitter<DuaDetailsState> emit,
  ) async {
    try {
      await repository.toggleFavourite(state.dua);
    } catch (e) {
      emit(state.failure(e as GenericException));
    }
  }

  Future<void> _onDuaDeleted(
    DuaDeleted event,
    Emitter<DuaDetailsState> emit,
  ) async {
    try {
      await repository.deleteDoc(state.dua.id);
    } catch (e) {
      emit(state.failure(e as GenericException));
    }
  }
}
