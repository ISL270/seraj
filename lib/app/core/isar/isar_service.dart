// ignore_for_file: strict_raw_type

import 'package:athar/app/core/extension_types/string_id.dart';
import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/authentication/data/models/local/user_isar.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/dua/data/sources/dua_isar.dart';
import 'package:athar/app/features/settings/data/sources/local/settings_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@singleton
final class IsarService {
  const IsarService._(this._isar);
  final Isar _isar;

  @FactoryMethod(preResolve: true)
  static Future<IsarService> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        UserIsarSchema,
        SettingsIsarSchema,
        DaleelIsarSchema,
        DuaIsarSchema,
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

  Future<List<int>> putAll<T extends CacheModel>(Iterable<T> objects) async {
    return _isar.writeTxn(() => _isar.collection<T>().putAll(objects.toList()));
  }

  Future<T?> get<T extends CacheModel>(String id) async {
    return _isar.txn(() => _isar.collection<T>().get(StringID.toIntID(id)));
  }

  T? getSync<T extends CacheModel>(String id) {
    return _isar.txnSync(() => _isar.collection<T>().getSync(StringID.toIntID(id)));
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

  Future<bool> deleteByID<T extends CacheModel>(String id) async {
    return _isar.writeTxn(() => _isar.collection<T>().delete(StringID.toIntID(id)));
  }

  bool deleteSync<T extends CacheModel>(T object) {
    return _isar.writeTxnSync(() => _isar.collection<T>().deleteSync(object.cacheID));
  }

  Future<int> deleteAllByIDs<T extends CacheModel>(Iterable<String> ids) async {
    return _isar.writeTxn(
      () => _isar.collection<T>().deleteAll(ids.map(StringID.toIntID).toList()),
    );
  }

  Future<int> deleteAllByIDsSync<T extends CacheModel>(Iterable<String> ids) async {
    return _isar.writeTxnSync(
        () => _isar.collection<T>().deleteAllSync(ids.map(StringID.toIntID).toList()));
  }

  Future<void> clear<T extends CacheModel>() async {
    return _isar.writeTxn(() => _isar.collection<T>().clear());
  }

  void clearSync<T extends CacheModel>() {
    return _isar.writeTxnSync(() => _isar.collection<T>().clearSync());
  }

  Future<List<T>> getAllByIDs<T extends CacheModel>(List<String> ids) async {
    return _isar.txn(() async {
      final docs = await _isar.collection<T>().getAll(ids.map(StringID.toIntID).toList());
      // Remove nulls.
      return docs.whereType<T>().toList();
    });
  }

  List<T> getAllByIDsSync<T extends CacheModel>(List<String> ids) {
    return _isar.txnSync(() {
      final docs = _isar.collection<T>().getAllSync(ids.map(StringID.toIntID).toList());
      // Remove nulls.
      return docs.whereType<T>().toList();
    });
  }

  Stream<T?> watchObject<T extends CacheModel>(String id) =>
      _isar.collection<T>().watchObject(StringID.toIntID(id));
}
