import 'package:athar/app/core/constants/app_icons.dart';
import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

part 'widgets/bottom_sheet.dart';
part 'add_new_hadith.dart';
part 'widgets/hadith_list_view_builder.dart';

class AtharsScreen extends StatelessWidget {
  const AtharsScreen({super.key});

  static const String name = 'athars';

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(
        largeTitle: SuperLargeTitle(
          largeTitle: context.l10n.athars.capitalizedDefinite,
          textStyle: context.textThemeX.large.bold.copyWith(fontSize: 32.w),
          actions: [
            GestureDetector(
              onTap: () => _openBottomSheet(context),
              child: SvgPicture.asset(AppIcons.addsharp, height: 28.w, width: 28.w),
            ),
          ],
        ),
        title: Row(
          children: [
            Text(
              context.l10n.athars.capitalizedDefinite,
              style: context.textThemeX.large.bold.copyWith(color: context.colorsX.onBackground),
            ),
          ],
        ),
        backgroundColor: context.colorsX.background,
        searchBar: SuperSearchBar(placeholderText: context.l10n.search.capitalizedDefinite),
      ),
      body: const Column(),
    );
  }
}
