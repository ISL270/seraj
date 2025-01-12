// ignore_for_file: unnecessary_statements

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/paginated_result.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'daleel_event.dart';
part 'daleel_state.dart';

@injectable
class DaleelBloc extends Bloc<DaleelEvent, DaleelState> {
  final DaleelRepository _repository;

  DaleelBloc(this._repository) : super(DaleelState._initial()) {
    on<DaleelFetchData>(_daleelFetchData);
    on<DaleelEvent>((event, emit) {
      if (event is DaleelTypeFilterChanged) {
        emit(state.copyWith(selectedDaleelType: event.daleelType));
      } else if (event is DaleelPriorityFilterChanged) {
        emit(state.copyWith(selectedPriority: event.priority));
      } else if (event is DaleelDateFilterChanged) {
        emit(state.copyWith(selectedDate: event.date));
      }
    });
    add(DaleelFetchData());
  }

  Future<void> _daleelFetchData(
    DaleelFetchData event,
    Emitter<DaleelState> emit,
  ) async {
    log('daleel fetch data');
    log(state.daleels.result.length.toString());
    await emit.onEach(
      _repository.stream(),
      onData: (status) => switch (status) {
        Loading<void>() => state.daleels.result.isEmpty
            ? emit(state.copyWith(status: state.status.toLoading()))
            : {},
        Success<void>() => add(DaleelSearchChanged(state.searchTerm)),
        Failure<void>(exception: final e) => emit(state.copyWith(status: Failure(e))),
        _ => {},
      },
    );
  }
}
