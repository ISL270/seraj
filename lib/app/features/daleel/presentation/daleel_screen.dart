// ignore_for_file: deprecated_member_use_from_same_package, deprecated_member_use

import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_athar/presentation/add_athar_screen.dart';
import 'package:athar/app/features/add_hadith/presentation/add_hadith_screen.dart';
import 'package:athar/app/features/add_other/presentation/add_other_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

part 'widgets/bottom_sheet.dart';

class DaleelScreen extends StatelessWidget {
  const DaleelScreen({super.key});

  static const String name = 'daleel';

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
              child: Assets.icons.plusSquaredOutlined.svg(
                width: 34.w,
                height: 34.w,
                color: context.colorsX.primary,
              ),
            ),
          ],
        ),
        title: Text(
          context.l10n.athars.capitalizedDefinite,
          style: context.textThemeX.large.bold.copyWith(color: context.colorsX.onBackground),
        ),
        backgroundColor: context.colorsX.background,
        searchBar: SuperSearchBar(placeholderText: context.l10n.search.capitalizedDefinite),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _DaleelWidget(label: 'احاديث القران الكريم'),
            _DaleelWidget(label: 'احاديث القران الكريم'),
            _DaleelWidget(label: 'احاديث القران الكريم'),
            _DaleelWidget(label: 'احاديث القران الكريم'),
          ],
        ),
      ),
    );
  }
}

class _DaleelWidget extends StatelessWidget {
  const _DaleelWidget({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3.w,
        children: [
          CircleAvatar(
            backgroundColor: context.colorsX.primary,
            radius: 24.r,
            child: Icon(FontAwesomeIcons.edit, color: context.colorsX.onBackground, size: 24.r),
          ),
          Gap(8.w),
          CircleAvatar(
            backgroundColor: context.colorsX.error,
            radius: 24.r,
            child: Icon(FontAwesomeIcons.trash, color: context.colorsX.onBackground, size: 24.r),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(4.sp),
                height: 170.h,
                decoration: BoxDecoration(
                  color: context.colorsX.primary,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.propheticHadith,
                        style: context.textThemeX.large.bold,
                      ),
                      Gap(15.h),
                      Row(
                        children: [
                          Gap(5.w),
                          Expanded(
                            child: Text(
                              label,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text('مدى الأهمية :', style: context.textThemeX.medium.bold),
                          Gap(4.w),
                          Text('يجب', style: context.textThemeX.medium.bold),
                          const Spacer(),
                          Text('5 - 1 - 2025', style: context.textThemeX.medium.bold),
                          Gap(6.w),
                        ],
                      ),
                      Gap(6.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
