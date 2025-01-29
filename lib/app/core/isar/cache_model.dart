// ignore_for_file: avoid_js_rounded_ints

import 'package:isar/isar.dart';

abstract base class CacheModel<D> {
  Id? id;
  CacheModel({this.id});

  D toDomain();
}
