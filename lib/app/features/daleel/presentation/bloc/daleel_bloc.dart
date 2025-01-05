import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'daleel_event.dart';
part 'daleel_state.dart';

class DaleelBloc extends Bloc<DaleelEvent, DaleelState> {
  DaleelBloc() : super(DaleelInitial()) {
    on<DaleelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
