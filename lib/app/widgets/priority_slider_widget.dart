import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrioritySliderWithLabelWidget<TCubit extends Cubit<TState>, TState>
    extends StatelessWidget {
  final String Function(BuildContext context) getLabel;
  final double Function(TState state) getSliderValue;
  final String Function(BuildContext context, double sliderValue)
      getPriorityName;
  final void Function(BuildContext context, double value) onSliderChanged;
  final double max;
  final int divisions;

  const PrioritySliderWithLabelWidget({
    required this.getLabel,
    required this.getSliderValue,
    required this.getPriorityName,
    required this.onSliderChanged,
    required this.max,
    required this.divisions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TCubit, TState>(
      builder: (context, state) {
        final sliderValue = getSliderValue(state);
        final label = getLabel(context);
        final priorityName = getPriorityName(context, sliderValue);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  label,
                  style: context.textThemeX.medium,
                ),
                SizedBox(width: 8.w), // Keeping consistent spacing
                Text(
                  priorityName,
                  style: context.textThemeX.medium.bold.copyWith(
                    color: context.colorsX.primary,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
            Slider.adaptive(
              value: sliderValue,
              onChanged: (value) => onSliderChanged(context, value),
              activeColor: context.colorsX.primary,
              inactiveColor: context.colorsX.onBackgroundTint35,
              max: max,
              divisions: divisions,
              label: priorityName,
            ),
          ],
        );
      },
    );
  }
}
