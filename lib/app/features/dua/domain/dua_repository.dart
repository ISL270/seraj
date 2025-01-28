// ignore_for_file: unused_field

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/dua/data/sources/dua_isar_source.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:dartx/dartx_io.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaRepository {
  final DuaIsarSource _localSource;

  DuaRepository(
    this._localSource,
  );

  // Future<void> addDua({
  //   required String text,
  //   required String reward,
  //   required List<String> tags,
  //   required String description,
  // }) async {
  //   try {
  //     await _remoteSource.addDua(
  //       text: text,
  //       tags: tags,
  //       isFavourite: false,
  //       uid: authRepository.user!.id,
  //       reward: reward.isBlank ? null : reward,
  //       description: description.isBlank ? null : description,
  //     );
  //   } catch (e) {
  //     throw e as GenericException;
  //   }
  // }

  Future<List<Dua>> searchDua(
    String searchTerm, {
    required int page,
    required int pageSize,
  }) async {
    final cms = await _localSource.getDuas(searchTerm, page: page, pageSize: pageSize);
    return cms.map((e) => e.toDomain()).toList();
  }

  Future<void> toggleFavourite(Dua dua) async {
    try {
      // await _remoteSource.toggleFavourite(uid: authRepository.user!.id, dua: dua);
    } catch (e) {
      throw e as GenericException;
    }
  }
}
