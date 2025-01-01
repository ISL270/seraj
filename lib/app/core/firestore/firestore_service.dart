import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final users = _Users();
  final hadith = _Hadith();
}

final class _Users {
  late final collection = FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> daleelCollection(String userId) =>
      collection.doc(userId).collection(daleelCollName);

  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
  late final daleelCollName = 'daleel';
}

sealed class _Daleel {
  late final id = 'id';
  late final text = 'text';
  late final sayer = 'sayer';
  late final description = 'description';
  late final tags = 'tags';
  late final lastRevisedAt = 'lastRevisedAt';
  late final priority = 'priority';
  late final daleelType = 'daleelType';
}

final class _Hadith extends _Daleel {
  late final extraction = 'hadithExtraction';
  late final authenticity = 'hadithAuthenticity';
}
