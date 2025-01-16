import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dua_details_event.dart';

typedef DuaState = Status<Dua>;

class DuaDetailsBloc extends Bloc<_DuaDetailsEvent, DuaState> {
  final DuaRepository repository;

  DuaDetailsBloc(this.repository, Dua dua) : super(Initial(dua)) {
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<DuaFavouriteToggled>(_onDuaFavouriteToggled);
    on<DuaDeleted>(_onDuaDeleted);

    add(const _SubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<DuaState> emit,
  ) async {
    await emit.onEach(
      repository.watchLocalObject(state.data!.id),
      onData: (dua) {
        if (dua != null) {
          emit(Success(dua));
        }
      },
    );
  }

  Future<void> _onDuaFavouriteToggled(
    DuaFavouriteToggled event,
    Emitter<DuaState> emit,
  ) async {
    try {
      await repository.toggleFavorite(state.data!);
    } catch (e) {
      emit(state.toFailure(e as GenericException));
    }
  }

  Future<void> _onDuaDeleted(
    DuaDeleted event,
    Emitter<DuaState> emit,
  ) async {
    try {
      await repository.(state.data!.id);
    } catch (e) {
      emit(state.toFailure(e as GenericException));
    }
  }
}
