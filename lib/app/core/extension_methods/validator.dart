import 'package:athar/app/core/constants/regexes.dart';

extension Validator on String {
  bool get hasArabicChars => Regexes.arabicChars.hasMatch(this);
}
