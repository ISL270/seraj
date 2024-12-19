/// read: https://shrktna.atlassian.net/wiki/x/A4ABAg
final class Optional<T> {
  final T? _value;

  /// Gets the Optional value, or `null` if there is none.
  T? get value => _value;

  /// Constructs an empty Optional.
  const Optional.absent() : _value = null;

  /// Constructs an Optional of the given [value].
  ///
  /// If [value] is null, returns [absent()].
  const Optional.value(T? value) : _value = value;

  /// True when this optional contains a value.
  bool get isPresent => _value != null;

  /// True when this optional contains no value.
  bool get isAbsent => _value == null;

  /// Executes a function if the Optional value is present.
  void ifPresent(void Function(T value) ifPresent) {
    if (isPresent) {
      ifPresent(_value as T);
    }
  }

  /// Execution a function if the Optional value is absent.
  void ifAbsent(void Function() ifAbsent) {
    if (!isPresent) {
      ifAbsent();
    }
  }

  /// Gets the Optional value with a default.
  ///
  /// The default is returned if the Optional is [absent()].
  T or(T defaultValue) {
    return _value ?? defaultValue;
  }

  @override
  String toString() {
    return _value == null ? 'Optional { absent }' : 'Optional { value: $_value }';
  }
}
