import 'package:athar/app/core/enums/change_type.dart';
import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'daleel_details_event.dart';
part 'daleel_details_state.dart';

class DaleelDetailsBloc extends Bloc<_DaleelDetailsEvent, DaleelDetailsState> {
  final DaleelRepository _repository;
  DaleelDetailsBloc(this._repository, Daleel daleel)
      : super(DaleelDetailsState.initialized(daleel)) {
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<DaleelDeleted>(_onDaleelDeleted);

    add(_SubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<DaleelDetailsState> emit,
  ) async {
    await emit.forEach(
      _repository.watchObject(state.daleel.id!),
      onData: (daleel) {
        if (daleel == null) {
          return state.daleelDeleted();
        }
        return state.daleelUpdated(daleel);
      },
    );
  }

  void _onDaleelDeleted(DaleelDeleted event, Emitter<DaleelDetailsState> emit) =>
      _repository.deleteDoc(state.daleel.id!);
}
