// ignore_for_file: inference_failure_on_function_invocation, unused_field, unused_local_variable

import 'dart:developer';

import 'package:athar/app/core/models/bloc_event_transformers.dart';
import 'package:athar/app/core/models/paginated_result.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/domain/azkar_repository.dart';
import 'package:athar/app/features/azkar/presentation/models/azkar_filters.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'azkar_event.dart';
part 'azkar_state.dart';

@injectable
class AzkarBloc extends Bloc<AzkarEvent, AzkarState> {
  final AzkarRepository _repository;
  final TextEditingController tagSearchController = TextEditingController();

  AzkarBloc(this._repository) : super(AzkarState._initial()) {
    on<AzkarSubscriptionRequested>(_onSubscriptionRequested);
    on<AzkarSearched>(_onSearched);
    on<AzkarTagSearched>(_onSearchedTags);
    on<AzkarFavourited>(toggleFavouriteAzkar);
    on<AzkarDeleted>(deleteAzkar);
    on<AzkarFiltered>(_onFilterUpdate);
    on<AzkarNextPageFetched>(
      _onNextPageFetched,
      transformer: EventTransformers.throttleDroppable(),
    );

    add(const AzkarSearched(''));
    add(AzkarSubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    AzkarSubscriptionRequested event,
    Emitter<AzkarState> emit,
  ) async {
    await emit.onEach(
      _repository.watchCollection(),
      onData: (status) => add(AzkarSearched(state.searchTerm)),
    );
  }

  Future<void> _onSearched(AzkarSearched event, Emitter<AzkarState> emit) async {
    emit(state._copyWith(searchTerm: event.searchTerm));

    final searchResult = _repository.searchAzkar(
      page: 0,
      event.searchTerm,
      pageSize: state.azkars.pageSize,
      filters: state.azkarFilters,
    );

    emit(state._copyWith(
      searchTerm: event.searchTerm,
      azkars: PaginatedResult.firstPage(searchResult),
    ));
  }

  Future<void> _onNextPageFetched(AzkarNextPageFetched event, Emitter<AzkarState> emit) async {
    if (state.azkars.hasReachedMax) return;

    final searchResult = _repository.searchAzkar(
      state.searchTerm,
      page: state.azkars.page + 1,
      filters: state.azkarFilters,
      pageSize: state.azkars.pageSize,
    );

    emit(state._copyWith(azkars: state.azkars.appendResult(searchResult)));
  }

  Future<void> _onFilterUpdate(
    AzkarFiltered event,
    Emitter<AzkarState> emit,
  ) async {
    log('filter updated');
    if (state.azkarFilters == event.filters) return;
    emit(state._copyWith(filters: event.filters));
    add(AzkarSearched(state.searchTerm));
  }

  List<Tag> getTags() => _repository.getTags();

  void _onSearchedTags(
    AzkarTagSearched event,
    Emitter<AzkarState> emit,
  ) {
    emit(state._copyWith(searchedTags: getTags()));
    final selectedTags = state.searchedTags; // Ensure all Tags is initialized

    final filteredTags = selectedTags
        .where((tag) => tag.name.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    log('Filtered Tags: ${filteredTags.map((t) => t.name).toList()}'); // Debugging log

    emit(state._copyWith(searchedTags: filteredTags));
  }

  void toggleFavouriteAzkar(
    AzkarFavourited event,
    Emitter<AzkarState> emit,
  ) {
    _repository.toggleFavorite(event.azkar);
  }

  void deleteAzkar(
    AzkarDeleted event,
    Emitter<AzkarState> emit,
  ) {
    _repository.delete(event.id);
    add(const AzkarSearched(''));
  }

  @override
  Future<void> close() {
    tagSearchController.dispose();
    return super.close();
  }
}
