import 'package:equatable/equatable.dart';

final class User extends Equatable {
  const User({
    required this.id,
    required this.email,
  });

  /// The current user's id.
  final String id;

  /// The current user's email address.
  final String email;

  @override
  List<Object?> get props => [
        email,
        id,
      ];
}
