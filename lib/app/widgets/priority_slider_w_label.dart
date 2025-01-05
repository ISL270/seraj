import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PrioritySliderWithLabel extends StatelessWidget {
  const PrioritySliderWithLabel({
    required this.labelText,
    required this.priorityTitle,
    required this.priorityValue,
    required this.sliderMaxValue,
    required this.sliderDivisions,
    required this.sliderLabel,
    this.priorityTitleStyle,
    super.key,
    this.onPriorityChanged,
    this.activeColor,
    this.inactiveColor,
  });

  final String labelText;
  final String priorityTitle;
  final TextStyle? priorityTitleStyle;
  final void Function(double)? onPriorityChanged;
  final double priorityValue;
  final Color? activeColor;
  final Color? inactiveColor;
  final double sliderMaxValue;
  final int sliderDivisions;
  final String sliderLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            _LabelTextFieldAlignWidget(label: labelText),
            Gap(8.w),
            Text(
              priorityTitle,
              style: priorityTitleStyle ??
                  context.textThemeX.medium.bold
                      .copyWith(
                        color: context.colorsX.primary,
                        textBaseline: TextBaseline.alphabetic,
                      )
                      .merge(priorityTitleStyle),
            ),
          ],
        ),
        Slider.adaptive(
          onChanged: onPriorityChanged,
          value: priorityValue,
          activeColor: activeColor ?? context.colorsX.primary,
          inactiveColor: inactiveColor ?? context.colorsX.onBackgroundTint35,
          max: sliderMaxValue,
          divisions: sliderDivisions,
          label: sliderLabel,
        ),
      ],
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
