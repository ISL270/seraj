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

  Future<void> clear() => isarService.clear<C>();

  /// Persists multiple domain models to the local database
  ///
  /// Converts domain models to cache models before storing
  ///
  /// [list] The list of domain models to be stored
  /// Returns a [Future] with a list of stored record IDs
  Future<List<int>> putAll(List<D> list) => isarService.putAll<C>(list.map(fromDomain).toList());

  /// Converts a domain model to its corresponding cache model
  ///
  /// Must be implemented by subclasses to define specific conversion logic
  ///
  /// [dm] The domain model to be converted
  /// Returns the converted cache model
  C fromDomain(D dm);
}
