// ignore_for_file: unnecessary_statements

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/bloc_event_transformers.dart';
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

  DaleelBloc(this._repository) : super(DaleelState()) {
    on<DaleelFetchData>(_daleelFetchData);
    on<DaleelSearchFetched>(_onSearched);
    on<DaleelNextPageFetched>(
      _onNextPageFetched,
      transformer: EventTransformers.throttleDroppable(),
    );
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
    // log('daleel fetch data');
    // log(state.daleels.result.length.toString());
    await emit.forEach(
      _repository.stream(),
      onData: (status) {
        if (status.isSuccess) {
          add(DaleelSearchFetched(state.searchTerm));
        }
        return state;
      },
    );
  }

  // onData: (status) => switch (status) {
  //   Loading<void>() => state.daleels.result.isEmpty
  //       ? emit(state.copyWith(status: state.status.toLoading()))
  //       : {},
  //   Success<void>() => add(DaleelSearchFetched(state.searchTerm)),
  //   Failure<void>(exception: final e) => emit(state.copyWith(status: Failure(e))),
  //   _ => {},
  // },

  Future<void> _onSearched(
    DaleelSearchFetched event,
    Emitter<DaleelState> emit,
  ) async {
    emit(state.copyWith(searchTerm: event.searchTerm, status: const Loading()));

    final searchResult = await _repository.searchDaleel(
      page: 0,
      event.searchTerm,
      pageSize: state.daleels.pageSize,
    );

    emit(state.copyWith(
      daleels: PaginatedResult(result: searchResult),
      status: const Success(null),
    ));
  }

  Future<void> _onNextPageFetched(
    DaleelNextPageFetched event,
    Emitter<DaleelState> emit,
  ) async {
    if (state.daleels.hasReachedMax) return;

    final searchResult = await _repository.searchDaleel(
      state.searchTerm,
      page: state.daleels.page + 1,
      pageSize: state.daleels.pageSize,
    );

    emit(state.copyWith(
      status: const Success(null),
      daleels: state.daleels.appendResult(
        searchResult,
        hasReachedMax: searchResult.length < state.daleels.pageSize,
      ),
    ));
  }

  @override
  Future<void> close() {
    _repository.dispMethod();
    return super.close();
  }
}
