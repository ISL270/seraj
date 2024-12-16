import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_service.dart';
import 'package:flutter/foundation.dart';

abstract base class IsarSource<D, C extends CacheModel<D>> {
  @protected
  final IsarService isarService;

  const IsarSource(this.isarService);

  Future<void> clear() => isarService.clear<C>();

  Future<List<int>> putAll(List<D> list) =>
      isarService.putAll<C>(list.map(fromDomain).toList());

  C fromDomain(D dm);
}
