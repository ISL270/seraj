import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final users = _Users();
  final dua = _Dua();
}

final class _Users {
  late final collection = FirebaseFirestore.instance.collection('users');
  CollectionReference<Map<String, dynamic>> duaCollection(String userId) =>
      collection.doc(userId).collection(duaCollName);
  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
  late final duaCollName = 'duas';
}

final class _Dua {
  late final collection = FirebaseFirestore.instance.collection('duas');
  late final idField = 'id';
  late final textOfDua = 'textOfDua';
  late final typeOfDua = 'typeOfDua';
  late final numOfRepeat = 'numOfRepeat';
  late final duaNotes = 'duaNotes';
  late final timeOfDua = 'timeOfDua';
}
