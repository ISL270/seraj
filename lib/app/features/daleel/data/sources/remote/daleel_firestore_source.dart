// ignore_for_file: prefer_if_null_operators

import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/daleel/data/sources/remote/daleel_fm.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelFirestoreSource extends ReactiveFirestoreSource<DaleelFM> {
  DaleelFirestoreSource(super.firestoreSvc);

  Future<void> saveHadith({
    required String text,
    required String userId,
    required String? sayer,
    required Priority priority,
    required List<String> tags,
    required String? extraction,
    required String? description,
    required HadithAuthenticity? authenticity,
  }) async {
    await firestoreOperationHandler(() async {
      await firestoreSvc.users.daleelCollection(userId).add({
        firestoreSvc.hadith.text: text,
        firestoreSvc.hadith.tags: tags,
        firestoreSvc.hadith.sayer: sayer,
        firestoreSvc.hadith.extraction: extraction,
        firestoreSvc.hadith.priority: priority.name,
        firestoreSvc.hadith.description: description,
        firestoreSvc.hadith.authenticity: authenticity?.name,
        firestoreSvc.hadith.daleelType: DaleelType.hadith.name,
        firestoreSvc.hadith.lastRevisedAt: FieldValue.serverTimestamp(),
      });
    });
  }

  Future<void> saveAthar({
    required String text,
    required String userId,
    required String? sayer,
    required Priority priority,
    required List<String> tags,
    required String? description,
  }) async {
    await firestoreOperationHandler(() async {
      await firestoreSvc.users.daleelCollection(userId).add({
        firestoreSvc.athar.text: text,
        firestoreSvc.athar.tags: tags,
        firestoreSvc.athar.sayer: sayer,
        firestoreSvc.athar.priority: priority.name,
        firestoreSvc.athar.description: description,
        firestoreSvc.athar.daleelType: DaleelType.athar.name,
        firestoreSvc.athar.lastRevisedAt: FieldValue.serverTimestamp(),
      });
    });
  }

  Future<void> saveAya({
    required String text,
    required String userId,
    required String? sayer,
    required Priority priority,
    required List<String> tags,
    required String surahOfAya,
    required int firstAya,
    required int lastAya,
    required String? ayaExplain,
    required DateTime? lastRevisedAt,
  }) async {
    await firestoreOperationHandler(() async {
      await firestoreSvc.users.daleelCollection(userId).add({
        firestoreSvc.aya.daleelType: DaleelType.aya.name,
        firestoreSvc.aya.text: text,
        firestoreSvc.aya.tags: tags,
        firestoreSvc.aya.priority: priority.name,
        firestoreSvc.aya.lastRevisedAt: lastRevisedAt,
        firestoreSvc.aya.surahOfAya: surahOfAya,
        firestoreSvc.aya.firstAya: firstAya,
        firestoreSvc.aya.lastAya: lastAya,
        firestoreSvc.aya.sayer: sayer,
        firestoreSvc.aya.description: ayaExplain,
      });
    });
  }

  Future<void> saveOthers({
    required String userId,
    required String text,
    required String? sayer,
    required Priority priority,
    required List<String> tags,
    required String? description,
    required DateTime? lastRevisedAt,
  }) async {
    await firestoreOperationHandler(() async {
      await firestoreSvc.users.daleelCollection(userId).add({
        firestoreSvc.other.text: text,
        firestoreSvc.other.tags: tags,
        firestoreSvc.other.priority: priority.name,
        firestoreSvc.other.lastRevisedAt: lastRevisedAt,
        firestoreSvc.other.daleelType: DaleelType.other.name,
        firestoreSvc.other.sayer: sayer!.isBlank ? null : sayer,
        firestoreSvc.other.description: description!.isBlank ? null : description,
      });
    });
  }

  @override
  DaleelFM fromJson(String docID, Map<String, dynamic> json) => DaleelFM.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      super.firestoreSvc.users.daleelCollection(user.id).snapshots();

  @override
  Future<void> deleteDoc({required String uid, required String docID}) async {
    await firestoreOperationHandler(
      () async => firestoreSvc.users.daleelCollection(uid).doc(docID).delete(),
    );
  }
}
