import 'package:athar/app/core/models/domain/generic_exception.dart';

/// Thrown during the sign up process if a failure occurs.
class SignUpWithEmailAndPasswordException implements BusinessException {
  const SignUpWithEmailAndPasswordException({
    this.code = '',
    this.message = 'An unknown exception occurred.',
  });

  // TODO: convert to new switch case.
  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordException(
          code: code,
          message: 'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return SignUpWithEmailAndPasswordException(
          code: code,
          message:
              'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordException(
          code: code,
          message: 'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordException(
          code: code,
          message: 'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return SignUpWithEmailAndPasswordException(
          code: code,
          message: 'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordException();
    }
  }

  @override
  final String message;
  @override
  final String code;
}

/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
class LogInWithEmailAndPasswordException implements BusinessException {
  const LogInWithEmailAndPasswordException({
    this.code = '',
    this.message = 'An unknown exception occurred.',
  });

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return LogInWithEmailAndPasswordException(
          code: code,
          message: 'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return LogInWithEmailAndPasswordException(
          code: code,
          message:
              'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return LogInWithEmailAndPasswordException(
          code: code,
          message: 'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return LogInWithEmailAndPasswordException(
          code: code,
          message: 'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordException();
    }
  }

  @override
  final String message;
  @override
  final String code;
}

/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
class LogInWithGoogleException implements BusinessException {
  const LogInWithGoogleException({
    this.code = '',
    this.message = 'An unknown exception occurred.',
  });

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleException.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithGoogleException(
          code: code,
          message: 'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return LogInWithGoogleException(
          code: code,
          message: 'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return LogInWithGoogleException(
          code: code,
          message: 'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return LogInWithGoogleException(
          code: code,
          message:
              'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return LogInWithGoogleException(
          code: code,
          message: 'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return LogInWithGoogleException(
          code: code,
          message: 'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return LogInWithGoogleException(
          code: code,
          message: 'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return LogInWithGoogleException(
          code: code,
          message: 'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleException();
    }
  }

  @override
  final String message;
  @override
  final String code;
}
