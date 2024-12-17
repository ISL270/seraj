import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:isar/isar.dart';

part 'user_isar.g.dart';

@collection
final class UserIsar extends CacheModel<User> {
  UserIsar({
    required this.id,
    required this.email,
  });

  factory UserIsar.fromDomain(User user) => switch (user) {
        User() => UserIsar(
            id: user.id,
            email: user.email,
          ),
      };

  String email;

  @override
  String id;

  @override
  User toDomain() {
    return User(
      id: id,
      email: email,
    );
  }
}
