// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final users = _Users();
  final aya = _Aya();
  final hadith = _Hadith();
  final athar = _Athar();
  final other = _Other();
}

final class _Users {
  late final collection = FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> daleelCollection(String userId) =>
      collection.doc(userId).collection(daleelCollName);

  late final idField = 'id';
  late final nameField = 'name';
  late final emailField = 'email';
  late final daleelCollName = 'daleel';
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

final class _Aya extends _Daleel {
  late final surahOfAya = 'surah';
  late final firstAya = 'firstAya';
  late final lastAya = 'lastAya';
}

final class _Hadith extends _Daleel {
  late final extraction = 'hadithExtraction';
  late final authenticity = 'hadithAuthenticity';
}

final class _Athar extends _Daleel {}

final class _Other extends _Daleel {}
