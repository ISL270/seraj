// ignore_for_file: prefer_if_null_operators

import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/daleel/data/sources/remote/daleel_fm.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    required DateTime? lastRevisedAt,
    required HadithAuthenticity? authenticity,
  }) async {
    await firestoreOperationHandler(() async {
      await firestoreSvc.users.daleelCollection(userId).add({
        firestoreSvc.hadith.text: text,
        firestoreSvc.hadith.tags: tags,
        firestoreSvc.hadith.priority: priority.name,
        firestoreSvc.hadith.lastRevisedAt: lastRevisedAt,
        firestoreSvc.hadith.authenticity: authenticity?.name,
        firestoreSvc.hadith.daleelType: DaleelType.hadith.name,
        firestoreSvc.hadith.sayer: sayer!.isEmpty ? null : sayer,
        firestoreSvc.hadith.description: description!.isEmpty ? null : description,
        firestoreSvc.hadith.extraction: extraction!.isEmpty ? null : extraction,
      });
    });
  }

  Future<void> saveAthar({
    required String text,
    required String userId,
    required String? sayer,
    required Priority priority,
    required List<String> tags,
    required DateTime? lastRevisedAt,
  }) async {
    await firestoreOperationHandler(() async {
      await firestoreSvc.users.daleelCollection(userId).add({
        firestoreSvc.athar.text: text,
        firestoreSvc.athar.tags: tags,
        firestoreSvc.athar.priority: priority.name,
        firestoreSvc.athar.lastRevisedAt: lastRevisedAt,
        firestoreSvc.athar.daleelType: DaleelType.athar.name,
        firestoreSvc.athar.sayer: sayer!.isEmpty ? null : sayer,
      });
    });
  }

  @override
  DaleelFM fromJson(String docID, Map<String, dynamic> json) => DaleelFM.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      super.firestoreSvc.users.daleelCollection(user.id).snapshots();
}
