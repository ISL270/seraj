import 'package:athar/app/core/extension_methods/validator.dart';

extension ArabicX on String {
  /// تضيف "ال" لاول الكلمة
  /// ```dart
  /// print('بطل'.definite) // البطل
  /// ```
  String get definite => hasArabicChars ? 'ال$this' : this;
}
