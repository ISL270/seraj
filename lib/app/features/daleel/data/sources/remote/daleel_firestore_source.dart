import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/daleel/data/models/remote/daleel_fm.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
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
    required HadithAuthenticity hadithAuthenticity,
    required DateTime lastRevisedAt,
    required Priority priority,
    required List<String> tags,
  }) async {
    final daleelDocRef = super.firestoreSvc.users.collection.doc(userId).collection('daleel').doc();
    final daleelDocRefId = daleelDocRef.id;

    final hadithFirestore = super.firestoreSvc.hadith;
    await daleelDocRef.set({
      // required fields
      hadithFirestore.idHadith: daleelDocRefId,
      hadithFirestore.textOfHadith: text,
      hadithFirestore.authenticityOfHadith: hadithAuthenticity.name,
      hadithFirestore.lastRevisedAt: lastRevisedAt,
      hadithFirestore.priority: priority.name,
      // optional fields
      if (description.isNotEmpty) hadithFirestore.descOfHadith: description,
      if (sayer.isNotEmpty) hadithFirestore.sayerOfHadith: sayer,
      if (extraction.isNotEmpty) hadithFirestore.extractionOfHadith: extraction,
      if (tags.isNotEmpty) hadithFirestore.tags: tags,
    });
  }

  @override
  DaleelFM fromJson(String docID, Map<String, dynamic> json) =>
      DaleelFM.fromJson(DaleelType.hadith, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      super.firestoreSvc.users.daleelCollection(user.id).snapshots();
}
