import 'package:athar/app/core/constants/app_icons.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

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

Future<void> _openBottomSheet(BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: context.colorsX.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.h),
            topRight: Radius.circular(24.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.w, bottom: 15.w, right: 10.w),
          child: _BottomSheetBody(
            items: [context.l10n.prophetichadith, context.l10n.quranicverse, context.l10n.others],
          ),
        ),
      );
    },
  );
}

class _BottomSheetBody extends StatelessWidget {
  const _BottomSheetBody({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DragIndicator(),
        const Gap(10),
        Text(context.l10n.addnew, style: context.textThemeX.large.bold),
        const Gap(20),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) => const Gap(15),
            itemBuilder: (context, index) => _BottomSheetWidget(items[index]),
          ),
        ),
      ],
    );
  }
}

class _BottomSheetWidget extends StatelessWidget {
  const _BottomSheetWidget(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: context.colorsX.onBackgroundTint35,
      ),
      child: Center(child: Text(label, style: context.textThemeX.medium.bold)),
    );
  }
}

class _DragIndicator extends StatelessWidget {
  const _DragIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 6.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: context.colorsX.onBackground,
          borderRadius: BorderRadius.circular(32.w),
        ),
      ),
    );
  }
}
