import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashLoading()) {
    on<_SplashInitiated>(_onInitiated);
    add(_SplashInitiated());
  }

  Future<void> _onInitiated(
      SplashEvent event, Emitter<SplashState> emit) async {
    //TODO: add initialization logic here
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(SplashSuccess());
  }
}
