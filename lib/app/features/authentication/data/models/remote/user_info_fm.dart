import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_fm.g.dart';

@JsonSerializable()
final class UserFM implements RemoteModel<User> {
  @override
  @JsonKey(name: 'uid')
  final String id;
  final String name;
  final String email;

  const UserFM({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserFM.fromJson(Map<String, dynamic> json) => _$UserFMFromJson(json);

  Map<String, dynamic> toJson() => _$UserFMToJson(this);

  factory UserFM.fromDomain(User user) => UserFM(
        id: user.id,
        name: user.name,
        email: user.email,
      );

  @override
  User toDomain() => User(
        id: id,
        name: name,
        email: email,
      );
}
