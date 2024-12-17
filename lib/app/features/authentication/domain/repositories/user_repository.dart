import 'package:athar/app/features/authentication/data/data_sources/local/user_isar_source.dart';
import 'package:athar/app/features/authentication/data/data_sources/remote/user_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
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
}
