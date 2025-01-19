// ignore_for_file: strict_raw_type

import 'package:athar/app/core/firestore/remote_model.dart';

/// This sealed class provides a type-safe way to handle various document change events,
/// such as adding, modifying, or removing documents. It uses generics to ensure type
/// consistency with the specific [RemoteModel] being manipulated.
///
/// The class supports three types of document changes:
/// - [DocAdded]: Represents a new document being added to the collection
/// - [DocModified]: Represents an existing document being modified
/// - [DocRemoved]: Represents a document being removed from the collection
sealed class DocChange<R extends RemoteModel> {
  const DocChange();
}

/// Represents a new document being added to a collection.
///
/// Contains the newly added document of type [R] which extends [RemoteModel].
/// This class is used to track document addition events in a data source.
final class DocAdded<R extends RemoteModel> extends DocChange<R> {
  final R newDoc;
  const DocAdded(this.newDoc);
}

/// Represents an existing document being modified in a collection.
///
/// Contains the modified document of type [R] which extends [RemoteModel].
/// This class is used to track document modification events in a data source.
final class DocModified<R extends RemoteModel> extends DocChange<R> {
  final R modifiedDoc;
  const DocModified(this.modifiedDoc);
}

/// Represents a document being removed from a collection.
///
/// Contains the ID of the removed document.
/// This class is used to track document deletion events in a data source.
final class DocRemoved<R extends RemoteModel> extends DocChange<R> {
  final String id;
  const DocRemoved(this.id);
}
