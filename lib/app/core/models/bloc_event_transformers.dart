import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rxdart/rxdart.dart';

abstract final class EventTransformers {
  static EventTransformer<E> throttleDroppable<E>([
    Duration duration = const Duration(milliseconds: 150),
  ]) {
    // This feeds the debounced event stream to droppable() and returns that as a transformer.
    return (events, mapper) => droppable<E>().call(events.throttleTime(duration), mapper);
  }

  static EventTransformer<E> debounceRestartable<E>([
    Duration duration = const Duration(milliseconds: 400),
  ]) {
    // This feeds the debounced event stream to restartable() and returns that as a transformer.
    return (events, mapper) => restartable<E>().call(events.debounceTime(duration), mapper);
  }
}
