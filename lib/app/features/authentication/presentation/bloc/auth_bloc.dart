import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/domain/models/auth_state.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';

/// Manages authentication state and related operations in the application
///
/// This Bloc handles:
/// - Authentication state tracking
/// - User login subscription
/// - Logout process
/// - Routing based on user type
///
/// Key Responsibilities:
/// - Listens to authentication repository updates
/// - Manages authentication state transitions
/// - Provides user-specific routing logic
@singleton
class AuthBloc extends Bloc<AuthEvent, Status<AuthState>> {
  final AuthRepository _authRepo;

  AuthBloc(this._authRepo) : super(const Initial()) {
    on<_AuthSubscriptionRequested>(_onSubscriptionRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    add(_AuthSubscriptionRequested());
  }

  /// Handles authentication subscription requests
  ///
  /// Listens to authentication repository and emits state updates
  ///
  /// [event] The subscription request event
  /// [emit] State emitter for updating bloc state
  Future<void> _onSubscriptionRequested(
    _AuthSubscriptionRequested event,
    Emitter<Status<AuthState>> emit,
  ) async {
    await emit.forEach(
      _authRepo.stream(),
      onData: (authState) => state.toSuccess(authState),
    );
  }

  /// Handles user logout requests
  ///
  /// Manages logout process:
  /// - Sets loading state
  /// - Calls repository logout method
  /// - Handles potential errors
  ///
  /// [event] The logout request event
  /// [emit] State emitter for updating bloc state
  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<Status<AuthState>> emit,
  ) async {
    emit(state.toLoading());
    try {
      await _authRepo.logOut();
    } catch (e) {
      emit(state.toFailure(e as GenericException));
    }
  }

  @override
  Future<void> close() {
    _authRepo.dispose();
    return super.close();
  }
}
