import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/daleel/data/models/remote/daleel_fm.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelFirestoreSource extends ReactiveFirestoreSource<DaleelFM> with FirestoreHelper {
  DaleelFirestoreSource(super.firestoreSvc);

  Future<void> saveHadithInfo({
    required String userId,
    required String text,
    required String description,
    required String rawi,
    required String extraction,
    required HadithAuthenticity hadithAuthenticity,
    required DateTime lastRevisedAt,
    required Priority priority,
    required List<String> tags,
  }) async {
    final hadithDocRefId =
        super.firestoreSvc.users.collection.doc(userId).collection('hadith').doc().id;
    final hadithDocRef =
        super.firestoreSvc.users.collection.doc(userId).collection('hadith').doc(hadithDocRefId);

    final hadithFirestore = super.firestoreSvc.hadith;
    await hadithDocRef.set({
      // required fields
      hadithFirestore.idHadith: hadithDocRefId,
      hadithFirestore.textOfHadith: text,
      hadithFirestore.authenticityOfHadith: hadithAuthenticity.name,
      hadithFirestore.lastRevisedAt: lastRevisedAt,
      hadithFirestore.priority: priority.name,
      // optional fields
      if (description.isNotEmpty) hadithFirestore.hadithExplain: description,
      if (rawi.isNotEmpty) hadithFirestore.rawiOfHadith: rawi,
      if (extraction.isNotEmpty) hadithFirestore.extractionOfHadith: extraction,
      if (tags.isNotEmpty) hadithFirestore.tags: tags,
    });
  }

  @override
  DaleelFM fromJson(String docID, Map<String, dynamic> json) => DaleelFM.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      super.firestoreSvc.users.collection.doc(user.id).collection('hadith').snapshots();
}
