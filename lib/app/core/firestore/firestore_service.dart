import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final users = _Users();
  final ayat = _Ayat();
}

final class _Users {
  late final collection = FirebaseFirestore.instance.collection('users');
  CollectionReference<Map<String, dynamic>> ayatCollection(String userId) =>
      collection.doc(userId).collection(ayaCollName);
  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
  late final ayaCollName = 'ayat';
}

final class _Ayat {
  late final collection = FirebaseFirestore.instance.collection('ayat');
  late final textOfAya = 'textOfAya';
  late final surahOfAya = 'surahOfAya';
  late final nomOfAya = 'nomOfAya';
  late final ayaExplain = 'ayaExplain';
}
