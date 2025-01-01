import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/data/data_sources/local/user_isar_source.dart';
import 'package:athar/app/features/authentication/data/data_sources/remote/user_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
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

  Future<Either<GenericException, User>> getUserRemote(String uid) async {
    try {
      final userInfoRM = await _remoteSource.getUserInfo(uid);
      return right(userInfoRM.toDomain());
    } catch (e) {
      return left(e as GenericException);
    }
  }

  Future<Either<GenericException, User>> saveUserInfoRemote({
    required String uid,
    required String email,
    required String name,
  }) async {
    try {
      final userInfoRM = await _remoteSource.saveUserInfo(
        uid: uid,
        email: email,
        name: name,
      );
      return right(userInfoRM.toDomain());
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
