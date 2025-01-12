import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:equatable/equatable.dart';

/// Represents the authentication state of the application.
///
/// This sealed class defines the possible authentication states:
/// - [Authenticated]: When a user is logged in with their user details
/// - [Unauthenticated]: When no user is currently logged in
sealed class AuthState extends Equatable {
  const AuthState();

  bool get isAuthenticated => this is Authenticated;
  bool get isUnauthenticated => this is Unauthenticated;
}

/// Represents an authenticated state with user information
///
/// This class holds the details of a logged-in user and indicates whether it's a fresh login.
final class Authenticated extends AuthState {
  /// The user who is currently authenticated
  final User user;

  /// Indicates whether this is a fresh login
  ///
  /// Useful for performing one-time actions after a new login
  final bool isFreshLogin;

  const Authenticated(this.user, this.isFreshLogin);

  @override
  List<Object> get props => [user, isFreshLogin];
}

/// Represents an unauthenticated state
///
/// This class is used when no user is logged in to the application
final class Unauthenticated extends AuthState {
  const Unauthenticated();

  @override
  List<Object?> get props => [];
}
