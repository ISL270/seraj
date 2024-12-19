import 'package:athar/app/core/constants/app_colors.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/extension_methods/widget_state_x.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light => _themeData(_lightColorScheme);

  static ThemeData get dark => _themeData(_darkColorScheme);
}

ThemeData _themeData(ColorsX colorScheme) {
  final textTheme = TextThemeX(
    heading: GoogleFonts.notoSansArabic(fontSize: 24.sp),
    large: GoogleFonts.notoSansArabic(fontSize: 18.sp),
    medium: GoogleFonts.notoSansArabic(fontSize: 16.sp),
    small: GoogleFonts.notoSansArabic(fontSize: 14.sp),
  );
  return ThemeData(
    primaryColor: colorScheme.primary,
    scaffoldBackgroundColor: colorScheme.background,
    iconTheme: IconThemeData(color: colorScheme.onBackground),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: colorScheme.primary),
    dividerTheme: const DividerThemeData(space: 35),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorScheme.primary,
      selectionHandleColor: colorScheme.primary,
      selectionColor: colorScheme.primary.withOpacity(.4),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: textTheme.small.bold,
        foregroundColor: colorScheme.primary,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: colorScheme.background,
      foregroundColor: colorScheme.onBackground,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size(double.minPositive, 45),
        disabledForegroundColor: colorScheme.isDark ? colorScheme.onBackgroundTint : null,
        disabledBackgroundColor: colorScheme.isDark ? colorScheme.secondaryBackground : null,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(textTheme.small.bold),
        overlayColor: WidgetStatePropertyAll(colorScheme.primary.withOpacity(.08)),
        backgroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.isDisabled) {
            return colorScheme.onBackgroundTint.withOpacity(.07);
          }
          return colorScheme.primary.withOpacity(.13);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.isDisabled) {
            return colorScheme.onBackgroundTint35;
          }
          return colorScheme.primary;
        }),
        minimumSize: const WidgetStatePropertyAll(Size(double.minPositive, 45)),
        side: WidgetStateProperty.resolveWith((state) {
          if (state.isDisabled) {
            return BorderSide(color: colorScheme.onBackgroundTint35);
          }
          return BorderSide(color: colorScheme.primary);
        }),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        textStyle: textTheme.small,
        visualDensity: VisualDensity.comfortable,
        foregroundColor: colorScheme.onBackground,
        selectedBackgroundColor: colorScheme.primary,
        selectedForegroundColor: colorScheme.onPrimary,
      ),
    ),
    listTileTheme: ListTileThemeData(textColor: colorScheme.onBackground, horizontalTitleGap: 5),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(colorScheme.secondaryBackground),
      hintStyle: WidgetStatePropertyAll(textTheme.medium.copyWith(
        color: colorScheme.onBackgroundTint,
      )),
      textStyle: WidgetStatePropertyAll(textTheme.medium.copyWith(
        color: colorScheme.onBackgroundTint,
      )),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 65,
      indicatorColor: Colors.transparent,
      backgroundColor: colorScheme.secondaryBackground,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      labelTextStyle: WidgetStatePropertyAll(textTheme.small.copyWith(
        fontSize: 12,
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      )),
      iconTheme: WidgetStateProperty.resolveWith((state) {
        if (state.isSelected) {
          return IconThemeData(color: colorScheme.primary);
        }
        return IconThemeData(color: colorScheme.onBackground);
      }),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(color: colorScheme.error),
      labelStyle: TextStyle(color: colorScheme.onBackgroundTint),
      floatingLabelStyle: TextStyle(color: colorScheme.onBackground).bold,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.onBackgroundTint),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.onBackground, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.error, width: 1.8),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.onBackground),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.onBackgroundTint35),
      ),
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      side: BorderSide.none,
      backgroundColor: colorScheme.background,
      showCheckmark: false,
      selectedColor: colorScheme.primary.withOpacity(.3),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      bodyMedium: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      bodyLarge: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      labelSmall: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      labelMedium: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      labelLarge: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      titleSmall: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      titleMedium: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      titleLarge: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      displaySmall: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      displayMedium: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      displayLarge: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      headlineSmall: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      headlineMedium: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
      headlineLarge: GoogleFonts.notoSansArabic(color: colorScheme.onBackground),
    ),
    extensions: [
      // Use this instead of default colorScheme.
      colorScheme,
      // Use this instead of default textTheme.
      textTheme,
    ],
  );
}

final _lightColorScheme = ColorsX(
  background: AppColors.light,
  secondaryBackground: AppColors.secondaryLight,
  onBackground: AppColors.onLight,
  onBackgroundTint: AppColors.darkTint,
);

final _darkColorScheme = ColorsX(
  background: AppColors.dark,
  secondaryBackground: AppColors.secondaryDark,
  onBackground: AppColors.onDark,
  onBackgroundTint: AppColors.lightTint,
);
