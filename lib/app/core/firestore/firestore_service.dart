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
  late final textOfHadith = 'text';
  late final authenticityOfHadith = 'hadithAuthenticityType';
  late final rawiOfHadith = 'rawi';
  late final extractionOfHadith = 'soruceOfHadith';
  late final hadithExplain = 'description';
  late final tags = 'tags';
  late final lastRevisedAt = 'lastRevisedAt';
  late final priority = 'priority';
}
