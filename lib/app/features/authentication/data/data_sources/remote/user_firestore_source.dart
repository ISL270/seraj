import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/firestore_service.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/data/models/remote/fire_user_info.dart';
import 'package:athar/app/features/authentication/domain/models/user_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class UserFirestoreSource with FirestoreHelper {
  final FirestoreService _firestoreSvc;

  UserFirestoreSource(this._firestoreSvc);

  DocumentReference<Map<String, dynamic>> _userDoc(
      String id, UserType userType) {
    if (userType.isCoach) {
      return _firestoreSvc.coaches.collection.doc(id);
    }
    return _firestoreSvc.trainees.collection.doc(id);
  }

  Future<FireUserInfo> getUserInfo(UserType userType, String uid) async {
    return firestoreOperationHandler(() async {
      final userInfoJson = (await _userDoc(uid, userType).get()).data();
      if (userInfoJson == null)
        throw const BusinessException(code: 'user_not_found');
      return FireUserInfo.fromJson(userType, userInfoJson);
    });
  }

  Future<FireUserInfo> saveUserInfo(
    UserType userType, {
    required String uid,
    required String coachEmail,
    required String email,
    required String name,
    required String phoneNumber,
  }) async {
    final userInfo = FireUserInfo.fromUserType(
      userType,
      uid: uid,
      coachEmail: coachEmail,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
    );
    return firestoreOperationHandler(() async {
      await _userDoc(uid, userType).set(userInfo.toJson());
      return userInfo;
    });
  }
}
