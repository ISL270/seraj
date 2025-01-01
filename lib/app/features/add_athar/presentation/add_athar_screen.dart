// ignore_for_file: unused_element, avoid_field_initializers_in_const_classes, unnecessary_statements

import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_athar/presentation/cubit/cubit/add_athar_cubit.dart';
import 'package:athar/app/features/add_athar/presentation/cubit/cubit/add_athar_state.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddAtharScreen extends StatelessWidget {
  const AddAtharScreen({super.key});

  static const String name = 'add-athar';

  @override
  Widget build(BuildContext context) {
    return Screen(
      padding: EdgeInsets.zero,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
        ),
        title: Text(
          '${context.l10n.add} ${context.l10n.athar}',
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
                  _LabelTextFieldAlignWidget(label: context.l10n.atharText),
                  const _TextOfAtharTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.atharSayer),
                  const _SayerOfAtharTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.atharIsnad),
                  const _IsnadOfAtharTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.atharRule),
                  _RuleSelectionOfAtharTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.atharExtraction),
                  const _ExtractionOfAtharTextField(),
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

class _TextOfAtharTextField extends StatelessWidget {
  const _TextOfAtharTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        maxLines: 3,
        minLines: 2,
        decoration: InputDecoration(
          labelStyle: context.textThemeX.medium,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
          hintText: 'حدثنا مروان بن معاوية أن عمر فرض للهر مزان',
          hintMaxLines: 1,
          hintStyle: context.textThemeX.medium.bold.copyWith(
            height: 1.5.h,
            color: context.colorsX.onBackgroundTint35,
          ),
          alignLabelWithHint: false,
        ),
      ),
    );
  }
}

class _SayerOfAtharTextField extends StatelessWidget {
  const _SayerOfAtharTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        decoration: InputDecoration(
          labelStyle: context.textThemeX.medium,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
          hintText: 'أبو عبيد',
          hintStyle: context.textThemeX.medium.bold.copyWith(
            height: 1.5.h,
            color: context.colorsX.onBackgroundTint35,
          ),
          alignLabelWithHint: false,
        ),
      ),
    );
  }
}

class _IsnadOfAtharTextField extends StatelessWidget {
  const _IsnadOfAtharTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        decoration: InputDecoration(
          labelStyle: context.textThemeX.medium,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
          hintText: 'حميد بن أبي حميد الطويل, أبوعبيدة البصري, ثقة مدلس',
          hintStyle: context.textThemeX.medium.bold.copyWith(
            height: 1.5.h,
            color: context.colorsX.onBackgroundTint35,
          ),
          alignLabelWithHint: false,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _RuleSelectionOfAtharTextField extends StatelessWidget {
  List<String> rules = ['صحيح', 'حسن', 'ضعيف', 'متقطع', 'اخرى'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAtharCubit, AddAtharState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            right: context.settingsBloc.state.settings.language.isArabic ? 20.w : 0,
            left: context.settingsBloc.state.settings.language.isEnglish ? 20.w : 0,
          ),
          child: Column(
            spacing: state.selectRule == 4 ? 20.h : 0,
            children: [
              SizedBox(
                height: 60.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: context.colorsX.primary,
                    borderRadius: BorderRadius.circular(12.w),
                    onTap: () => context.read<AddAtharCubit>().selectIndexChanged(index),
                    child: _AtharRuleContainerSelection(
                      label: rules[index],
                      isSelected: state.selectRule == index,
                    ),
                  ),
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemCount: rules.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: context.settingsBloc.state.settings.language.isArabic ? 0 : 20.w,
                  left: context.settingsBloc.state.settings.language.isEnglish ? 0 : 20.w,
                ),
                child: Visibility(
                  visible: state.selectRule == 4,
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: context.textThemeX.medium,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
                      hintText: context.l10n.atharRule,
                      hintStyle: context.textThemeX.medium.bold.copyWith(
                        height: 1.5.h,
                        color: context.colorsX.onBackgroundTint35,
                      ),
                      alignLabelWithHint: false,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _ExtractionOfAtharTextField extends StatelessWidget {
  const _ExtractionOfAtharTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        decoration: InputDecoration(
          labelStyle: context.textThemeX.medium,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
          hintText: 'رواه أبوعبيد في الأموال',
          hintStyle: context.textThemeX.medium.bold.copyWith(
            height: 1.5.h,
            color: context.colorsX.onBackgroundTint35,
          ),
          alignLabelWithHint: false,
        ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(label, style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _AtharAddButton extends StatelessWidget {
  const _AtharAddButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
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
