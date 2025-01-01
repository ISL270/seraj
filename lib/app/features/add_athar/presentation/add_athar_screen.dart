// ignore_for_file: unused_element

import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddAtharScreen extends StatelessWidget {
  const AddAtharScreen({super.key});

  static const name = '/add-athar';

  @override
  Widget build(BuildContext context) {
    final rules = <String>['صحيح', 'حسن', 'ضعيف', 'متقطع', 'اخرى'];
    return Screen(
      padding: EdgeInsets.zero,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
        ),
        title: Text(
          '${context.l10n.add} أثر',
          style: context.textThemeX.heading.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 15.h,
                children: [
                  Gap(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const _LabelTextFieldAlignWidget(label: 'النص'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TextField(
                      maxLines: 3,
                      minLines: 2,
                      decoration: InputDecoration(
                        labelStyle: context.textThemeX.medium,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
                        hintText: 'نص الاثر',
                        hintMaxLines: 1,
                        hintStyle: context.textThemeX.medium.bold.copyWith(
                          height: 1.5.h,
                          color: context.colorsX.onBackgroundTint35,
                        ),
                        alignLabelWithHint: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const _LabelTextFieldAlignWidget(label: 'القائل'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TextField(
                      decoration: InputDecoration(
                        labelStyle: context.textThemeX.medium,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
                        hintText: 'قائل الاثر',
                        hintStyle: context.textThemeX.medium.bold.copyWith(
                          height: 1.5.h,
                          color: context.colorsX.onBackgroundTint35,
                        ),
                        alignLabelWithHint: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const _LabelTextFieldAlignWidget(label: 'الإسناد'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TextField(
                      decoration: InputDecoration(
                        labelStyle: context.textThemeX.medium,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
                        hintText: 'إسناد الاثر',
                        hintStyle: context.textThemeX.medium.bold.copyWith(
                          height: 1.5.h,
                          color: context.colorsX.onBackgroundTint35,
                        ),
                        alignLabelWithHint: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const _LabelTextFieldAlignWidget(label: 'الحكم'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: context.settingsBloc.state.settings.language.isArabic ? 16.w : 0,
                      left: context.settingsBloc.state.settings.language.isEnglish ? 16.w : 0,
                    ),
                    child: SizedBox(
                      height: 60.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            _AtharRuleContainerSelection(label: rules[index]),
                        separatorBuilder: (context, index) => Gap(10.w),
                        itemCount: rules.length,
                      ),
                    ),
                  ),
                  Gap(30.h),
                ],
              ),
            ),
          ),
          const _AtharAddButton(),
          Gap(5.h)
        ],
      ),
    );
  }
}

class _AtharRuleContainerSelection extends StatelessWidget {
  const _AtharRuleContainerSelection({
    required this.label,
    this.isSelected = false,
  });

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: isSelected ? context.colorsX.primary : context.colorsX.onBackgroundTint35,
        boxShadow: [
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurStyle: BlurStyle.outer,
            blurRadius: 0.2,
          ),
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurStyle: BlurStyle.outer,
            blurRadius: 0.4,
          ),
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurStyle: BlurStyle.outer,
            blurRadius: 0.6,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        child: Text(label, style: context.textThemeX.large.bold),
      ),
    );
  }
}

class _LabelTextFieldAlignWidget extends StatelessWidget {
  const _LabelTextFieldAlignWidget({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(label, style: context.textThemeX.medium.bold),
    );
  }
}

class _AtharAddButton extends StatelessWidget {
  const _AtharAddButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Button.filled(
        key: const Key('atharForm_saveAtharForm_button'),
        maxWidth: true,
        density: ButtonDensity.comfortable,
        label: context.l10n.add,
        onPressed: () {},
      ),
    );
  }
}
