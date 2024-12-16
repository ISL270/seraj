extension DurationX on Duration {
  String toHHMM() {
    final hours = inHours.toString();
    final minutes = (inMinutes % 60).toString().padLeft(2, '0');
    return '$hours:$minutes';
  }
}
