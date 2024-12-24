import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
final class FirestoreService {
  final users = _Users();
  final hadith = _Hadith();
}

final class _Users {
  late final collection = FirebaseFirestore.instance.collection('users');

  late final idField = 'id';
  late final emailField = 'email';
  late final nameField = 'name';
}

final class _Hadith {
  late final collection = FirebaseFirestore.instance.collection('hadith');

  late final idHadith = 'id';
  late final textOfHadith = 'textOfHadith';
  late final hadithType = 'hadithType';
  late final isnadOfHadith = 'isnadOfHadith';
  late final sourceOfHadith = 'soruceOfHadith';
  late final hadithExplain = 'hadithExplain';
}
