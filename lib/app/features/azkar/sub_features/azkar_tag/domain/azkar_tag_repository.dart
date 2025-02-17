// ignore_for_file: unused_field

import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_tag/data/azkar_tag_isar.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_tag/data/azkar_tag_isar_source.dart';

final class AzkarTagRepository extends Repository<Tag, AzkarTagIsar> {
  final AzkarTagIsarSource _localSource;

  AzkarTagRepository(this._localSource) : super(_localSource);

  @override
  AzkarTagIsar fromDomain(Tag dm) => AzkarTagIsar.fromDomain(dm);
}
