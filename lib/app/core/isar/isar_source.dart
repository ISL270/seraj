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

  Future<int> put(D dm) => isarService.put<C>(fromDomain(dm));

  Future<List<int>> putAll(Iterable<D> list) => isarService.putAll<C>(list.map(fromDomain));

  Future<C?> get(String id) => isarService.get<C>(id);

  Future<C?> getFirst() => isarService.getFirst<C>();

  Future<List<C?>> getAll() => isarService.getAll<C>();

  Future<List<C>> getAllByIDs(List<String> ids) => isarService.getAllByIDs<C>(ids);

  Future<bool> delete(D dm) => isarService.delete<C>(fromDomain(dm));

  Future<bool> deleteByID(String id) => isarService.deleteByID<C>(id);

  Future<int> deleteAllByIDs(Iterable<String> ids) => isarService.deleteAllByIDs<C>(ids);

  Future<void> clear() => isarService.clear<C>();

  Stream<C?> watchObject(String id) => isarService.watchObject<C>(id);
}
