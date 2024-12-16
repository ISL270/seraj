import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:equatable/equatable.dart';

sealed class Status<T> extends Equatable {
  const Status();
  bool get isInitial => this is Initial;
  bool get isSuccess => this is Success;
  bool get isLoading => this is Loading;
  bool get isFailure => this is Failure;

  // TODO: fix sealed classes json serialization.
  static VoidStatus fromJson(String? json) => const Initial();
}

final class Initial<T> extends Status<T> {
  const Initial();
  @override
  List<Object?> get props => [];
}

final class Success<T> extends Status<T> {
  final T result;
  const Success(this.result);

  @override
  List<Object?> get props => [result];
}

final class Loading<T> extends Status<T> {
  const Loading();
  @override
  List<Object?> get props => [];
}

final class Failure<T> extends Status<T> {
  final GenericException exception;
  const Failure(this.exception);

  @override
  List<Object?> get props => [exception];
}

typedef VoidStatus = Status<void>;
