import 'package:athar/app/features/splash/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository _authRepository;

  SplashBloc(this._authRepository) : super(SplashLoading()) {
    on<_SplashInitiated>(_onInitiated);
    add(_SplashInitiated());
  }

  Future<void> _onInitiated(SplashEvent event, Emitter<SplashState> emit) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      if (_authRepository.user == null) {
        await _authRepository.logInAnonymously();
      }

      emit(SplashSuccess());
    } catch (e) {
      emit(SplashFailure());
    }
  }
}
