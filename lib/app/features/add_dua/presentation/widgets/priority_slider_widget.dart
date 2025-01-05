part of '../add_dua_screen.dart';

class _PrioritySliderWithLabelWidget extends StatelessWidget {
  const _PrioritySliderWithLabelWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDuaCubit, AddDuaState>(
      builder: (context, state) {
        return Column(
          spacing: 15.h,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                _LabelTextFieldAlignWidget(label: context.l10n.priority),
                Gap(8.w),
                Text(
                  state.sliderValue.getPriorityName(context),
                  style: context.textThemeX.medium.bold.copyWith(
                    color: context.colorsX.primary,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
            Slider.adaptive(
              onChanged: (value) =>
                  context.read<AddDuaCubit>().sliderPriorityChanged(value),
              value: state.sliderValue,
              activeColor: context.colorsX.primary,
              inactiveColor: context.colorsX.onBackgroundTint35,
              max: Priority.values.length - 1,
              divisions: Priority.values.length - 1,
              label: state.sliderValue.getPriorityName(context),
            ),
          ],
        );
      },
    );
  }
}
