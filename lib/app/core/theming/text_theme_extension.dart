import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'text_theme_extension.tailor.dart';

// We should use [TextTheme] class only if our design exactly follows the Material specifications.
// Since this is not the case, its better to define our own custom text theme using [ThemeExtension].
// 'X' in class name stands for 'Extension'.
/// Custom text theme based our design system.
@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class TextThemeX extends ThemeExtension<TextThemeX> with _$TextThemeXTailorMixin {
  @override
  final TextStyle heading;
  @override
  final TextStyle small;
  @override
  final TextStyle medium;
  @override
  final TextStyle large;

  const TextThemeX({
    required this.heading,
    required this.small,
    required this.medium,
    required this.large,
  });
}
