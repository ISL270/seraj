import 'dart:async';

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/data/models/remote/auth_exceptions.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/authentication/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@singleton
final class AuthRepository {
  AuthRepository(
    this._fireAuth,
    this._googleSignIn,
    this._userRepository,
  );
  final GoogleSignIn _googleSignIn;
  final fire_auth.FirebaseAuth _fireAuth;
  final UserRepository _userRepository;

  // Using BehaviorSubject, any new listeners when begin listening to the stream,
  // they immediately get the lastly emitted Stream of data.
  final _stream = BehaviorSubject<User?>.seeded(null);

  Stream<User?> getUpdates() => _stream.asBroadcastStream();

  User? get user => _stream.value;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final user = await _userRepository.geUserLocal();
    _stream.add(user);
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordException] if an exception occurs.
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw SignUpWithEmailAndPasswordException.fromCode('user_not_found');
      }

      final res = await _userRepository.saveUserInfoRemote(
        uid: userCredential.user!.uid,
        name: name,
        email: email,
      );

      await res.fold(
        (e) => throw SignUpWithEmailAndPasswordException.fromCode(e.code),
        (user) async {
          _stream.add(user);
          await _userRepository.saveUserLocally(user);
        },
      );
    } catch (e) {
      throw switch (e) {
        (final fire_auth.FirebaseAuthException e) =>
          SignUpWithEmailAndPasswordException.fromCode(e.code),
        _ => const SignUpWithEmailAndPasswordException(),
      };
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordException] if an exception occurs.
  Future<void> logInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw LogInWithEmailAndPasswordException.fromCode('user_not_found');
      }
    } catch (e) {
      throw switch (e) {
        (final fire_auth.FirebaseAuthException e) =>
          LogInWithEmailAndPasswordException.fromCode(e.code),
        _ => const LogInWithEmailAndPasswordException(),
      };
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleException] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      late final fire_auth.AuthCredential credential;

      if (kIsWeb) {
        final googleProvider = fire_auth.GoogleAuthProvider();
        final userCredential = await _fireAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = fire_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      final userCredential = await _fireAuth.signInWithCredential(credential);

      if (userCredential.user == null) {
        throw LogInWithGoogleException.fromCode('user_not_found');
      }

      final res = await _userRepository.getUserRemote(
        uid: userCredential.user!.uid,
      );

      await res.fold(
        (e) => throw LogInWithGoogleException.fromCode(e.code),
        (user) async {
          _stream.add(user);
          await _userRepository.saveUserLocally(user);
        },
      );
    } catch (e) {
      throw switch (e) {
        (final fire_auth.FirebaseAuthException e) => LogInWithGoogleException.fromCode(e.code),
        _ => const LogInWithGoogleException(),
      };
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _fireAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      _stream.add(null);
      await _userRepository.deleteLocalUser();
    } catch (_) {
      throw BusinessException.unkown();
    }
  }

  @disposeMethod
  void dispose() {
    _stream.close();
  }
}
