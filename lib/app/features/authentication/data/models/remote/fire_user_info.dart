import 'package:athar/app/features/authentication/data/models/remote/user_info_rm.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fire_user_info.g.dart';

sealed class FireUserInfo implements UserInfoRM {
  const FireUserInfo();

  factory FireUserInfo.fromJson(Map<String, dynamic> json) => FireAppUserInfo.fromJson(json);

  factory FireUserInfo.user({
    required String uid,
    required String email,
    required String name,
  }) =>
      FireAppUserInfo(
        uid: uid,
        email: email,
        name: name,
      );

  @override
  UserInfoRM fromDomain(User user) => switch (user) {
        User() => FireAppUserInfo(
            uid: user.id,
            email: user.email,
            name: user.name,
          ),
      };
}

@JsonSerializable(explicitToJson: true)
final class FireAppUserInfo extends FireUserInfo {
  const FireAppUserInfo({
    required this.uid,
    required this.email,
    required this.name,
  });

  factory FireAppUserInfo.fromJson(Map<String, dynamic> json) => _$FireAppUserInfoFromJson(json);
  @override
  final String uid;
  @override
  final String email;
  @override
  final String name;

  @override
  Map<String, dynamic> toJson() => _$FireAppUserInfoToJson(this);

  @override
  User toDomain() => User(
        id: uid,
        email: email,
        name: name,
      );
}
