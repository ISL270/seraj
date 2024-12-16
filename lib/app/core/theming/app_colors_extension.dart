import 'package:athar/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors_extension.tailor.dart';

// We should use [ColorScheme] only if our design exactly follows the Material specifications.
// Since this is not the case, its better to define our own color scheme using [ThemeExtension].
// 'X' in class name stands for 'Extension'.
/// App Colors based our design system.
@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class ColorsX extends ThemeExtension<ColorsX> with _$ColorsXTailorMixin {
  @override
  final Color primary = AppColors.primary;
  @override
  final Color onPrimary = AppColors.secondaryLight;
  @override
  final Color secondary = AppColors.secondary;
  @override
  final Color onSecondary = AppColors.secondaryLight;
  @override
  final Color background;
  @override
  final Color secondaryBackground;
  @override
  final Color onBackground;
  @override
  final Color onBackgroundTint;
  @override
  final Color error = const Color(0xFFFF3232);
  @override
  Color get onBackgroundTint35 => onBackgroundTint.withOpacity(.35);

  ColorsX({
    required this.background,
    required this.secondaryBackground,
    required this.onBackground,
    required this.onBackgroundTint,
  });
}

extension X on ColorsX {
  bool get isLight => background == AppColors.light;
  bool get isDark => background == AppColors.dark;
}
