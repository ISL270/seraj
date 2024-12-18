import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/firestore_service.dart';
import 'package:athar/app/features/authentication/domain/models/user_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class UserFirestoreSource with FirestoreHelper {
  UserFirestoreSource(this._firestoreSvc);
  final FirestoreService _firestoreSvc;

  DocumentReference<Map<String, dynamic>> _userDoc(
    String id,
    UserType userType,
  ) {
    if (userType.isCoach) {
      return _firestoreSvc.coaches.collection.doc(id);
    }
    return _firestoreSvc.trainees.collection.doc(id);
  }
}
