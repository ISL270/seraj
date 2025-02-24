import 'dart:developer';

import 'package:athar/app/core/models/bloc_event_transformers.dart';
import 'package:athar/app/core/models/paginated_result.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:athar/app/features/dua/presentation/models/dua_filters.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaState> {
  final DuaRepository _repository;
  final TextEditingController tagSearchController = TextEditingController();

  DuaBloc(this._repository) : super(DuaState._initial()) {
    on<DuaSearched>(_onSearched);
    on<_DuaSubscriptionRequested>(_onSubscriptionRequested);
    on<DuaFavouriteToggled>(toggleFavouriteDua);
    on<DuaFiltered>(_onFilterUpdate);
    on<DuaTagSearched>(_onSearchedTags);

    on<DuaNextPageFetched>(
      _onNextPageFetched,
      transformer: EventTransformers.throttleDroppable(),
    );
    add(const DuaSearched(''));
    add(_DuaSubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _DuaSubscriptionRequested event,
    Emitter<DuaState> emit,
  ) async {
    await emit.onEach(
      _repository.watchCollection(),
      onData: (status) => add(DuaSearched(state.searchTerm)),
    );
  }

  Future<void> _onSearched(DuaSearched event, Emitter<DuaState> emit) async {
    emit(state._copyWith(searchTerm: event.searchTerm));

    final searchResult = await _repository.searchDua(
      page: 0,
      event.searchTerm,
      pageSize: state.result.pageSize,
      filters: state.duaFilters,
    );

    emit(state._copyWith(
      searchTerm: event.searchTerm,
      duas: PaginatedResult.firstPage(searchResult),
    ));
  }

  Future<void> _onNextPageFetched(
    DuaNextPageFetched event,
    Emitter<DuaState> emit,
  ) async {
    if (state.result.hasReachedMax) return;

    final searchResult = await _repository.searchDua(
      state.searchTerm,
      page: state.result.page + 1,
      filters: state.duaFilters,
      pageSize: state.result.pageSize,
    );

    emit(state._copyWith(duas: state.result.appendResult(searchResult)));
  }

  List<Tag> getTags() => _repository.getTags();

  void toggleFavouriteDua(
    DuaFavouriteToggled event,
    Emitter<DuaState> emit,
  ) {
    _repository.toggleFavourite(event.dua);
  }

  void deleteDua(int? id) {
    if (id != null) {
      _repository.delete(id);
      add(const DuaSearched(''));
    }
  }

  Future<void> _onFilterUpdate(
    DuaFiltered event,
    Emitter<DuaState> emit,
  ) async {
    if (state.duaFilters == event.filters) return;
    emit(state._copyWith(duaFilters: event.filters));
    add(DuaSearched(state.searchTerm));
  }

  void _onSearchedTags(
    DuaTagSearched event,
    Emitter<DuaState> emit,
  ) {
    emit(state._copyWith(searchedTags: getTags()));
    final selectedTags = state.searchedTags; // Ensure all Tags is initialized

    final filteredTags = selectedTags
        .where((tag) => tag.name.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    log('Filtered Tags: ${filteredTags.map((t) => t.name).toList()}'); // Debugging log

    emit(state._copyWith(searchedTags: filteredTags));
  }

  @override
  Future<void> close() {
    tagSearchController.dispose();
    return super.close();
  }
}
