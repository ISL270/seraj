// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'text_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$TextThemeXTailorMixin on ThemeExtension<TextThemeX> {
  TextStyle get heading;
  TextStyle get small;
  TextStyle get medium;
  TextStyle get large;

  @override
  TextThemeX copyWith({
    TextStyle? heading,
    TextStyle? small,
    TextStyle? medium,
    TextStyle? large,
  }) {
    return TextThemeX(
      heading: heading ?? this.heading,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  TextThemeX lerp(covariant ThemeExtension<TextThemeX>? other, double t) {
    if (other is! TextThemeX) return this as TextThemeX;
    return TextThemeX(
      heading: TextStyle.lerp(heading, other.heading, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      medium: TextStyle.lerp(medium, other.medium, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextThemeX &&
            const DeepCollectionEquality().equals(heading, other.heading) &&
            const DeepCollectionEquality().equals(small, other.small) &&
            const DeepCollectionEquality().equals(medium, other.medium) &&
            const DeepCollectionEquality().equals(large, other.large));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(heading),
      const DeepCollectionEquality().hash(small),
      const DeepCollectionEquality().hash(medium),
      const DeepCollectionEquality().hash(large),
    );
  }
}

extension TextThemeXBuildContext on BuildContext {
  TextThemeX get textThemeX => Theme.of(this).extension<TextThemeX>()!;
}
