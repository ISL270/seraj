// ignore_for_file: inference_failure_on_untyped_parameter, strict_raw_type

import 'dart:async';

import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/firestore_service.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/models/doc_change.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/domain/models/auth_state.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// An abstract base class for creating reactive Firestore data sources.
///
/// This class provides a generic mechanism for:
/// - Subscribing to Firestore collection updates
/// - Transforming Firestore document snapshots into domain models
/// - Managing stream subscriptions for real-time data synchronization
///
/// Key Features:
/// - Supports real-time updates from Firestore
/// - Handles caching and fresh login scenarios
/// - Provides error handling for network and Firestore-related issues
///
/// [FM] refers to Firestore Model.
abstract base class ReactiveFirestoreSource<FM extends RemoteModel> with FirestoreHelper {
  @protected
  final FirestoreService firestoreSvc;

  ReactiveFirestoreSource(this.firestoreSvc) {
    _createStream();
  }

  /// Stream controller for managing list updates
  ///
  /// Allows reactive propagation of collection changes with type-safe [DocChange] events
  late StreamController<List<DocChange<FM>>> _changesCntrlr;

  /// Initializes a new stream controller
  ///
  /// Called during construction and when restarting a closed stream
  void _createStream() => _changesCntrlr = StreamController<List<DocChange<FM>>>();

  /// Exposes a read-only stream of document changes to consumers
  ///
  /// Provides a stream of [DocChange] events, allowing subscribers to reactively
  /// respond to additions, modifications, and deletions in the Firestore collection.
  Stream<List<DocChange<FM>>> get changes => _changesCntrlr.stream;

  /// Manages the Firestore collection subscription
  ///
  /// Allows for cancellation of the real-time listener when no longer needed.
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _collectionSubscription;

  /// Converts a Firestore document to a domain model
  ///
  /// [docID] The unique identifier of the Firestore document
  /// [json] The raw document data to be converted
  ///
  /// Must be implemented by subclasses to define specific model conversion logic
  @protected
  FM fromJson(String docID, Map<String, dynamic> json);

  /// Define the Firestore query for listening to collection updates
  ///
  /// [user] The user context for filtering the collection
  ///
  /// Must be implemented by subclasses to specify the exact collection and query
  @protected
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User user);

  /// Subscribes to remote Firestore collection updates
  ///
  /// This method:
  /// - Handles stream recreation if previously closed
  /// - Listens to Firestore document changes
  /// - Transforms documents to domain models
  /// - Manages caching and fresh login scenarios
  void subToRemote(Authenticated authState) {
    // Recreate the stream if it was previously closed
    if (_changesCntrlr.isClosed) _createStream();

    // Subscribe to the Firestore query for the authenticated user
    _collectionSubscription = snapshotQuery(authState.user).listen(
      (snapshot) {
        // Check if the snapshot is from cache and not a fresh login
        if (snapshot.metadata.isFromCache && !authState.isFreshLogin) {
          // Add an error for stale cached data
          _changesCntrlr.addError(const BusinessException(code: 'is_from_cache'));
        } else {
          // List to store transformed models
          final changes = <DocChange<FM>>[];

          for (final change in snapshot.docChanges) {
            // Skip null documents
            if (change.doc.data() == null && change.type != DocumentChangeType.removed) {
              continue;
            }

            switch (change.type) {
              case DocumentChangeType.added:
                changes.add(DocAdded(fromJson(change.doc.id, change.doc.data()!)));
              case DocumentChangeType.modified:
                changes.add(DocUpdated(fromJson(change.doc.id, change.doc.data()!)));
              case DocumentChangeType.removed:
                changes.add(DocDeleted(fromJson(change.doc.id, change.doc.data()!)));
            }
          }

          // Add the list of transformed models to the stream
          _changesCntrlr.sink.add(changes);
        }
      },
      onError: (e) {
        if (e is FirebaseException) {
          // Convert Firestore exceptions to business exceptions
          throw BusinessException(code: e.code, message: e.message);
        }
        // Throw a generic network exception for unhandled errors
        throw NetworkException.unkown();
      },
    );
  }

  /// Deletes a specific document from the Firestore collection
  ///
  /// Must be implemented by subclasses to define document deletion logic
  ///
  /// Parameters:
  /// - [uid] User identifier for context or permission checks
  /// - [docID] Unique identifier of the document to be deleted
  Future<void> deleteDoc({required String uid, required String docID});

  /// This method:
  /// - Closes the stream controller if not already closed
  /// - Cancels the active Firestore collection subscription
  Future<void> cancelRemoteSub() async {
    if (!_changesCntrlr.isClosed) {
      await _changesCntrlr.close();
    }
    await _collectionSubscription?.cancel();
  }
}
