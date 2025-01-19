/// This enum provides a standardized way to track and identify the nature of
/// modifications to objects in a data source, such as Firestore or local caches.
///
/// Use cases include:
/// - Tracking document changes in reactive data sources
/// - Filtering and handling different types of updates
/// - Providing semantic meaning to data modification events
///
/// Example Usage:
/// ```dart
/// void handleChange(ChangeType type, MyObject obj) {
///   switch (type) {
///     case ChangeType.added:
///       // Handle new object
///       break;
///     case ChangeType.modified:
///       // Handle updated object
///       break;
///     case ChangeType.removed:
///       // Handle deleted object
///       break;
///     case ChangeType.initial:
///       // Handle initial state
///       break;
///   }
/// }
/// ```
enum ChangeType {
  /// Represents the initial state with no changes
  initial,

  /// Represents a new object being added to a collection
  added,

  /// Represents an existing object being modified
  modified,

  /// Represents an object being removed from a collection
  removed;

  bool get isAdded => this == added;
  bool get isModified => this == modified;
  bool get isRemoved => this == removed;
}
