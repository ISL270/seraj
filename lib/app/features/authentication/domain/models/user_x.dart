import 'package:athar/app/features/authentication/domain/models/user.dart';

extension UserX on User {
  bool get isCoach => runtimeType == Coach;

  bool get isTrainee => runtimeType == Trainee;
}
