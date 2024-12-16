enum UserType {
  // Never change the order.
  // Original order: 1- coach, 2- Trainee
  coach,
  trainee;
}

extension UserTypeX on UserType {
  bool get isCoach => this == UserType.coach;
  bool get isTrainee => this == UserType.trainee;
}
