import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/english_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_athar/presentation/add_athar_screen.dart';
import 'package:athar/app/features/add_hadith/presentation/add_hadith_screen.dart';
import 'package:athar/app/features/add_other/presentation/add_other_screen.dart';
import 'package:athar/app/features/aya/presentation/add_new_ayah.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/priority_slider_w_label.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

part 'widgets/bottom_sheet.dart';
part 'widgets/filter_bottom_sheet.dart';

class DaleelScreen extends StatefulWidget {
  const DaleelScreen({super.key});

  static const String name = 'daleel';

  @override
  State<DaleelScreen> createState() => _DaleelScreenState();
}

class _DaleelScreenState extends State<DaleelScreen> {
  @override
  void initState() {
    context.read<DaleelBloc>();
    super.initState();
  }

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
        searchBar: SuperSearchBar(
          placeholderText: context.l10n.search.capitalizedDefinite,
          animationDuration: const Duration(milliseconds: 300),
          cancelButtonText: context.l10n.cancel,
          cancelTextStyle: TextStyle(color: context.colorsX.primary, fontSize: 16.sp),
          searchResult: const Center(child: Text('نتيجه البحث')),
          actions: [
            SuperAction(child: SizedBox(width: 12.w)),
            SuperAction(
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.filter_list_outlined, color: context.colorsX.onBackground),
              ),
            ),
            SuperAction(child: SizedBox(width: 12.w)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.w,
                  children: [
                    Gap(12.w),
                    _DaleelFilterTypeWidget(
                      label: context.l10n.daleelType,
                      onTap: () async {
                        await _openFilterDaleelTypeSelectorBottomSheet(context);
                      },
                    ),
                    _DaleelFilterTypeWidget(
                      label: context.l10n.priority,
                      onTap: () async {
                        await _openFilterPrioritySelectorBottomSheet(context);
                      },
                    ),
                    _DaleelFilterTypeWidget(
                      label: context.l10n.date,
                      onTap: () async {
                        await _openFilterDateSelectorBottomSheet(context);
                      },
                    ),
                    Gap(12.w),
                  ],
                ),
              ),
            ),
            Gap(2.h),
            BlocBuilder<DaleelBloc, DaleelState>(
              builder: (context, state) {
                return switch (state.status) {
                  Loading() => const Center(child: CircularProgressIndicator()),
                  _ => state.daleels.result.isEmpty
                      ? const Center(child: Text('لا يوجد نتائج'))
                      : ListView.separated(
                          itemBuilder: (context, i) =>
                              _DaleelWidget(label: state.daleels.result[i].text),
                          separatorBuilder: (_, __) => const Divider(),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.daleels.result.length,
                          shrinkWrap: true,
                        ),
                };
              },
            ),
            // Column(
            //   children: [
            //     _DaleelWidget(label: context.l10n.propheticHadith),
            //     _DaleelWidget(label: context.l10n.propheticHadith),
            //     _DaleelWidget(label: context.l10n.propheticHadith),
            //     _DaleelWidget(label: context.l10n.propheticHadith),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class _DaleelFilterTypeWidget extends StatelessWidget {
  const _DaleelFilterTypeWidget({this.label = 'تصنيف', this.isActive = false, this.onTap});

  final String label;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.w),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 40.h,
        decoration: BoxDecoration(
          color: isActive
              ? context.colorsX.primary.withOpacity(0.15)
              : context.colorsX.onBackgroundTint35.withOpacity(0.10),
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.sp),
          child: Center(
            child: Row(
              children: [
                Gap(3.w),
                Text(
                  label,
                  style: context.textThemeX.medium.bold.copyWith(
                    color: isActive ? context.colorsX.primary : context.colorsX.onBackgroundTint,
                  ),
                ),
                Gap(3.w),
              ],
            ),
          ),
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.all(16.sp),
                  buttonPadding: EdgeInsets.all(16.sp),
                  titlePadding: EdgeInsets.all(16.sp),
                  actionsPadding: EdgeInsets.all(16.sp),
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  backgroundColor: context.colorsX.background,
                  title: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Center(
                      child: Text(
                        context.l10n.areYouSure.capitalized,
                        style: context.textThemeX.large.bold.copyWith(
                          color: context.colorsX.primary,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(context.l10n.cancel.capitalized,
                          style: context.textThemeX.large.bold),
                    ),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(context.l10n.ok.capitalized,
                          style:
                              context.textThemeX.large.bold.copyWith(color: context.colorsX.error)),
                    ),
                  ],
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: context.colorsX.error,
              radius: 24.r,
              child: Icon(FontAwesomeIcons.trash, color: context.colorsX.onBackground, size: 24.r),
            ),
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
                          Text('${context.l10n.priority}:', style: context.textThemeX.medium.bold),
                          Gap(4.w),
                          Text(context.l10n.high, style: context.textThemeX.medium.bold),
                          const Spacer(),
                          Text(
                            '٥ يناير ٢٠٢٥',
                            style: context.textThemeX.small.bold.copyWith(
                              color: context.colorsX.onBackgroundTint35,
                            ),
                          ),
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
