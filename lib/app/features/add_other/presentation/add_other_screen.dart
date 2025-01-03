import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/priority_slider_w_label.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddOtherScreen extends StatelessWidget {
  const AddOtherScreen({super.key});

  static const name = 'add-other';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
        ),
        title: Text(
          '${context.l10n.add} ${context.l10n.others}',
          style: context.textThemeX.heading.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 15.h,
                children: [
                  Gap(10.h),
                  _LabelTextFieldAlignWidget(label: context.l10n.text),
                  const _OtherTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.sayer),
                  const _OtherSayerTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.explanation),
                  const _OtherExplainTextField(),
                  PrioritySliderWithLabel(
                    labelText: context.l10n.priority,
                    priorityTitle: Priority.urgent.name,
                    priorityValue: 3,
                    sliderMaxValue: 10,
                    sliderDivisions: 2,
                    sliderLabel: Priority.urgent.name,
                  ),
                  Gap(30.h),
                ],
              ),
            ),
          ),
          const _AddOtherButton(),
          Gap(5.h)
        ],
      ),
    );
  }
}

class _OtherTextField extends StatelessWidget {
  const _OtherTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('otherForm_otherText_textField'),
      maxLines: 3,
      minLines: 1,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText: 'مقولة تاريخية، بيت شعر، حكمة، أو أي نص آخر',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _OtherSayerTextField extends StatelessWidget {
  const _OtherSayerTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('otherForm_otherSayer_textField'),
      minLines: 1,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText: 'اسم القائل او المصدر',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _OtherExplainTextField extends StatelessWidget {
  const _OtherExplainTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('otherForm_otherExplanation_textField'),
      minLines: 2,
      maxLines: 4,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText: 'شرح النص',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
        ),
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

class _AddOtherButton extends StatelessWidget {
  const _AddOtherButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Button.filled(
        key: const Key('otherForm_saveOtherForm_button'),
        maxWidth: true,
        density: ButtonDensity.comfortable,
        label: context.l10n.add,
        onPressed: () {},
      ),
    );
  }
}
