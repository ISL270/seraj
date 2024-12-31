import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:athar/app/features/duas/data/model/dua.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

part 'dua_fm.dart';

@singleton
final class DuaFirestoreSource extends ReactiveFirestoreSource<DuaFm>
    with FirestoreHelper {
  DuaFirestoreSource(super.firestoreSvc);

  Future<void> addDua({
    required DuaFm duaFm,
  }) async =>
      firestoreOperationHandler(() async {
        final userId = getIt.get<AuthRepository>().user?.id ?? '';
        await firestoreSvc.users.collection.doc(userId).collection('duas').add({
          firestoreSvc.dua.textOfDua: duaFm.textOfDua,
          firestoreSvc.dua.reward: duaFm.reward,
          firestoreSvc.dua.numOfRepeat: duaFm.numOfRepeat,
          firestoreSvc.dua.explanation: duaFm.explanation,
          firestoreSvc.dua.priority: duaFm.priority,
        });
      });

  @override
  DuaFm fromJson(String docID, Map<String, dynamic> json) =>
      DuaFm.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      super.firestoreSvc.users.duaCollection(user.id).snapshots();
}
