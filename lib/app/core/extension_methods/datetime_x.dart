// ignore_for_file: unnecessary_brace_in_string_interps

// this extension is used to convert english numbers to hindi numbers
extension DateTimeX on DateTime {
  String get formatted {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 0) {
      return 'اليوم';
    } else if (difference.inDays == 1) {
      return 'أمس';
    } else if (difference.inDays >= 2 && difference.inDays <= 7) {
      return 'قبل ${difference.inDays} أيام';
    } else {
      final day = intToHindiDigit(this.day);
      final month = intToHindiDigit(this.month);
      final year = intToHindiDigit(this.year);
      return '$day-$month-$year';
    }
  }

  String intToHindiDigit(int number) {
    const hindiDigits = '٠١٢٣٤٥٦٧٨٩';
    return number.toString().replaceAllMapped(RegExp(r'\d'), (match) {
      return hindiDigits[int.parse(match.group(0)!)];
    });
  }
}
