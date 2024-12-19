// ignore_for_file: avoid_js_rounded_ints

mixin IsarHelper {
  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  int toIntID(String id) {
    var i = 0;
    var hash = 0xcbf29ce484222325;
    while (i < id.length) {
      final codeUnit = id.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }
    return hash;
  }
}
