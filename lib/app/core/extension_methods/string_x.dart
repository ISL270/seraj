import 'package:athar/app/core/extension_methods/arabic_x.dart';
import 'package:athar/app/core/extension_methods/english_x.dart';

extension StringX on String {
  /// Adds definite Alif Lam if Arabic,
  ///
  /// and capitalizes the first letter if English.
  /// ```dart
  /// print(context.l10n.champion.capitalizedDefinite) //if en: "Champion" / if ar: "البطل"
  /// ```
  String get capitalizedDefinite => capitalized.definite;

  String removeDiacritics() {
    // Replace ٱ (U+0671) with ا (U+0627)
    final normalized = replaceAll('\u0671', '\u0627');

    // Regular expression to match all Arabic diacritics
    final diacritics = RegExp(
        r'[\u064B-\u065F\u0610-\u061A\u06D6-\u06DC\u06DF-\u06E8\u06EA-\u06ED]');

    return normalized.replaceAll(diacritics, '');
  }
}
