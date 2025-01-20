/// This enum provides a standardized way to track and identify the nature of
/// modifications to objects in a data source, such as Firestore or local caches.
///
/// Use cases include:
/// - Tracking document changes in reactive data sources
/// - Filtering and handling different types of updates
/// - Providing semantic meaning to data modification events
enum ChangeType {
  /// Represents the initial state with no changes
  initial,

  /// Represents a new object being added to a collection
  added,

  /// Represents an existing object has been updated
  updated,

  /// Represents an object being deleted from a collection
  deleted;

  bool get isInitial => this == initial;
  bool get isAdded => this == added;
  bool get isUpdated => this == updated;
  bool get isDeleted => this == deleted;
}
