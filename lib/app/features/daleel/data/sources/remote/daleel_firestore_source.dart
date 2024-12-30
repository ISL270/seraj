import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/firestore_service.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/daleel/data/models/remote/fire_daleel_info.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelFirestoreSource with FirestoreHelper {
  final FirestoreService _firestoreService;
  DaleelFirestoreSource(this._firestoreService);

  Future<FireDaleelInfo> getDaleelInfo(String daleelId) async {
    return firestoreOperationHandler(() async {
      late final DaleelType daleelType;
      late final DocumentSnapshot<Map<String, dynamic>> daleelDoc;
      daleelDoc = await _firestoreService.hadith.collection.doc(daleelId).get();
      if (!daleelDoc.exists) throw const BusinessException(code: 'hadith_not_found');
      daleelType = DaleelType.hadith;
      return FireDaleelInfo.fromJson(daleelType, daleelDoc.data()!);
    });
  }

  Future<FireDaleelInfo> saveDaleelInfo(
    DaleelType daleelType, {
    required String daleelId,
    required String text,
    required String rawi,
    required String extraction,
    required HadithAuthenticity hadithAuthenticity,
    required DateTime lastRevisedAt,
    required Priority priority,
    required List<String> tags,
  }) async {
    final daleelInfo = FireDaleelInfo.fromDaleelType(
      daleelType,
      rawi: rawi,
      extraction: extraction,
      hadithAuthenticity: hadithAuthenticity,
      id: daleelId,
      lastRevisedAt: lastRevisedAt,
      priority: priority,
      tags: tags,
      text: text,
    );

    return firestoreOperationHandler(() async {
      late final DocumentReference<Map<String, dynamic>> daleelDocRef;
      // when adding more daleeltypes enums. like ayat, athars, other
      // if(daleelType.isHadith)
      daleelDocRef = _firestoreService.hadith.collection.doc(daleelId);

      await daleelDocRef.set(daleelInfo.toJson());
      return daleelInfo;
    });
  }
}
