// ignore_for_file: avoid_js_rounded_ints

import 'package:athar/app/core/extension_types/string_id.dart';
import 'package:isar/isar.dart';

abstract base class CacheModel<D> {
  StringID get id;
  Id get cacheID => id.fastHash;

  const CacheModel();

  D toDomain();
}
