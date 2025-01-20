import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

part 'dua_fm.dart';

@singleton
final class DuaFirestoreSource extends ReactiveFirestoreSource<DuaFM> with FirestoreHelper {
  DuaFirestoreSource(super.firestoreSvc);

  Future<void> addDua({
    required String uid,
    required String text,
    required String? reward,
    required bool isFavourite,
    required List<String> tags,
    required String? description,
  }) async =>
      firestoreOperationHandler(() async {
        await firestoreSvc.users.duaCollection(uid).add({
          firestoreSvc.dua.text: text,
          firestoreSvc.dua.tags: tags,
          firestoreSvc.dua.reward: reward,
          firestoreSvc.dua.isFavourite: isFavourite,
          firestoreSvc.dua.description: description,
        });
      });

  Future<void> toggleFavorite({required String uid, required Dua dua}) async =>
      firestoreOperationHandler(() async {
        await firestoreSvc.users.duaCollection(uid).doc(dua.id).update({
          firestoreSvc.dua.isFavourite: !dua.isFavourite,
        });
      });

  @override
  DuaFM fromJson(String docID, Map<String, dynamic> json) => DuaFM.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      firestoreSvc.users.duaCollection(user.id).snapshots();

  @override
  Future<void> deleteDoc({required String uid, required String docID}) async {
    await firestoreOperationHandler(
      () async => firestoreSvc.users.duaCollection(uid).doc(docID).delete(),
    );
  }
}
