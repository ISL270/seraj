import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:equatable/equatable.dart';

/// Represents a type-safe state management mechanism for handling data loading states.
///
/// The [Status] class is a sealed generic class that provides a robust way to
/// manage the lifecycle of data loading across different states. It supports
/// type-safe state transitions and preserves data integrity throughout the process.
///
/// States:
/// - [Initial]: Represents the starting state before any data loading begins.
/// - [Loading]: Indicates an ongoing data retrieval or processing operation.
/// - [Success]: Represents successful data retrieval or processing.
/// - [Failure]: Represents a state where an error occurred during data handling.
///
/// Key Features:
/// - Immutable state representation
/// - Type-safe state transitions
/// - Data preservation across state changes
/// - Flexible error handling
///
/// Example:
/// ```dart
/// VoidStatus status = Initial();
/// status = status.toLoading(); // Transitions to Loading state
/// status = status.toSuccess(data); // Transitions to Success state
/// status = status.toFailure(exception); // Transitions to Failure state
/// ```
sealed class Status<T> extends Equatable {
  const Status();

  /// Converts the current state to a [Loading] state.
  ///
  /// Handles state transitions from [Initial], [Success], and [Failure] states.
  /// Preserves existing data during the transition:
  /// - For [Initial] state, keeps initial data
  /// - For [Success] state, keeps current data
  /// - For [Failure] state, keeps previous data
  ///
  /// Returns a new [Loading] state with optional current data.
  Loading<T> toLoading() => switch (this) {
        Initial<T>(initialData: final currentData) => Loading(currentData),
        Loading<T>(currentData: final currentData) => Loading(currentData),
        Success<T>(newData: final currentData) => Loading(currentData),
        Failure<T>(oldData: final currentData) => Loading(currentData),
      };

  /// Transitions the current state to a [Failure] state with the provided exception.
  /// Preserves the existing data before the failure occurred.
  ///
  /// [exception] The [GenericException] that caused the failure.
  ///
  /// Returns a new [Failure] state with the exception and optional previous data.
  Failure<T> toFailure(GenericException exception) => switch (this) {
        Initial<T>(initialData: final oldData) => Failure(exception, oldData: oldData),
        Loading<T>(currentData: final oldData) => Failure(exception, oldData: oldData),
        Success<T>(newData: final oldData) => Failure(exception, oldData: oldData),
        Failure<T>(oldData: final oldData) => Failure(exception, oldData: oldData),
      };

  /// Transitions the current state to a [Success] state with the provided data.
  /// Can be called from any state, replacing the previous data.
  ///
  /// [newData] The successful result data of type [T].
  ///
  /// Returns a new [Success] state with the new data.
  Success<T> toSuccess(T newData) => switch (this) {
        Initial<T>() => Success(newData),
        Loading<T>() => Success(newData),
        Success<T>() => Success(newData),
        Failure<T>() => Success(newData),
      };

  /// Returns the data associated with the current state, which may be null.
  T? get data => switch (this) {
        Initial<T>(initialData: final data) => data,
        Loading<T>(currentData: final data) => data,
        Success<T>(newData: final data) => data,
        Failure<T>(oldData: final data) => data,
      };

  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;

  @override
  List<Object?> get props => [];
}

/// This state indicates that no data has been loaded or processed yet.
/// It can optionally contain initial or default data.
///
/// [T] represents the type of data that will be loaded.
final class Initial<T> extends Status<T> {
  /// Optional initial data that can be used to prefill the model.
  final T? initialData;
  const Initial([this.initialData]);

  @override
  List<Object?> get props => [initialData];
}

/// Represents a successful state after data has been loaded or processed.
///
/// Contains the successfully retrieved or processed data of type [T].
/// Provides a way to transition to other states or access the new data.
///
/// [T] represents the type of the successfully loaded data.
final class Success<T> extends Status<T> {
  /// The data associated with the successful state.
  final T newData;
  const Success(this.newData);

  @override
  List<Object?> get props => [newData];
}

/// Indicates that an operation is in progress and optionally carries
/// the current or previous data during the loading process.
///
/// [T] represents the type of data being loaded.
final class Loading<T> extends Status<T> {
  /// The current data during the loading state (optional).
  final T? currentData;
  const Loading([this.currentData]);

  @override
  List<Object?> get props => [currentData];
}

/// Represents a failure state when an error occurs during data processing.
///
/// Contains information about the error and optionally the previous data.
/// Allows for graceful error handling and potential retry mechanisms.
///
/// [T] represents the type of data associated with the failure.
final class Failure<T> extends Status<T> {
  /// The exception that caused the failure.
  final GenericException exception;

  /// The data available before the failure occurred (optional).
  final T? oldData;
  const Failure(this.exception, {this.oldData});

  @override
  List<Object?> get props => [exception, oldData];
}

/// A type alias for a [Status] with a type argument of [void].
///
/// Useful for operations that do not require a specific data type,
/// such as simple state management without associated data.
typedef VoidStatus = Status<void>;
