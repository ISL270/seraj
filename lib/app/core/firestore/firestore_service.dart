import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final coaches = _Coaches();
  final trainees = _Trainees();
  final exercises = _Exercises();
  final workouts = _Workouts();
}

final class _Coaches {
  late final collection = FirebaseFirestore.instance.collection('coaches');

  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
  late final phoneNumberField = 'phoneNumber';
}

final class _Trainees {
  late final collection = FirebaseFirestore.instance.collection('trainees');

  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
  late final phoneNumberField = 'phoneNumber';
  late final coachEmailField = 'coachEmail';
  late final userType = 'userType';
}

final class _Exercises {
  late final atharExercises =
      FirebaseFirestore.instance.collection('athar_exercises');

  CollectionReference<Map<String, dynamic>> coachExercises(String uid) =>
      FirebaseFirestore.instance
          .collection('coaches')
          .doc(uid)
          .collection('exercises');
}

final class _Workouts {
  late final collection = FirebaseFirestore.instance.collection('workouts');

  late final coachIdField = 'coachID';
  late final nameField = 'name';
  late final descriptionField = 'description';
  late final exercisesSetsField = 'exercisesSets';
  late final createdAtField = 'createdAt';
}
