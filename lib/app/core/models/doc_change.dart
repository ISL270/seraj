// ignore_for_file: strict_raw_type

import 'package:athar/app/core/firestore/remote_model.dart';

/// This sealed class provides a type-safe way to handle various document change events,
/// such as adding, modifying, or removing documents. It uses generics to ensure type
/// consistency with the specific [RemoteModel] being manipulated.
///
/// The class supports three types of document changes:
/// - [DocAdded]: Represents a new document being added to the collection
/// - [DocUpdated]: Represents an existing document being updated
/// - [DocDeleted]: Represents a document being deleted from the collection
sealed class DocChange<R extends RemoteModel> {
  final R doc;
  const DocChange(this.doc);

  bool get isAdded => this is DocAdded;
  bool get isUpdated => this is DocUpdated;
  bool get isDeleted => this is DocDeleted;
}

final class DocAdded<R extends RemoteModel> extends DocChange<R> {
  const DocAdded(super.doc);
}

final class DocUpdated<R extends RemoteModel> extends DocChange<R> {
  const DocUpdated(super.doc);
}

final class DocDeleted<R extends RemoteModel> extends DocChange<R> {
  const DocDeleted(super.doc);
}
