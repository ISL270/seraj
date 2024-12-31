import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final users = _Users();
  final hadith = _Hadith();
}

final class _Users {
  late final collection = FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> hadithCollection(String userId) =>
      collection.doc(userId).collection(hadithCollName);

  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
  late final hadithCollName = 'hadith';
}

sealed class _Daleel {
  late final id = 'id';
  late final text = 'text';
  late final description = 'description';
  late final tags = 'tags';
  late final lastRevisedAt = 'lastRevisedAt';
  late final priority = 'priority';
}

final class _Hadith extends _Daleel {
  late final rawi = 'rawi';
  late final extraction = 'hadithExtraction';
  late final authenticity = 'hadithAuthenticity';
}
