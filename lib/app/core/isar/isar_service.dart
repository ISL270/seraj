// ignore_for_file: strict_raw_type

import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_helper.dart';
import 'package:athar/app/features/authentication/data/models/local/user_isar.dart';
import 'package:athar/app/features/aya/data/sources/local/aya_isar.dart';
import 'package:athar/app/features/settings/data/sources/local/settings_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@singleton
final class IsarService with IsarHelper {
  const IsarService._(this._isar);
  final Isar _isar;

  @FactoryMethod(preResolve: true)
  static Future<IsarService> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        UserIsarSchema,
        SettingsIsarSchema,
        AyaIsarSchema,
      ],
      directory: dir.path,
    );
    return IsarService._(isar);
  }

  // Usefull to access it for custom queries.
  Isar get instance => _isar;

  Future<int> put<T extends CacheModel>(T object) async {
    return _isar.writeTxn(() => _isar.collection<T>().put(object));
  }

  int putSync<T extends CacheModel>(T object) {
    return _isar.writeTxnSync(() => _isar.collection<T>().putSync(object));
  }

  Future<List<int>> putAll<T extends CacheModel>(List<T> objects) async {
    return _isar.writeTxn(() => _isar.collection<T>().putAll(objects));
  }

  Future<T?> get<T extends CacheModel>(String id) async {
    return _isar.txn(() => _isar.collection<T>().get(toIntID(id)));
  }

  T? getSync<T extends CacheModel>(String id) {
    return _isar.txnSync(() => _isar.collection<T>().getSync(toIntID(id)));
  }

  Future<T?> getFirst<T extends CacheModel>() async {
    return _isar.txn(() => _isar.collection<T>().where().findFirst());
  }

  T? getFirstSync<T extends CacheModel>() {
    return _isar.txnSync(() => _isar.collection<T>().where().findFirstSync());
  }

  Future<List<T>> getAll<T extends CacheModel>() async {
    return _isar.txn(() => _isar.collection<T>().where().findAll());
  }

  List<T> getAlSync<T extends CacheModel>() {
    return _isar.txnSync(() => _isar.collection<T>().where().findAllSync());
  }

  Future<bool> delete<T extends CacheModel>(T object) async {
    return _isar.writeTxn(() => _isar.collection<T>().delete(object.cacheID));
  }

  bool deleteSync<T extends CacheModel>(T object) {
    return _isar
        .writeTxnSync(() => _isar.collection<T>().deleteSync(object.cacheID));
  }

  Future<int> deleteAll<T extends CacheModel>(List<String> ids) async {
    return _isar.writeTxn(
      () => _isar.collection<T>().deleteAll(ids.map(toIntID).toList()),
    );
  }

  Future<int> deleteAllSync<T extends CacheModel>(List<int> ids) async {
    return _isar.writeTxnSync(() => _isar.collection<T>().deleteAllSync(ids));
  }

  Future<void> clear<T extends CacheModel>() async {
    return _isar.writeTxn(() => _isar.collection<T>().clear());
  }

  void clearSync<T extends CacheModel>() {
    return _isar.writeTxnSync(() => _isar.collection<T>().clearSync());
  }

  Future<List<T>> getAllByIDs<T extends CacheModel>(List<String> ids) async {
    return _isar.txn(() async {
      final docs =
          await _isar.collection<T>().getAll(ids.map(toIntID).toList());
      // Remove nulls.
      return docs.whereType<T>().toList();
    });
  }

  List<T> getAllByIDsSync<T extends CacheModel>(List<String> ids) {
    return _isar.txnSync(() {
      final docs = _isar.collection<T>().getAllSync(ids.map(toIntID).toList());
      // Remove nulls.
      return docs.whereType<T>().toList();
    });
  }
}
