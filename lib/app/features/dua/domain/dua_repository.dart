// ignore_for_file: unused_field

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/dua/data/sources/local/dua_isar.dart';
import 'package:athar/app/features/dua/data/sources/local/dua_isar_source.dart';
import 'package:athar/app/features/dua/data/sources/remote/dua_firestore_source.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/core/models/favourite_filters.dart';
import 'package:dartx/dartx_io.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaRepository extends ReactiveRepository<Dua, DuaFM, DuaIsar> {
  final DuaIsarSource _localSource;
  final DuaFirestoreSource _remoteSource;

  DuaRepository(
    super.authRepository,
    this._remoteSource,
    this._localSource,
  ) : super(localSource: _localSource, remoteSource: _remoteSource);

  Future<void> addDua({
    required String text,
    required String reward,
    required List<String> tags,
    required String description,
  }) async {
    try {
      await _remoteSource.addDua(
        text: text,
        tags: tags,
        isFavourite: false,
        uid: authRepository.user!.id,
        reward: reward.isBlank ? null : reward,
        description: description.isBlank ? null : description,
      );
    } catch (e) {
      throw e as GenericException;
    }
  }

  Future<List<Dua>> searchDua(
    String searchTerm, {
    required int page,
    required int pageSize,
    required FavouriteFilters filters,
  }) async {
    final cms = await _localSource.getDuas(
      searchTerm,
      page: page,
      pageSize: pageSize,
      filters: filters,
    );
    return cms.map((e) => e.toDomain()).toList();
  }

  Future<void> toggleFavourite(Dua dua) async {
    try {
      await _remoteSource.toggleFavourite(uid: authRepository.user!.id, dua: dua);
    } catch (e) {
      throw e as GenericException;
    }
  }

  @disposeMethod
  void dispMethod() => dispose();
}
