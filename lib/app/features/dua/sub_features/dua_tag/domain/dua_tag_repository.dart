// ignore_for_file: unused_field

import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar_source.dart';

final class DuaTagRepository extends Repository<Tag, DuaTagIsar> {
  final DuaTagIsarSource _localSource;
  DuaTagRepository(this._localSource) : super(_localSource);

  @override
  DuaTagIsar fromDomain(Tag dm) => DuaTagIsar.fromDomain(dm);
}
