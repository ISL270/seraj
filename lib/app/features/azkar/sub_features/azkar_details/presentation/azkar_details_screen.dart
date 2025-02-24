// ignore_for_file: deprecated_member_use

import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_details/bloc/azkar_details_bloc.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/details_text_widget.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/share_and_copy_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen(this.azkar, {super.key});

  final Azkar azkar;

  static const String name = 'azkar-details-screen';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AzkarDetailsBloc, AzkarDetailsState>(
      listenWhen: (previous, current) => previous.action != current.action,
      listener: (context, state) {
        if (state.action.isDeleted) context.pop();
      },
      child: Screen(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(10.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: context.pop,
                          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
                        ),
                        const Spacer(flex: 2),
                        Text(
                          context.l10n.azkar,
                          style: context.textThemeX.heading.bold,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(flex: 3),
                      ],
                    ),
                    Gap(20.h),
                    DetailsTextWidget(
                      text: azkar.text,
                      actions: [
                        BlocSelector<AzkarDetailsBloc, AzkarDetailsState, bool>(
                          selector: (state) => state.azkar.isFavourite,
                          builder: (context, isFavourite) {
                            return IconButton(
                              onPressed: () => context
                                  .read<AzkarDetailsBloc>()
                                  .add(const AzkarFavouriteToggled()),
                              icon: Icon(
                                isFavourite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                                color: isFavourite
                                    ? context.colorsX.error
                                    : context.colorsX.onBackground,
                                size: 20.r,
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.trash, size: 18.r),
                          onPressed: () =>
                              context.read<AzkarDetailsBloc>().add(const AzkarDeleted()),
                        ),
                        Gap(10.w),
                      ],
                    ),
                    Gap(25.h),
                    BlocBuilder<AzkarDetailsBloc, AzkarDetailsState>(
                      builder: (context, state) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              context.l10n.repetition,
                              style: context.textThemeX.heading.bold.copyWith(
                                fontSize: 20.sp,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                            ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: context.colorsX.primary.withValues(alpha: 0.5),
                              child: IconButton(
                                disabledColor: context.colorsX.background,
                                onPressed: () =>
                                    context.read<AzkarDetailsBloc>().add(IncrementCounter()),
                                icon: Icon(
                                  FontAwesomeIcons.add,
                                  size: 20.r,
                                  color: context.colorsX.onBackground,
                                ),
                              ),
                            ),
                            Gap(10.w),
                            Text(
                              state.counterValue.toString(),
                              style: context.textThemeX.heading.bold.copyWith(
                                fontSize: 18.sp,
                                color: azkar.noOfRepetitions == state.counterValue
                                    ? context.colorsX.error
                                    : context.colorsX.primary,
                              ),
                            ),
                            Text(
                              '/${azkar.noOfRepetitions}',
                              style: context.textThemeX.heading.bold.copyWith(
                                fontSize: 18.sp,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                            ),
                            Gap(10.w),
                            CircleAvatar(
                              backgroundColor: context.colorsX.primary.withValues(alpha: 0.5),
                              child: IconButton(
                                onPressed: () =>
                                    context.read<AzkarDetailsBloc>().add(ResetCounter()),
                                icon: Icon(
                                  FontAwesomeIcons.arrowRotateForward,
                                  size: 20.r,
                                  color: context.colorsX.onBackground,
                                ),
                              ),
                            ),
                            Gap(10.w),
                          ],
                        );
                      },
                    ),
                    Gap(25.h),
                    ExpandablePanel(
                      theme: ExpandableThemeData(
                        hasIcon: true,
                        expandIcon: Icons.expand_more,
                        collapseIcon: Icons.expand_less,
                        iconSize: 24.w,
                        iconColor: context.colorsX.onBackground,
                      ),
                      header: Text(
                        context.l10n.explaination,
                        style: context.textThemeX.heading.bold.copyWith(fontSize: 20.sp),
                      ),
                      collapsed: const SizedBox(),
                      expanded: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                        child: Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: context.colorsX.primary.withValues(alpha: 0.5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Text(
                              azkar.description ?? context.l10n.noDescription,
                              style: context.textThemeX.medium.copyWith(fontSize: 18.sp),
                              textDirection: context.settingsBloc.state.settings.isArabic
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ShareAndCopyWidget(text: azkar.text),
            Gap(15.h)
          ],
        ),
      ),
    );
  }
}
