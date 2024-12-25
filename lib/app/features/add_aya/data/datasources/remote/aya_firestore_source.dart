import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/add_aya/data/models/aya_model.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

part 'aya_fm.dart';

@singleton
final class AyaFirestoreSource extends ReactiveFirestoreSource<AyaFm>
    with FirestoreHelper {
  AyaFirestoreSource(super.firestoreSvc);

  Future<void> saveAya({required AyaFm ayaFm}) async {
    return firestoreOperationHandler(
      () async {},
    );
  }

  @override
  AyaFm fromJson(String docID, Map<String, dynamic> json) =>
      AyaFm.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      firestoreSvc.ayat.collection
          .doc(user.id)
          .collection('userAya')
          .snapshots();
}
