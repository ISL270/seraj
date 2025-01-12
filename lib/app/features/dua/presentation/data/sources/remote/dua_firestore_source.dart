import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/dua/domain/model/dua.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../model/remote/dua_fm.dart';
part 'dua_firestore_source.g.dart';

@singleton
final class DuaFirestoreSource extends ReactiveFirestoreSource<DuaFM> with FirestoreHelper {
  DuaFirestoreSource(super.firestoreSvc);

  Future<void> addDua({
    required String uid,
    required String text,
    required String? reward,
    required Priority priority,
    required List<String> tags,
    required String? description,
  }) async =>
      firestoreOperationHandler(() async {
        await firestoreSvc.users.duaCollection(uid).add({
          firestoreSvc.dua.text: text,
          firestoreSvc.dua.reward: reward,
          firestoreSvc.dua.priority: priority.name,
          firestoreSvc.dua.description: description,
          firestoreSvc.dua.tags: tags,
        });
      });

  @override
  DuaFM fromJson(String docID, Map<String, dynamic> json) => DuaFM.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      super.firestoreSvc.users.duaCollection(user.id).snapshots();
}
