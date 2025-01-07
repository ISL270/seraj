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

  String decorateArabicNumbers() {
    final regex = RegExp(r'[\u0660-\u0669]+|[0-9]+');

    const arabicIndicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    String convertWesternToArabicIndic(String westernNumber) {
      return westernNumber.split('').map((char) {
        if (char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57) {
          return arabicIndicDigits[int.parse(char)];
        }
        return char;
      }).join();
    }

    String formatWithOrnateParentheses(String number) {
      const ornateLeftParenthesis = '\uFD3E'; // Unicode for ﴾
      const ornateRightParenthesis = '\uFD3F'; // Unicode for ﴿
      return '$ornateRightParenthesis$number$ornateLeftParenthesis';
    }

    // Remove all newlines before processing
    final sanitizedString = replaceAll('\n', '');

    return sanitizedString.replaceAllMapped(regex, (match) {
      final numberString = match.group(0)!;
      final arabicNumber = convertWesternToArabicIndic(numberString);
      return formatWithOrnateParentheses(arabicNumber);
    });
  }
}
