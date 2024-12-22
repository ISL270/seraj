import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:equatable/equatable.dart';

/// Status of a data model.
///
/// It can be in one of the following states:
/// - [Initial]: Initial state, no data has been loaded or processed yet.
/// - [Loading]: Data is being loaded or processed.
/// - [Success]: Data has been successfully loaded or processed.
/// - [Failure]: Data could not be loaded or processed due to an error.
///
/// The state transitions are as follows:
/// - [Initial] -> [Loading]
/// - [Loading] -> [Success] or [Failure]
/// - [Success] -> [Loading] (preserves the current data)
/// - [Failure] -> [Loading] (preserves the old data)
///
/// Note that the [Status] class is sealed, which means that it can not be
/// instantiated directly. Instead, you should use the corresponding state
/// classes.
sealed class Status<T> extends Equatable {
  const Status();

  /// Converts the current state to a Loading state.
  ///
  /// Handles state transitions from Initial, Success, and Failure states.
  /// - For Initial state, creates a new Loading state
  /// - For Success state, preserves the current data in the Loading state
  /// - For Failure state, preserves the old data in the Loading state
  ///
  /// Throws an exception if already in a Loading state.
  ///
  /// Returns a [Loading] state with optional current data.
  Loading<T> toLoading() => switch (this) {
        Initial<T>() => const Loading(),
        Success<T>(newData: final newData) => Loading(newData),
        Failure<T>(oldData: final oldData) => Loading(oldData),
        Loading<T>() => throw Exception('State is already loading'),
      };

  /// Converts the current state to a Failure state.
  ///
  /// Can only be called from a Loading state, preserving the current data.
  /// Throws an exception if called from any other state.
  ///
  /// [exception] The error that caused the failure.
  /// Returns a [Failure] state with the exception and optional old data.
  Failure<T> toFailure(GenericException exception) => switch (this) {
        Loading<T>(currentData: final currentData) => Failure(exception, oldData: currentData),
        _ => throw Exception('Can only go to failure from loading state'),
      };

  /// Converts the current state to a Success state.
  ///
  /// Can only be called from a Loading state.
  /// Throws an exception if called from any other state.
  ///
  /// [newData] The successful result data.
  /// Returns a [Success] state with the new data.
  Success<T> toSuccess(T newData) => switch (this) {
        Loading<T>() => Success(newData),
        _ => throw Exception('Can only go to success from loading state'),
      };

  /// Checks if the current state is Initial.
  bool get isInitial => this is Initial;

  /// Checks if the current state is Success.
  bool get isSuccess => this is Success;

  /// Checks if the current state is Loading.
  bool get isLoading => this is Loading;

  /// Checks if the current state is Failure.
  bool get isFailure => this is Failure;

  @override
  List<Object?> get props => [];

  // TODO: fix sealed classes json serialization.
  static VoidStatus fromJson(String? json) => const Initial();
}

/// Represents the initial state of a data model.
///
/// This state indicates that no data has been loaded or processed yet.
/// It serves as the starting point for data retrieval or initialization.
///
/// Type parameter [T] represents the type of data that will be loaded.
final class Initial<T> extends Status<T> {
  /// Creates an initial state with no data.
  const Initial();

  @override
  List<Object?> get props => [];
}

/// Represents a successful state with loaded or processed data.
///
/// This state contains the successfully retrieved or processed data.
/// It provides methods to transition to other states and access the data.
///
/// Type parameter [T] represents the type of data in the successful state.
final class Success<T> extends Status<T> {
  /// The data associated with the successful state.
  final T newData;

  /// Creates a success state with the provided data.
  ///
  /// [newData] The successfully retrieved or processed data.
  const Success(this.newData);

  @override
  List<Object?> get props => [newData];
}

/// Represents a loading state during data retrieval or processing.
///
/// This state indicates that an operation is in progress.
/// It can optionally carry the current or previous data during the loading process.
///
/// Type parameter [T] represents the type of data being loaded.
final class Loading<T> extends Status<T> {
  /// The current data during the loading state (optional).
  final T? currentData;

  /// Creates a loading state with optional current data.
  ///
  /// [currentData] The data available before or during the loading process.
  const Loading([this.currentData]);

  @override
  List<Object?> get props => [currentData];
}

/// Represents a failure state when an error occurs during data processing.
///
/// This state contains information about the error and optionally the previous data.
/// It allows for graceful error handling and potential retry mechanisms.
///
/// Type parameter [T] represents the type of data associated with the failure.
final class Failure<T> extends Status<T> {
  /// The exception that caused the failure.
  final GenericException exception;

  /// The data available before the failure occurred (optional).
  final T? oldData;

  /// Creates a failure state with an exception and optional old data.
  ///
  /// [exception] The error that caused the failure.
  /// [oldData] The data available before the failure occurred.
  const Failure(this.exception, {this.oldData});

  @override
  List<Object?> get props => [exception, oldData];
}

/// A type alias for a [Status] with a type argument of [void].
typedef VoidStatus = Status<void>;
