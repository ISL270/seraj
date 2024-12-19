import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/firestore_service.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/data/models/remote/user_info_fm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class UserFirestoreSource with FirestoreHelper {
  UserFirestoreSource(this._firestoreSvc);
  final FirestoreService _firestoreSvc;

  Future<UserFM> getUserInfo(String uid) async {
    return firestoreOperationHandler(() async {
      late final DocumentSnapshot<Map<String, dynamic>> userDoc;
      userDoc = await _firestoreSvc.users.collection.doc(uid).get();
      if (!userDoc.exists) throw const BusinessException(code: 'user_not_found');
      return UserFM.fromJson(userDoc.data()!);
    });
  }

  Future<UserFM> saveUserInfo({
    required String uid,
    required String email,
    required String name,
  }) async {
    final userInfo = UserFM(uid: uid, email: email, name: name);
    return firestoreOperationHandler(() async {
      late final DocumentReference<Map<String, dynamic>> userDoc;
      userDoc = _firestoreSvc.users.collection.doc(uid);
      await userDoc.set(userInfo.toJson());
      return userInfo;
    });
  }
}
