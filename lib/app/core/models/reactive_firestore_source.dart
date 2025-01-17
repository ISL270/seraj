// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:athar/app/core/firestore/firestore_helper.dart';
import 'package:athar/app/core/firestore/firestore_service.dart';
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
abstract base class ReactiveFirestoreSource<FM> with FirestoreHelper {
  @protected
  final FirestoreService firestoreSvc;

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
    if (_updatedListCntrlr.isClosed) _createStream();

    // Subscribe to the Firestore query for the authenticated user
    _collectionSubscription = snapshotQuery(authState.user).listen(
      (snapshot) {
        // Check if the snapshot is from cache and not a fresh login
        if (snapshot.metadata.isFromCache && !authState.isFreshLogin) {
          // Add an error for stale cached data
          _updatedListCntrlr.addError(const BusinessException(code: 'is_from_cache'));
        } else {
          // List to store transformed models
          final toBeUpdated = <FM>[];

          for (final change in snapshot.docChanges) {
            final json = change.doc.data() ?? {};

            if (json.isNotEmpty) {
              // Convert Firestore document to domain model
              toBeUpdated.add(fromJson(change.doc.id, json));
            }
          }

          // Add the list of transformed models to the stream
          _updatedListCntrlr.sink.add(toBeUpdated);
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

  Future<void> deleteDoc({required String uid, required String docID});

  /// This method:
  /// - Closes the stream controller if not already closed
  /// - Cancels the active Firestore collection subscription
  Future<void> cancelRemoteSub() async {
    if (!_updatedListCntrlr.isClosed) {
      await _updatedListCntrlr.close();
    }
    await _collectionSubscription?.cancel();
  }
}
