import 'package:athar/app/features/authentication/domain/models/user.dart';

abstract interface class UserInfoRM {
  UserInfoRM({
    required this.uid,
    required this.email,
  });

  final String uid;
  final String email;

  User toDomain();

  UserInfoRM fromDomain(User user);

  Map<String, dynamic> toJson();
}
