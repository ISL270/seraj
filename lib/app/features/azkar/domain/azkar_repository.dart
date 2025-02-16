import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/azkar/data/azkar_isar.dart';
import 'package:athar/app/features/azkar/data/azkar_isar_source.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/presentation/models/azkar_filters.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_tag/data/azkar_tag_isar_source.dart';
import 'package:injectable/injectable.dart';

@singleton
final class AzkarRepository extends Repository<Azkar, AzkarIsar> {
  final AzkarIsarSource _localSource;
  final AzkarTagIsarSource _tagIsarSource;

  AzkarRepository(this._localSource, this._tagIsarSource) : super(_localSource);

  void addOrUpdateAzkar({
    required int? id,
    required String text,
    required String description,
    required int noOfRepetitions,
    required Set<Tag> tags,
  }) {
    id == null
        ? _localSource.addAzkar(
            text: text,
            description: description,
            noOfRepetitions: noOfRepetitions,
            tags: tags,
          )
        : _localSource.updateAzkar(
            id: id,
            text: text,
            description: description,
            noOfRepetitions: noOfRepetitions,
            tags: tags,
          );
  }

  List<Azkar> searchAzkar(
    String searchTerm, {
    required int page,
    required int pageSize,
    AzkarFilters? filters,
  }) {
    final cms = _localSource.getAzkar(
      searchTerm,
      page: page,
      pageSize: pageSize,
      filters: filters,
    );
    return cms.map((e) => e.toDomain()).toList();
  }

  void toggleFavorite(Azkar azkar) {
    final cm = _localSource.get(azkar.id!)!;
    cm.isFavourite = !cm.isFavourite;
    _localSource.put(cm);
  }

  List<Tag> getTags() => _tagIsarSource.getAllTags();

  void deleteDoc(int id) => _localSource.deleteDoc(id);

  @override
  AzkarIsar fromDomain(Azkar dm) => AzkarIsar.fromDomain(dm);
}
