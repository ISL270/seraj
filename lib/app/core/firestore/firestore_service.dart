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
      collection.doc(userId).collection('daleel');

  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
}

final class _Hadith {
  late final idHadith = 'id';
  late final daleelType = 'daleelType';
  late final textOfHadith = 'text';
  late final authenticityOfHadith = 'hadithAuthenticity';
  late final sayerOfHadith = 'sayer';
  late final extractionOfHadith = 'extraction';
  late final descOfHadith = 'description';
  late final tags = 'tags';
  late final lastRevisedAt = 'lastRevisedAt';
  late final priority = 'priority';
}
