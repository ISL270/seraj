// ignore_for_file: deprecated_member_use, unused_local_variable, cast_nullable_to_non_nullable

import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/datetime_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/add_edit_athar_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_ayah/presentation/add_edit_ayah.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_hadith/presentation/add_edit_hadith_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_other/presentation/add_other_screen.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_details/bloc/daleel_details_bloc.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/details_text_widget.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/share_and_copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DaleelDetailsScreen extends StatelessWidget {
  const DaleelDetailsScreen(this.daleel, {super.key});

  static const name = 'daleel-details';
  final Daleel daleel;

  void _navigateToEditScreen(BuildContext context) {
    final routeName = switch (daleel) {
      Hadith() => AddOrEditHadith.name,
      Athar() => AddOrEditAtharScreen.name,
      Other() => AddOrEditOther.name,
      Aya() => AddEditAyah.name,
    };

    context.pushNamed(routeName, extra: daleel.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DaleelDetailsBloc, DaleelDetailsState>(
      listenWhen: (previous, current) => previous.action != current.action,
      listener: (context, state) {
        if (state.action.isDeleted) context.pop();
      },
      builder: (context, state) => Screen(
        appBar: AppBar(
          leading: BackButton(
            style: ButtonStyle(iconSize: WidgetStatePropertyAll(24.r)),
          ),
          actions: [
            IconButton(
              onPressed: () => _navigateToEditScreen(context),
              icon: Icon(FontAwesomeIcons.edit, size: 22.r),
            ),
          ],
          centerTitle: true,
          title: Text(
            context.l10n.daleelDetails,
            style: context.textThemeX.heading.bold,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.h),
                    DetailsTextWidget(
                      text: state.daleel.text,
                      actions: [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.trash, size: 18.r),
                          onPressed: () => context.read<DaleelDetailsBloc>().add(DaleelDeleted()),
                        ),
                        Gap(10.w),
                      ],
                    ),
                    Gap(15.h),
                    _DaleelDetailsWidget(
                      label: context.l10n.daleelType,
                      labelValue: switch (daleel) {
                        Hadith() => context.l10n.propheticHadith,
                        Athar() => context.l10n.athar,
                        Other() => context.l10n.other,
                        Aya() => context.l10n.aya,
                      },
                    ),
                    Gap(15.h),
                    if (state.daleel.sayer != null && state.daleel.sayer!.isNotEmpty)
                      _DaleelDetailsWidget(
                        label: context.l10n.daleelSayer,
                        labelValue: daleel.sayer.toString(),
                      ),
                    if (state.daleel.sayer != null && state.daleel.sayer!.isNotEmpty) Gap(15.h),
                    Text(
                      context.l10n.daleelTags,
                      style: context.textThemeX.large.bold.copyWith(
                        color: context.colorsX.onBackgroundTint35,
                      ),
                    ),
                    Gap(15.h),
                    Wrap(
                      spacing: 3.w,
                      runSpacing: 10.h,
                      children: List.generate(
                        daleel.tags.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: Container(
                            height: 30.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                              color: context.colorsX.primary,
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            child: Center(
                              child: Text(
                                daleel.tags.elementAt(index).name,
                                style: context.textThemeX.medium.bold.copyWith(
                                  color: context.colorsX.onBackground,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(15.h),
                    _DaleelDetailsWidget(
                      label: context.l10n.daleelPriority,
                      labelValue: '${daleel.priority.toTranslate(context)} ${context.l10n.saveIt}',
                    ),
                    Gap(15.h),
                    if (state.daleel.description != null && state.daleel.description!.isNotEmpty)
                      _DaleelDetailsWidget(
                          label: context.l10n.daleelExplain,
                          labelValue: daleel.description.toString()),
                    if (state.daleel.description != null && state.daleel.description!.isNotEmpty)
                      Gap(15.h),
                    if (state.daleel is Hadith && (daleel as Hadith).authenticity != null)
                      _DaleelDetailsWidget(
                        label: context.l10n.daleelHadithAuth,
                        labelValue: HadithAuthenticity.hasan.name.gethadithTypeString(context),
                      ),
                    if (state.daleel is Hadith && (state.daleel as Hadith).authenticity != null)
                      Gap(15.h),
                    if (state.daleel is Hadith &&
                        (state.daleel as Hadith).extraction != null &&
                        (state.daleel as Hadith).extraction!.isNotEmpty)
                      _DaleelDetailsWidget(
                        label: context.l10n.extractionOfHadith,
                        labelValue: (state.daleel as Hadith).extraction.toString(),
                      ),
                    if (state.daleel is Hadith &&
                        (state.daleel as Hadith).extraction != null &&
                        (state.daleel as Hadith).extraction!.isNotEmpty)
                      Gap(15.h),
                    _DaleelDetailsWidget(
                      label: context.l10n.daleelDate,
                      labelValue: daleel.lastRevisedAt.formatted,
                    ),
                    Gap(20.h),
                  ],
                ),
              ),
            ),
            ShareAndCopyWidget(text: state.daleel.text),
            Gap(15.h)
          ],
        ),
      ),
    );
  }
}

class _DaleelDetailsWidget extends StatelessWidget {
  const _DaleelDetailsWidget({
    required this.label,
    required this.labelValue,
  });

  final String label;
  final String labelValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textThemeX.large.bold.copyWith(
            color: context.colorsX.onBackgroundTint35,
          ),
        ),
        Gap(10.h),
        Padding(
          padding: EdgeInsets.only(
            right: context.settingsBloc.state.settings.isArabic ? 6.w : 0,
            left: context.settingsBloc.state.settings.isEnglish ? 6.w : 0,
          ),
          child: Text(
            labelValue,
            style: context.textThemeX.medium.bold.copyWith(color: context.colorsX.primary),
          ),
        ),
      ],
    );
  }
}
