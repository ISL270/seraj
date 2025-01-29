import 'dart:async';

import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_service.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

/// An abstract base class for managing local data persistence using Isar database
///
/// This generic class provides a flexible and type-safe approach to:
/// - Convert domain models to cache models
/// - Perform basic database operations
/// - Provide a consistent interface for local data storage
///
/// [D] represents the Domain model type
/// [C] represents the Cache model type, which must extend [CacheModel<D>]
abstract base class IsarSource<D, C extends CacheModel<D>> {
  @protected
  final IsarService isarService;

  const IsarSource(this.isarService);

  C? get(int id) => isarService.db.txnSync(() => isarService.db.collection<C>().getSync(id));

  C? get first {
    return isarService.db.txnSync(() => isarService.db.collection<C>().where().findFirstSync());
  }

  List<C> get all {
    return isarService.db.txnSync(() => isarService.db.collection<C>().where().findAllSync());
  }

  List<C> getAllByIDs(List<int> ids) => isarService.db.txnSync(() {
        final docs = isarService.db.collection<C>().getAllSync(ids);
        return docs.whereType<C>().toList(); // Remove nulls.
      });

  int put(C cm) => isarService.db.writeTxnSync(() {
        return isarService.db.collection<C>().putSync(cm);
      });

  List<int> putAll(List<C> objects) => isarService.db.writeTxnSync(() {
        return isarService.db.collection<C>().putAllSync(objects);
      });

  bool delete(int id) => isarService.db.writeTxnSync(() {
        return isarService.db.collection<C>().deleteSync(id);
      });

  bool deleteByID(int id) => isarService.db.writeTxnSync(() {
        return isarService.db.collection<C>().deleteSync(id);
      });

  int deleteAllByIDs(List<int> ids) => isarService.db.writeTxnSync(() {
        return isarService.db.collection<C>().deleteAllSync(ids);
      });

  void clear() => isarService.db.writeTxnSync(() => isarService.db.collection<C>().clearSync());

  Stream<C?> watchObject(int id) => isarService.db.collection<C>().watchObject(id);

  Stream<void> watchCollection() => isarService.db.collection<C>().watchLazy();
}
