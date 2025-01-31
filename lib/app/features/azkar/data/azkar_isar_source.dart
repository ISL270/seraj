// ignore_for_file: inference_failure_on_function_invocation

import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/azkar/data/azkar_isar.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/presentation/models/azkar_filters.dart';
import 'package:dartx/dartx_io.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class AzkarIsarSource extends IsarSource<Azkar, AzkarIsar> {
  AzkarIsarSource(super.isarService);

  void addAzkar({
    required String text,
    required String description,
    required int noOfRepetitions,
    required List<String> tags,
  }) {
    final azkarIsar = AzkarIsar(
      text: text,
      description: description,
      noOfRepetitions: noOfRepetitions,
      isFavourite: false,
    );
    isarService.db.writeTxnSync(() {
      isarService.db.azkarIsars.putSync(azkarIsar);
    });
  }

  List<AzkarIsar> getAzkar(
    String searchTerm, {
    required int page,
    required int pageSize,
    AzkarFilters? filters,
  }) {
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.db.azkarIsars.where().textStartsWith(searchTerm).filter(),
      false => isarService.db.azkarIsars.where().anyText().filter(),
    };
    return query
        .optional(
          filters?.favourites.isNotEmpty ?? false,
          (q) => q.anyOf(filters!.favourites, (q, f) => q.isFavouriteEqualTo(f)),
        )
        .offset(page * pageSize)
        .limit(pageSize)
        .findAllSync();
  }

  void deleteDoc(int id) => isarService.db.writeTxn(() => isarService.db.azkarIsars.delete(id));
}
