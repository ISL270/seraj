import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:isar/isar.dart';

part 'user_isar.g.dart';

@collection
final class UserIsar extends CacheModel<User> {
  @override
  String id;
  String name;
  String email;

  UserIsar({
    required this.id,
    required this.email,
    required this.name,
  });

  factory UserIsar.fromDomain(User user) => switch (user) {
        User() => UserIsar(
            id: user.id,
            email: user.email,
            name: user.name,
          ),
      };

  @override
  User toDomain() {
    return User(
      id: id,
      email: email,
      name: name,
    );
  }
}
