// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/firestore/firestore_service.dart';
import 'package:athar/app/features/authentication/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract base class ReactiveFirestoreSource<FM> {
  @protected
  final FirestoreService firestoreSvc;

  ReactiveFirestoreSource(this.firestoreSvc) {
    _createStream();
  }

  late StreamController<List<FM>> _updatedListCntrlr;
  void _createStream() => _updatedListCntrlr = StreamController<List<FM>>();

  Stream<List<FM>> get listToBeUpdated => _updatedListCntrlr.stream;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      _collectionSubscription;

  @protected
  FM fromJson(String docID, Map<String, dynamic> json);

  @protected
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotQuery(User coach);

  void subToRemote(User user) {
    if (_updatedListCntrlr.isClosed) _createStream();
    _collectionSubscription = snapshotQuery(user).listen(
      (snapshot) {
        if (snapshot.docChanges.isNotEmpty && snapshot.metadata.isFromCache) {
          _updatedListCntrlr
              .addError(const BusinessException(code: 'is_from_cache'));
        } else {
          final toBeUpdated = <FM>[];

          for (final change in snapshot.docChanges) {
            final json = change.doc.data() ?? {};
            if (json.isNotEmpty) {
              toBeUpdated.add(fromJson(change.doc.id, json));
            }
          }
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

  Future<void> cancelRemoteSub() async {
    if (!_updatedListCntrlr.isClosed) {
      await _updatedListCntrlr.close();
    }
    await _collectionSubscription?.cancel();
  }

  void dispose() => cancelRemoteSub();
}
