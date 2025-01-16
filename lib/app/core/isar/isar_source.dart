import 'dart:async';

import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_service.dart';
import 'package:flutter/foundation.dart';

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

  /// Converts a domain model to its corresponding cache model
  ///
  /// Must be implemented by subclasses to define specific conversion logic
  ///
  /// [dm] The domain model to be converted
  /// Returns the converted cache model
  C fromDomain(D dm);

  Future<int> put(D dm) => isarService.put(fromDomain(dm));

  Future<List<int>> putAll(List<D> list) => isarService.putAll(list.map(fromDomain).toList());

  Future<C?> get(String id) => isarService.get(id);

  Future<C?> getFirst() => isarService.getFirst();

  Future<List<C?>> getAll() => isarService.getAll();

  Future<List<C>> getAllByIDs(List<String> ids) => isarService.getAllByIDs(ids);

  Future<bool> delete(D dm) => isarService.delete(fromDomain(dm));

  Future<int> deleteAll(List<String> ids) => isarService.deleteAll(ids);

  Future<void> clear() => isarService.clear();

  Stream<C?> watchObject(String id) => isarService.watchObject(id);
}
