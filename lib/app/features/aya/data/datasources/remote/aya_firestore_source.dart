import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:athar/app/features/aya/domain/models/aya_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

part 'aya_fm.dart';

@singleton
final class AyaFirestoreSource extends ReactiveFirestoreSource<AyaFm>
    with FirestoreHelper {
  AyaFirestoreSource(super.firestoreSvc);

  Future<void> addAya({
    required AyaFm ayaFm,
  }) async =>
      firestoreOperationHandler(() async {
        final userId = getIt.get<AuthRepository>().user?.id ?? '';
        await firestoreSvc.users.collection.doc(userId).collection('ayat').add({
          firestoreSvc.ayat.surahOfAya: ayaFm.surahOfAya,
          firestoreSvc.ayat.nomOfAya: ayaFm.nomOfAya,
          firestoreSvc.ayat.textOfAya: ayaFm.textOfAya,
          firestoreSvc.ayat.ayaExplain: ayaFm.ayaExplain,
        });
      });

  @override
  AyaFm fromJson(String docID, Map<String, dynamic> json) =>
      AyaFm.fromJson(docID, json);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user) {
    final userId = user.id;
    return firestoreSvc.users.collection
        .doc(userId)
        .collection('ayat')
        .snapshots();
  }
}
