// ignore_for_file: unused_field

import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/sub_features/tags/data/daleel_tag_isar.dart';
import 'package:athar/app/features/daleel/sub_features/tags/data/daleel_tag_isar_source.dart';

final class DaleelTagRepository extends Repository<Tag, DaleelTagIsar> {
  final DaleelTagIsarSource _localSource;
  DaleelTagRepository(this._localSource) : super(_localSource);

  @override
  DaleelTagIsar fromDomain(Tag dm) => DaleelTagIsar.fromDomain(dm);
}
