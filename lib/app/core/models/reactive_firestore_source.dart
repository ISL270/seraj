// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:athar/app/core/firestore/firestore_service.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// An abstract reactive data source for Firestore collections
///
/// This class provides a generic, reusable mechanism for:
/// - Subscribing to real-time Firestore collection updates
/// - Converting Firestore documents to domain models
/// - Managing stream subscriptions
/// - Handling errors and edge cases
///
/// [FM] represents the Firebase Model type to be converted from Firestore documents
abstract base class ReactiveFirestoreSource<FM> {
  @protected
  final FirestoreService firestoreSvc;

  /// Constructor initializes the stream creation
  ReactiveFirestoreSource(this.firestoreSvc) {
    _createStream();
  }

  /// Stream controller for managing list updates
  ///
  /// Allows reactive propagation of collection changes
  late StreamController<List<FM>> _updatedListCntrlr;

  /// Initialize a new stream controller
  ///
  /// Called during construction and when restarting a closed stream
  void _createStream() => _updatedListCntrlr = StreamController<List<FM>>();

  /// Expose the stream of updated lists to consumers
  ///
  /// Provides read-only access to collection updates
  Stream<List<FM>> get listToBeUpdated => _updatedListCntrlr.stream;

  /// Manages the Firestore collection subscription
  ///
  /// Allows cancellation of the real-time listener
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _collectionSubscription;

  /// Convert a Firestore document to a domain model
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

  /// Subscribe to remote Firestore collection updates
  ///
  /// Handles:
  /// - Stream recreation if closed
  /// - Listening to collection changes
  /// - Converting documents to models
  /// - Error handling
  ///
  /// [user] The user context for the collection query
  void subToRemote(User user) {
    // Recreate stream if it has been closed
    if (_updatedListCntrlr.isClosed) _createStream();

    // Subscribe to the Firestore collection query
    _collectionSubscription = snapshotQuery(user).listen(
      (snapshot) {
        // Prevent processing if snapshot is from local cache
        if (snapshot.docChanges.isNotEmpty && snapshot.metadata.isFromCache) {
          _updatedListCntrlr.addError(const BusinessException(code: 'is_from_cache'));
        } else {
          final toBeUpdated = <FM>[];

          for (final change in snapshot.docChanges) {
            final json = change.doc.data() ?? {};

            // Convert non-empty documents to models
            if (json.isNotEmpty) {
              toBeUpdated.add(fromJson(change.doc.id, json));
            }
          }

          // Emit the list of updated models
          _updatedListCntrlr.sink.add(toBeUpdated);
        }
      },
      onError: (e) {
        if (e is FirebaseException) {
          throw BusinessException(code: e.code, message: e.message);
        }
        throw NetworkException.unkown();
      },
    );
  }

  /// Cancel the active remote subscription
  ///
  /// Closes the stream controller and cancels Firestore listener
  Future<void> cancelRemoteSub() async {
    // Close stream if not already closed
    if (!_updatedListCntrlr.isClosed) {
      await _updatedListCntrlr.close();
    }
    // Cancel Firestore subscription
    await _collectionSubscription?.cancel();
  }

  /// Cleanup method to ensure resources are released
  void dispose() => cancelRemoteSub();
}
