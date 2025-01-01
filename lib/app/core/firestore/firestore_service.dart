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
  late final duaCollName = 'dua';
}

final class _Dua {
  late final id = 'id';
  late final dua = 'dua';
  late final reward = 'reward';
  late final description = 'description';
  late final priority = 'priority';
  late final tags = 'tags';
}
