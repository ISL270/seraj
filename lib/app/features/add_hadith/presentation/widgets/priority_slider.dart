part of '../add_hadith_screen.dart';

class _PrioritySliderWidget extends StatelessWidget {
  const _PrioritySliderWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddHadithCubit, AddHadithState>(
      buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
      builder: (context, state) {
        return Slider.adaptive(
          onChanged: (value) => context.read<AddHadithCubit>().sliderPriorityChanged(value),
          value: state.sliderValue,
          activeColor: context.colorsX.primary,
          inactiveColor: context.colorsX.onBackgroundTint35,
          max: state.priorityTexts.length - 1,
          divisions: state.priorityTexts.length - 1,
          label: state.priorityTexts[state.sliderValue.toInt()],
        );
      },
    );
  }
}

class _PrioritySliderLabelWidget extends StatelessWidget {
  const _PrioritySliderLabelWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddHadithCubit, AddHadithState>(builder: (context, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          _LabelTextFieldAlignWidget(label: context.l10n.priority),
          Gap(8.w),
          Text(
            '${state.priorityTexts[state.sliderValue.toInt()]} ${context.l10n.saveIt}',
            style: context.textThemeX.medium.bold.copyWith(
              color: context.colorsX.primary,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ],
      );
    });
  }
}
