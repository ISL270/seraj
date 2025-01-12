// ignore_for_file: use_build_context_synchronously, deprecated_member_use

part of '../daleel_screen.dart';

//------------------------------------------------------------------------------
//----------------- Filter Daleel Type Bottom Sheet ----------------------------
//------------------------------------------------------------------------------

Future<void> _openFilterDaleelTypeSelectorBottomSheet(BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      height: 320.h,
      decoration: BoxDecoration(
        color: context.colorsX.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.h),
          topRight: Radius.circular(24.h),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const _FilterTypeSelectorBottomSheetBody(),
    ),
  );
}

class _FilterTypeSelectorBottomSheetBody extends StatelessWidget {
  const _FilterTypeSelectorBottomSheetBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Gap(2.h),
        const _DragIndicator(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            context.l10n.daleelType,
            style: context.textThemeX.medium.bold.copyWith(fontSize: 16.w),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: _MultiSelectDaleelType(daleelFilter: [
                    context.l10n.athars.capitalizedDefinite,
                    context.l10n.hadiths,
                    context.l10n.ayahs,
                    context.l10n.atharsOfSahaba,
                    context.l10n.others.capitalizedDefinite
                  ]),
                ),
              ),
            ],
          ),
        ),
        const ApplyFilterButton(),
      ],
    );
  }
}

class _MultiSelectDaleelType extends StatefulWidget {
  const _MultiSelectDaleelType({required this.daleelFilter});

  final List<String> daleelFilter;

  @override
  State<_MultiSelectDaleelType> createState() => _MultiSelectDaleelTypeState();
}

class _MultiSelectDaleelTypeState extends State<_MultiSelectDaleelType> {
  final List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Wrap(
        spacing: 12.w,
        runSpacing: 12.h,
        children: List.generate(
          widget.daleelFilter.length,
          (index) {
            final isSelected = selectedIndices.contains(index); // Check if selected
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected ? selectedIndices.remove(index) : selectedIndices.add(index);
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  color: isSelected ? context.colorsX.primary : context.colorsX.onBackgroundTint35,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    widget.daleelFilter[index],
                    style: context.textThemeX.medium.bold.copyWith(
                      color: isSelected ? context.colorsX.background : context.colorsX.onBackground,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------
//----------------- Filter Priority Bottom Sheet -------------------------------
//------------------------------------------------------------------------------

Future<void> _openFilterPrioritySelectorBottomSheet(BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      height: 260.h,
      decoration: BoxDecoration(
        color: context.colorsX.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.h),
          topRight: Radius.circular(24.h),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const _FilterPrioritySelectorBottomSheetBody(),
    ),
  );
}

class _FilterPrioritySelectorBottomSheetBody extends StatelessWidget {
  const _FilterPrioritySelectorBottomSheetBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Gap(2.h),
        const _DragIndicator(),
        const _PrioritySelector(),
        const ApplyFilterButton()
      ],
    );
  }
}

class _PrioritySelector extends StatefulWidget {
  const _PrioritySelector();

  @override
  State<_PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<_PrioritySelector> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: PrioritySliderWithLabel(
        labelText: context.l10n.priority,
        priorityTitle: '${Priority.translate(context, sliderValue)} ${context.l10n.saveIt}',
        onPriorityChanged: (value) {
          setState(() {
            sliderValue = value;
          });
        },
        priorityValue: sliderValue,
        sliderMaxValue: Priority.values.length - 1,
        sliderDivisions: Priority.values.length - 1,
        sliderLabel: Priority.translate(context, sliderValue),
      ),
    );
  }
}

//------------------------------------------------------------------------------
//----------------- Filter Date Bottom Sheet -----------------------------------
//------------------------------------------------------------------------------

Future<void> _openFilterDateSelectorBottomSheet(BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      height: 365.h,
      decoration: BoxDecoration(
        color: context.colorsX.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.h),
          topRight: Radius.circular(24.h),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const _FilterDateSelectorBottomSheetBody(),
    ),
  );
}

class _FilterDateSelectorBottomSheetBody extends StatelessWidget {
  const _FilterDateSelectorBottomSheetBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Gap(2.h),
        const _DragIndicator(),
        const _EasyDateTimeLinePickerWidget(),
        const ApplyFilterButton()
      ],
    );
  }
}

class _EasyDateTimeLinePickerWidget extends StatefulWidget {
  const _EasyDateTimeLinePickerWidget();

  @override
  State<_EasyDateTimeLinePickerWidget> createState() => _EasyDateTimeLinePickerWidgetState();
}

class _EasyDateTimeLinePickerWidgetState extends State<_EasyDateTimeLinePickerWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: context.settingsBloc.state.settings.isThemeLight
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: context.colorsX.onBackgroundTint35,
              ),
        child: EasyDateTimeLinePicker(
          locale: Language.arabic.locale,
          disableStrategy: const DisableStrategy.afterToday(),
          monthYearPickerOptions:
              MonthYearPickerOptions(cancelText: context.l10n.cancel, confirmText: context.l10n.ok),
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          daySeparatorPadding: 12.w,
          lastDate: DateTime.now(),
          focusedDate: selectedDate,
          onDateChange: (date) => setState(() => selectedDate = date),
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------
//----------------- Shared Apply Button Bottom Sheet ---------------------------
//------------------------------------------------------------------------------

class ApplyFilterButton extends StatelessWidget {
  const ApplyFilterButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Button.filled(
        maxWidth: true,
        density: ButtonDensity.comfortable,
        shape: ButtonShape.roundedCorners,
        onPressed: onPressed,
        label: context.l10n.apply,
      ),
    );
  }
}
