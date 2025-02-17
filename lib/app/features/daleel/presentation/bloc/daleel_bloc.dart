// ignore_for_file: unnecessary_statements

import 'dart:developer';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/bloc_event_transformers.dart';
import 'package:athar/app/core/models/paginated_result.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'daleel_event.dart';
part 'daleel_state.dart';

@injectable
class DaleelBloc extends Bloc<DaleelEvent, DaleelState> {
  final DaleelRepository _repository;

  DaleelBloc(this._repository) : super(DaleelState._initial()) {
    on<DaleelFiltered>(_onFilterUpdate);
    on<DaleelSearched>(_onSearched);
    on<DaleelSubscriptionRequested>(_onSubscriptionRequested);
    on<DaleelNextPageFetched>(
      _onNextPageFetched,
      transformer: EventTransformers.throttleDroppable(),
    );
    on<DaleelPriorityFilterChanged>((event, emit) {
      emit(state.copyWith(
        selectedPriority: event.priority,
        daleelFilters: state.daleelFilters,
      ));
      add(DaleelSearched(state.searchTerm));
    });
    add(DaleelSubscriptionRequested());
    add(const DaleelSearched(''));
  }

  Future<void> _onSubscriptionRequested(
    DaleelSubscriptionRequested event,
    Emitter<DaleelState> emit,
  ) async {
    await emit.onEach(
      _repository.watchCollection(),
      onData: (status) => add(DaleelSearched(state.searchTerm)),
    );
  }

  Future<void> _onSearched(
    DaleelSearched event,
    Emitter<DaleelState> emit,
  ) async {
    emit(state.copyWith(
      searchTerm: event.searchTerm,
      status: state.status.toLoading(),
    ));

    final searchResult = await _repository.searchDaleel(
      page: 0,
      event.searchTerm,
      filters: state.daleelFilters,
      pageSize: state.daleels.pageSize,
    );

    emit(state.copyWith(
      status: state.status.toSuccess(null),
      daleels: PaginatedResult.firstPage(searchResult),
    ));
  }

  Future<void> _onNextPageFetched(
    DaleelNextPageFetched event,
    Emitter<DaleelState> emit,
  ) async {
    if (state.daleels.hasReachedMax) return;

    final searchResult = await _repository.searchDaleel(
      state.searchTerm,
      filters: state.daleelFilters,
      page: state.daleels.page + 1,
      pageSize: state.daleels.pageSize,
    );

    emit(state.copyWith(
      status: state.status.toSuccess(null),
      daleels: state.daleels.appendResult(searchResult),
    ));
  }

  void delete({required int? id}) {
    if (id != null) {
      _repository.deleteByID(id);
      add(const DaleelSearched(''));
    }
  }

  void _onFilterUpdate(
    DaleelFiltered event,
    Emitter<DaleelState> emit,
  ) {
    log('filter updated');

    if (state.daleelFilters == event.filters) return;
    emit(state.copyWith(daleelFilters: event.filters));
    add(DaleelSearched(state.searchTerm));
  }
}
