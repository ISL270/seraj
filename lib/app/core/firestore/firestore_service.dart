// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final users = _Users();
  final athar = _Athar();
  final hadith = _Hadith();
  final others = _Others();
  final dua = _Dua();
}

final class _Users {
  late final collection = FirebaseFirestore.instance.collection('users');
  CollectionReference<Map<String, dynamic>> duaCollection(String userId) =>
      collection.doc(userId).collection(duaCollName);
  CollectionReference<Map<String, dynamic>> daleelCollection(String userId) =>
      collection.doc(userId).collection(daleelCollName);

  late final idField = 'id';
  late final nameField = 'name';
  late final emailField = 'email';
  late final daleelCollName = 'daleel';
  late final duaCollName = 'dua';
}

final class _Dua {
  late final id = 'id';
  late final text = 'text';
  late final isFavorite = 'isFavorite';
  late final reward = 'reward';
  late final description = 'description';
  late final priority = 'priority';
  late final tags = 'tags';
}

sealed class _Daleel {
  late final id = 'id';
  late final text = 'text';
  late final tags = 'tags';
  late final sayer = 'sayer';
  late final priority = 'priority';
  late final daleelType = 'daleelType';
  late final description = 'description';
  late final lastRevisedAt = 'lastRevisedAt';
}

final class _Hadith extends _Daleel {
  late final extraction = 'hadithExtraction';
  late final authenticity = 'hadithAuthenticity';
}

final class _Athar extends _Daleel {}

final class _Others extends _Daleel {}
