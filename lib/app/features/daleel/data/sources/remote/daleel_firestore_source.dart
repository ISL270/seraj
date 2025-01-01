import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/daleel/data/models/remote/daleel_fm.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelFirestoreSource extends ReactiveFirestoreSource<DaleelFM> {
  DaleelFirestoreSource(super.firestoreSvc);

  Future<void> saveHadith({
    required String userId,
    required String text,
    required String description,
    required String sayer,
    required String extraction,
    required HadithAuthenticity? authenticity,
    required DateTime lastRevisedAt,
    required Priority priority,
    required List<String> tags,
  }) async {
    await firestoreOperationHandler(() async {
      await firestoreSvc.users.daleelCollection(userId).add({
        firestoreSvc.hadith.text: text,
        firestoreSvc.hadith.priority: priority.name,
        firestoreSvc.hadith.authenticity: authenticity,
        firestoreSvc.hadith.lastRevisedAt: lastRevisedAt,
        // optional fields
        if (tags.isNotEmpty) firestoreSvc.hadith.tags: tags,
        if (sayer.isNotEmpty) firestoreSvc.hadith.sayer: sayer,
        if (extraction.isNotEmpty) firestoreSvc.hadith.extraction: extraction,
        if (description.isNotEmpty) firestoreSvc.hadith.description: description,
      });
    });
  }

  @override
  DaleelFM fromJson(String docID, Map<String, dynamic> json) =>
      DaleelFM.fromJson(DaleelType.hadith, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      super.firestoreSvc.users.daleelCollection(user.id).snapshots();
}
