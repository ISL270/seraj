import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/bloc_event_transformers.dart';
import 'package:athar/app/core/models/domain/paginated_result.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaScreenState> {
  final DuaRepository _repository;

  DuaBloc(this._repository) : super(DuaScreenState._initial()) {
    on<_DuaSubscriptionRequested>(_onSubscriptionRequested);
    on<DuaSearched>(_onSearched);
    on<DuaNextPageFetched>(
      _onNextPageFetched,
      transformer: EventTransformers.throttleDroppable(),
    );

    add(_DuaSubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _DuaSubscriptionRequested event,
    Emitter<DuaScreenState> emit,
  ) async {
    await emit.onEach(
      _repository.stream(),
      onData: (status) => switch (status) {
        Loading<void>() => state.paginatedResult.elements.isEmpty
            // If no exercises are loaded yet emit loading state
            ? emit(state._copyWith(status: state.status.toLoading()))
            // If exercises already exist, do nothing
            : {},
        // If changes successfully happened in the repository, update the displayed result
        Success<void>() => add(DuaSearched(state.searchTerm)),
        Failure<void>(exception: final e) =>
          emit(state._copyWith(status: state.status.toFailure(e))),
        _ => {},
      },
    );
  }

  Future<void> _onSearched(DuaSearched event, Emitter<DuaScreenState> emit) async {
    emit(state._copyWith(
      searchTerm: event.searchTerm,
      status: state.status.toLoading(),
    ));

    final searchResult = await _repository.searchDua(
      page: 0,
      event.searchTerm,
      pageSize: state.paginatedResult.pageSize,
    );

    emit(state._copyWith(
      status: state.status.toSuccess(null),
      duas: PaginatedResult.firstPage(searchResult),
    ));
  }

  Future<void> _onNextPageFetched(
    DuaNextPageFetched event,
    Emitter<DuaScreenState> emit,
  ) async {
    if (state.paginatedResult.hasReachedMax) return;

    final searchResult = await _repository.searchDua(
      state.searchTerm,
      page: state.paginatedResult.page + 1,
      pageSize: state.paginatedResult.pageSize,
    );

    emit(state._copyWith(
      status: state.status.toSuccess(null),
      duas: state.paginatedResult.appendResult(searchResult),
    ));
  }
}
