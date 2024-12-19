import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  static const String name = 'azkar';

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(
          largeTitle: SuperLargeTitle(
            largeTitle: context.l10n.azkar.capitalizedDefinite,
            textStyle: context.textThemeX.large.bold.copyWith(fontSize: 32.w),
          ),
          title: Text(
            context.l10n.azkar.capitalizedDefinite,
            style: context.textThemeX.large.bold.copyWith(color: context.colorsX.onBackground),
          ),
          backgroundColor: context.colorsX.background,
          searchBar: SuperSearchBar(
            placeholderText: context.l10n.search.capitalizedDefinite,
          )),
    );
  }
}
