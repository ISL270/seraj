import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaState> {
  DuaBloc() : super(DuaInitial()) {
    on<DuaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
