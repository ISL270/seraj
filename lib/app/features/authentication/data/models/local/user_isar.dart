import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:isar/isar.dart';

part 'user_isar.g.dart';

@collection
final class UserIsar extends CacheModel<User> {
  @override
  final String id;
  final String name;
  final String email;

  const UserIsar({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserIsar.fromDomain(User user) => switch (user) {
        User() => UserIsar(
            id: user.id,
            name: user.name,
            email: user.email,
          ),
      };

  @override
  User toDomain() {
    return User(
      id: id,
      name: name,
      email: email,
    );
  }
}
