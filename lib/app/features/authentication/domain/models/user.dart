import 'package:equatable/equatable.dart';

sealed class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.name,
    // this.photo,
    required this.phoneNumber,
  });

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String name;

  /// The current user's email address.
  final String email;

  final String phoneNumber;

  /// Url for the current user's photo.
  // final String? photo;

  @override
  List<Object?> get props => [
        email,
        id,
        name,
        // photo,
        phoneNumber,
      ];
}

final class Coach extends User {
  const Coach({
    required super.id,
    required super.email,
    required super.name,
    required super.phoneNumber,
    // super.photo,
  });
  @override
  List<Object?> get props => [super.props];
}

final class Trainee extends User {
  final String coachEmail;

  const Trainee({
    required super.id,
    required super.email,
    required this.coachEmail,
    required super.name,
    required super.phoneNumber,
    // super.photo,
  });
  @override
  List<Object?> get props => [
        super.props,
        coachEmail,
      ];
}
