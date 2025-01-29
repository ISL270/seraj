// ignore_for_file: strict_raw_type

import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/dua/data/dua_isar.dart';
import 'package:athar/app/features/settings/data/sources/local/settings_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@singleton
final class IsarService {
  const IsarService._(this._db);
  final Isar _db;

  @FactoryMethod(preResolve: true)
  static Future<IsarService> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        SettingsIsarSchema,
        DaleelIsarSchema,
        DuaIsarSchema,
      ],
      directory: dir.path,
    );
    return IsarService._(isar);
  }

  Isar get db => _db;
}
