import 'dart:async';

import 'package:athar/app/features/splash/domain/models/auth_state.dart';
import 'package:athar/app/features/splash/domain/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@singleton
final class AuthRepository {
  final fire_auth.FirebaseAuth _fireAuth;

  AuthRepository(this._fireAuth) {
    _init();
  }

  final _subject = BehaviorSubject<AuthState>.seeded(const Unauthenticated());

  Stream<AuthState> stream() => _subject.asBroadcastStream();

  AuthState get authState => _subject.value;

  User? get user => switch (authState) {
        Authenticated(user: final user) => user,
        Unauthenticated() => null,
      };

  void _init() {
    final currentUser = _fireAuth.currentUser;
    if (currentUser != null) {
      final user = User(
        id: currentUser.uid,
        name: currentUser.displayName ?? 'Anonymous',
        email: currentUser.email ?? '',
      );
      _subject.add(Authenticated(user, false));
    } else {
      _subject.add(const Unauthenticated());
    }
  }

  /// Logs in anonymously using Firebase Authentication.
  /// Throws an exception if an error occurs.
  Future<void> logInAnonymously() async {
    try {
      final userCredential = await _fireAuth.signInAnonymously();

      if (userCredential.user == null) {
        throw Exception('Anonymous login failed.');
      }

      final user = User(
        id: userCredential.user!.uid,
        name: userCredential.user!.displayName ?? 'Anonymous',
        email: userCredential.user!.email ?? '',
      );

      _subject.add(Authenticated(user, true));
    } catch (e) {
      throw Exception('Anonymous login error: $e');
    }
  }

  Future<void> logOut() async {
    try {
      await _fireAuth.signOut();
      _subject.add(const Unauthenticated());
    } catch (_) {
      throw Exception('Logout failed.');
    }
  }

  @disposeMethod
  void dispose() {
    _subject.close();
  }
}
