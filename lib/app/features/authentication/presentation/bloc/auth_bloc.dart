import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, UserState> {
  final AuthRepository _authRepo;

  AuthBloc(this._authRepo) : super(const Initial()) {
    on<_AuthSubscriptionRequested>(_onSubscriptionRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    add(_AuthSubscriptionRequested());
  }

  Future<void> _onSubscriptionRequested(
    _AuthSubscriptionRequested event,
    Emitter<UserState> emit,
  ) async {
    await emit.forEach(
      _authRepo.getUpdates(),
      onData: Success.new,
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const Loading());
    try {
      await _authRepo.logOut();
    } catch (e) {
      emit(Failure(e as GenericException));
    }
  }

  @override
  Future<void> close() {
    _authRepo.dispose();
    return super.close();
  }
}

bool hasUserTypeChanged(UserState previous, UserState current) {
  if (previous.isSuccess && current.isSuccess) {
    if (previous.user.runtimeType != current.user.runtimeType) {
      return true;
    }
    return false;
  }
  return false;
}

typedef UserState = Status<User?>;

extension X on UserState {
  User? get user {
    if (isSuccess) {
      return (this as Success<User?>).result;
    }
    return null;
  }

  bool get isAuthenticated => user != null;
}
