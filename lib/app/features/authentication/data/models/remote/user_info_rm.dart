import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/authentication/domain/models/user_type.dart';

abstract interface class UserInfoRM {
  final UserType userType;
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;

  UserInfoRM({
    required this.userType,
    required this.uid,
    required this.email,
    required this.name,
    required this.phoneNumber,
  });

  User toDomain();

  UserInfoRM fromDomain(User user);

  Map<String, dynamic> toJson();
}
