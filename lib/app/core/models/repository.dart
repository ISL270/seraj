import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_source.dart';
import 'package:flutter/foundation.dart';

abstract class Repository<D, C extends CacheModel<D>> {
  @protected
  final IsarSource<D, C> localSource;

  Repository(this.localSource);

  C fromDomain(D dm);

  D? get(int id) => localSource.get(id)?.toDomain();

  D? getFirst() => localSource.first?.toDomain();

  List<D> getAll() => localSource.all.map((c) => c.toDomain()).toList();

  List<D> getAllByIDs(List<int> ids) =>
      localSource.getAllByIDs(ids).map((c) => c.toDomain()).toList();

  int put(D dm) => localSource.put(fromDomain(dm));

  List<int> putAll(List<D> objects) => localSource.putAll(objects.map(fromDomain).toList());

  bool delete(int id) => localSource.delete(id);

  bool deleteByID(int id) => localSource.deleteByID(id);

  int deleteAllByIDs(List<int> ids) => localSource.deleteAllByIDs(ids);

  void clear() => localSource.clear();

  Stream<D?> watchObject(int id) => localSource.watchObject(id).map((cm) => cm?.toDomain());

  Stream<void> watchCollection() => localSource.watchCollection();
}
