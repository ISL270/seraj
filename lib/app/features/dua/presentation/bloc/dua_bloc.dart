import 'package:athar/app/core/models/bloc_event_transformers.dart';
import 'package:athar/app/core/models/paginated_result.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaScreenState> {
  final DuaRepository _repository;

  DuaBloc(this._repository) : super(DuaScreenState._initial()) {
    on<DuaSearched>(_onSearched);
    on<_DuaSubscriptionRequested>(_onSubscriptionRequested);
    on<DuaNextPageFetched>(
      _onNextPageFetched,
      transformer: EventTransformers.throttleDroppable(),
    );
    add(const DuaSearched(''));
    add(_DuaSubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _DuaSubscriptionRequested event,
    Emitter<DuaScreenState> emit,
  ) async {
    await emit.onEach(
      _repository.watchCollection(),
      onData: (status) => add(DuaSearched(state.searchTerm)),
    );
  }

  Future<void> _onSearched(DuaSearched event, Emitter<DuaScreenState> emit) async {
    emit(state._copyWith(searchTerm: event.searchTerm));

    final searchResult = _repository.searchDua(
      page: 0,
      event.searchTerm,
      pageSize: state.result.pageSize,
    );

    emit(state._copyWith(
      searchTerm: event.searchTerm,
      result: PaginatedResult.firstPage(searchResult),
    ));
  }

  Future<void> _onNextPageFetched(
    DuaNextPageFetched event,
    Emitter<DuaScreenState> emit,
  ) async {
    if (state.result.hasReachedMax) return;

    final searchResult = _repository.searchDua(
      state.searchTerm,
      page: state.result.page + 1,
      pageSize: state.result.pageSize,
    );

    emit(state._copyWith(result: state.result.appendResult(searchResult)));
  }

  void deleteDua(int? id) {
    if (id != null) {
      _repository.delete(id);
      add(const DuaSearched(''));
    }
  }
}
