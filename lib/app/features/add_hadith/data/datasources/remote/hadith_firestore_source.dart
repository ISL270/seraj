import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/add_hadith/data/models/hadith_model.dart';
import 'package:athar/app/features/add_hadith/domain/models/hadith_type.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'hadith_fm.dart';

@singleton
final class HadithFirestoreSource extends ReactiveFirestoreSource<HadithFM> with FirestoreHelper {
  HadithFirestoreSource(super.firestoreSvc);

  Future<void> addHadith({
    required String id,
    required String textOfHadith,
    required HadithAuthenticity hadithType,
    required String? isnadOfHadith,
    required String? sourceOfHadith,
    required String? hadithExplain,
  }) async =>
      firestoreOperationHandler(() async {
        await firestoreSvc.users.collection.doc(id).collection('hadith').add({
          firestoreSvc.hadith.idHadith: const Uuid().v4(),
          firestoreSvc.hadith.textOfHadith: textOfHadith,
          firestoreSvc.hadith.hadithType: hadithType.name,
          if (isnadOfHadith != null && isnadOfHadith.isNotEmpty)
            firestoreSvc.hadith.isnadOfHadith: isnadOfHadith,
          if (sourceOfHadith != null && sourceOfHadith.isNotEmpty)
            firestoreSvc.hadith.sourceOfHadith: sourceOfHadith,
          if (hadithExplain != null && hadithExplain.isNotEmpty)
            firestoreSvc.hadith.hadithExplain: hadithExplain,
        });
      });

  @override
  HadithFM fromJson(String docID, Map<String, dynamic> json) => HadithFM.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) =>
      firestoreSvc.users.collection.doc(user.id).collection('hadith').snapshots();
}
