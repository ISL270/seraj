// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

mixin FirestoreHelper {
  Future<T> firestoreOperationHandler<T>(Future<T> Function() firestoreOperation) async {
    try {
      return await firestoreOperation();
    } on FirebaseException catch (e) {
      throw BusinessException(code: e.code, message: e.message);
    } catch (e) {
      throw NetworkException.unkown();
    }
  }
}
