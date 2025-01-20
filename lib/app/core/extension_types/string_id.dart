extension type StringID(String value) {
  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  int get fastHash => toIntID(value);

  static int toIntID(String strID) {
    // ignore: avoid_js_rounded_ints
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < strID.length) {
      final codeUnit = strID.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
