import 'dart:ui';

extension ColorX on Color {
  /// [BlendMode.srcIn] color filter.
  ColorFilter get srcInFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
