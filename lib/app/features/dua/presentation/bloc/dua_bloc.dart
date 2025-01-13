import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/bloc_event_transformers.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/domain/paginated_result.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/domain/dua_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'dua_event.dart';
part 'dua_state.dart';

@injectable
class DuaBloc extends Bloc<DuaEvent, DuaState> {
  final DuaRepository _repository;

  DuaBloc(this._repository) : super(const DuaState()) {
    on<_DuaSubscriptionRequested>(_onSubscriptionRequested);
    on<DuaAddToFavorite>(onAddToFavorite);

    on<DuaSearched>(_onSearched);
    on<DuaNextPageFetched>(
      _onNextPageFetched,
      transformer: EventTransformers.throttleDroppable(),
    );
    add(_DuaSubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _DuaSubscriptionRequested event,
    Emitter<DuaState> emit,
  ) async {
    await emit.forEach(
      _repository.stream(),
      onData: (status) {
        if (status.isSuccess) {
          add(DuaSearched(state.searchTerm));
        }
        return state;
      },
    );
  }

  Future<void> _onSearched(DuaSearched event, Emitter<DuaState> emit) async {
    emit(state.copyWith(
      status: const Loading(),
      searchTerm: event.searchTerm,
    ));

    final searchResult = await _repository.searchDua(
      page: 0,
      event.searchTerm,
      pageSize: state.duas.pageSize,
    );

    emit(state.copyWith(
      status: const Success(null),
      dua: PaginatedResult(result: searchResult),
    ));
  }

  Future<void> _onNextPageFetched(
    DuaNextPageFetched event,
    Emitter<DuaState> emit,
  ) async {
    if (state.duas.hasReachedMax) return;

    final searchResult = await _repository.searchDua(
      state.searchTerm,
      page: state.duas.page + 1,
      pageSize: state.duas.pageSize,
    );

    emit(state.copyWith(
      status: const Success(null),
      dua: state.duas.appendResult(
        searchResult,
        hasReachedMax: searchResult.length < state.duas.pageSize,
      ),
    ));
  }

  Future<void> onAddToFavorite(
    DuaAddToFavorite event,
    Emitter<DuaState> emit,
  ) async {
    try {
      emit(state.copyWith(status: const Loading()));
      await _repository.addToFavorite(duaId: event.duaId, currentStatus: event.currantStatus);
      emit(state.copyWith(status: const Success('Added to favorites successfully')));
    } catch (e) {
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }

  @override
  Future<void> close() {
    _repository.dispMethod();
    return super.close();
  }
}
