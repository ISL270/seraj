import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/data/data_sources/local/user_isar_source.dart';
import 'package:athar/app/features/authentication/data/data_sources/remote/user_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/authentication/domain/models/user_type.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class UserRepository {
  final UserIsarSource _localSource;
  final UserFirestoreSource _remoteSource;

  UserRepository(this._localSource, this._remoteSource);

  Future<User?> geUserLocal() async {
    final userCM = await _localSource.getSavedUser();
    return userCM?.toDomain();
  }

  Future<void> saveUserLocally(User user) => _localSource.saveUser(user);

  Future<void> deleteLocalUser() => _localSource.deleteSavedUser();

  Future<Either<GenericException, User>> getUserRemote({
    required UserType userType,
    required String uid,
  }) async {
    try {
      final userInfoRM = await _remoteSource.getUserInfo(userType, uid);
      return right(userInfoRM.toDomain());
    } catch (e) {
      return left(e as GenericException);
    }
  }

  Future<Either<GenericException, User>> saveUserInfoRemote({
    required String uid,
    required UserType userType,
    required String coachEmail,
    required String email,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      final userInfoRM = await _remoteSource.saveUserInfo(
        userType,
        uid: uid,
        coachEmail: coachEmail,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
      );
      return right(userInfoRM.toDomain());
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
