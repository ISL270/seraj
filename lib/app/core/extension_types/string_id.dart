extension type StringID(String value) {
  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  int get fastHash {
    // ignore: avoid_js_rounded_ints
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < value.length) {
      final codeUnit = value.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
