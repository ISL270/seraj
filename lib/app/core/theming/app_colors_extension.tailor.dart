// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_colors_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ColorsXTailorMixin on ThemeExtension<ColorsX> {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get background;
  Color get secondaryBackground;
  Color get onBackground;
  Color get onBackgroundTint;
  Color get error;
  Color get onBackgroundTint35;

  @override
  ColorsX copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? background,
    Color? secondaryBackground,
    Color? onBackground,
    Color? onBackgroundTint,
    Color? error,
    Color? onBackgroundTint35,
  }) {
    return ColorsX(
      background: background ?? this.background,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      onBackground: onBackground ?? this.onBackground,
      onBackgroundTint: onBackgroundTint ?? this.onBackgroundTint,
    );
  }

  @override
  ColorsX lerp(covariant ThemeExtension<ColorsX>? other, double t) {
    if (other is! ColorsX) return this as ColorsX;
    return ColorsX(
      background: Color.lerp(background, other.background, t)!,
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackgroundTint:
          Color.lerp(onBackgroundTint, other.onBackgroundTint, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ColorsX &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(onPrimary, other.onPrimary) &&
            const DeepCollectionEquality().equals(secondary, other.secondary) &&
            const DeepCollectionEquality()
                .equals(onSecondary, other.onSecondary) &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(secondaryBackground, other.secondaryBackground) &&
            const DeepCollectionEquality()
                .equals(onBackground, other.onBackground) &&
            const DeepCollectionEquality()
                .equals(onBackgroundTint, other.onBackgroundTint) &&
            const DeepCollectionEquality().equals(error, other.error) &&
            const DeepCollectionEquality()
                .equals(onBackgroundTint35, other.onBackgroundTint35));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(onPrimary),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(onSecondary),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(secondaryBackground),
      const DeepCollectionEquality().hash(onBackground),
      const DeepCollectionEquality().hash(onBackgroundTint),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(onBackgroundTint35),
    );
  }
}

extension ColorsXBuildContext on BuildContext {
  ColorsX get colorsX => Theme.of(this).extension<ColorsX>()!;
}
