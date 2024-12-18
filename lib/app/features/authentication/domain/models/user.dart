import 'package:equatable/equatable.dart';

final class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.name,
  });

  /// The current user's id.
  final String id;

  /// The current user's email address.
  final String email;

  /// The current user's name.
  final String name;

  @override
  List<Object?> get props => [
        email,
        name,
        id,
      ];
}
