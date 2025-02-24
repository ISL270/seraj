// ignore_for_file: must_be_immutable, unused_local_variable

part of '../daleel_screen.dart';

//------------------------------------------------------------------------------
//----------------- Filter Daleel Type Bottom Sheet ----------------------------
//------------------------------------------------------------------------------

Future<void> _openFilterDaleelTypeSelectorBottomSheet(
    DaleelFilters filters, BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (context) => Container(
      height: 280.h,
      decoration: BoxDecoration(
        color: context.colorsX.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: _FilterTypeSelectorBottomSheetBody(filters),
    ),
  );
}

class _FilterTypeSelectorBottomSheetBody extends StatelessWidget {
  _FilterTypeSelectorBottomSheetBody(this.filters);

  DaleelFilters filters;

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
        SizedBox(width: double.infinity, child: _MultiSelectDaleelType(filters: filters)),
      ],
    );
  }
}

class _MultiSelectDaleelType extends StatefulWidget {
  const _MultiSelectDaleelType({required this.filters});

  final DaleelFilters filters;

  @override
  State<_MultiSelectDaleelType> createState() => _MultiSelectDaleelTypeState();
}

class _MultiSelectDaleelTypeState extends State<_MultiSelectDaleelType> {
  @override
  void initState() {
    context.read<DaleelBloc>().state.daleelFilters.clone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(20.sp),
          child: Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: List.generate(
              DaleelType.values.length,
              (index) {
                final type = DaleelType.values[index];
                final isSelected = widget.filters.daleelType.contains(type);
                return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      widget.filters.daleelType.remove(type);
                    } else {
                      widget.filters.daleelType.add(type);
                    }
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color:
                          isSelected ? context.colorsX.primary : context.colorsX.onBackgroundTint35,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                      child: Text(
                        DaleelType.values[index].toTranslate(context),
                        style: context.textThemeX.medium.bold.copyWith(
                          color: isSelected
                              ? context.colorsX.background
                              : context.colorsX.onBackground,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        ApplyFilterButton(
          onPressed: () {
            context.read<DaleelBloc>().add(DaleelFiltered(widget.filters));
            context.pop();
          },
        ),
      ],
    );
  }
}

//------------------------------------------------------------------------------
//----------------- Filter Priority Bottom Sheet -------------------------------
//------------------------------------------------------------------------------

Future<void> _openFilterPrioritySelectorBottomSheet(
    DaleelFilters filters, BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    builder: (context) => Container(
      height: 260.h,
      decoration: BoxDecoration(
        color: context.colorsX.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: _FilterPrioritySelectorBottomSheetBody(filters),
    ),
  );
}

class _FilterPrioritySelectorBottomSheetBody extends StatelessWidget {
  const _FilterPrioritySelectorBottomSheetBody(this.filters);

  final DaleelFilters filters;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 16.h,
      children: [
        Gap(2.h),
        const _DragIndicator(),
        _PrioritySelector(filters: filters),
        Gap(6.h),
      ],
    );
  }
}

class _PrioritySelector extends StatefulWidget {
  const _PrioritySelector({required this.filters});
  final DaleelFilters filters;

  @override
  State<_PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<_PrioritySelector> {
  late DaleelFilters updatedFilters;

  @override
  void initState() {
    updatedFilters = widget.filters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaleelBloc, DaleelState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: PrioritySliderWithLabel(
                labelText: context.l10n.priority,
                priorityTitle:
                    '${Priority.translate(context, state.selectedPriority)} ${context.l10n.saveIt}',
                onPriorityChanged: (value) =>
                    context.read<DaleelBloc>().add(DaleelPriorityFilterChanged(value)),
                priorityValue: state.selectedPriority == 0 ? 0 : state.selectedPriority,
                sliderMaxValue: Priority.values.length - 1,
                sliderDivisions: Priority.values.length - 1,
                sliderLabel: Priority.translate(context, state.selectedPriority),
              ),
            ),
            ApplyFilterButton(
              onPressed: () {
                // Retrieve the new priority from the selected state
                final selectedPriority = Priority.fromDouble(state.selectedPriority);

                // Check if the selected priority is already in the list
                if (updatedFilters.priority.length == 1 &&
                    updatedFilters.priority.contains(selectedPriority)) {
                  context.pop();
                  return;
                }

                // Clear the list to ensure only the priority remains
                updatedFilters.priority.clear();

                // Add the selected priority
                updatedFilters.priority.add(selectedPriority);

                // Dispatch the event to update the Bloc state
                context.read<DaleelBloc>().add(DaleelFiltered(updatedFilters));

                // Log the updated priorities for debugging
                log(updatedFilters.priority.toString());

                // Close the current context (e.g., modal or navigation pop)
                context.pop();
              },
            )
          ],
        );
      },
    );
  }
}

//------------------------------------------------------------------------------
//----------------- Tag Filter Bottom Sheet -----------------------------------
//------------------------------------------------------------------------------

Future<void> _openFilterTagSelectionBottomSheet(DaleelFilters filters, BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color: context.colorsX.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorsX.onBackgroundTint35,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Moves up with keyboard
        ),
        child: IntrinsicHeight(child: _FilterTagSelectionBottomSheetBody(filters)),
      ),
    ),
  );
}

class _FilterTagSelectionBottomSheetBody extends StatefulWidget {
  _FilterTagSelectionBottomSheetBody(this.filters);

  DaleelFilters filters;

  @override
  State<_FilterTagSelectionBottomSheetBody> createState() =>
      _FilterTagSelectionBottomSheetBodyState();
}

class _FilterTagSelectionBottomSheetBodyState extends State<_FilterTagSelectionBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Gap(2.h),
        const _DragIndicator(),
        const _SearchBarWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: BlocBuilder<DaleelBloc, DaleelState>(
            builder: (context, state) {
              final tags = state.searchedTags.isNotEmpty
                  ? state.searchedTags
                  : context.read<DaleelBloc>().getTags();
              if (state.searchedTags.isEmpty &&
                  context.read<DaleelBloc>().tagSearchControllers.text.isNotBlank) {
                return Center(
                  child: Text(
                    context.l10n.noAvailableTags,
                    style: context.textThemeX.medium.bold,
                  ),
                );
              }
              return Wrap(
                spacing: 6.w,
                runSpacing: 6.h,
                children: List.generate(
                  tags.length,
                  (index) {
                    final tag = tags[index];
                    final isSelected = widget.filters.tag.any((t) => t.id == tag.id); // Check by ID
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            widget.filters.tag.removeWhere((t) => t.id == tag.id); // Remove by ID
                          } else {
                            widget.filters.tag.add(tag);
                          }
                        });
                      },
                      child: AnimatedContainer(
                        height: 36.h,
                        duration: const Duration(milliseconds: 400),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: isSelected
                              ? context.colorsX.primary
                              : context.colorsX.onBackgroundTint35,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                          child: Text(
                            tag.name,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textThemeX.small.bold.copyWith(
                              color: isSelected
                                  ? context.colorsX.background
                                  : context.colorsX.onBackground,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        ApplyFilterButton(
          onPressed: widget.filters.tag.isEmpty
              ? null
              : () {
                  context.read<DaleelBloc>().add(DaleelFiltered(widget.filters));
                  context.pop();
                },
        ),
        // Gap(6.h),
      ],
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

//------------------------------------------------------------------------------
//----------------- Search Field in Tag Filter Bottom Sheet --------------------
//------------------------------------------------------------------------------

class _SearchBarWidget extends StatelessWidget {
  const _SearchBarWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: BlocBuilder<DaleelBloc, DaleelState>(
        builder: (context, state) {
          final cubit = context.read<DaleelBloc>();
          return TextField(
            controller: cubit.tagSearchControllers,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              isDense: true,
              hintText: context.l10n.search,
              prefixIcon: Icon(Icons.search, color: context.colorsX.onBackground),
              suffixIcon: state.searchedTags.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.cancel, color: context.colorsX.error),
                      onPressed: () {
                        cubit.add(const DaleelTagSearched(''));
                        cubit.tagSearchControllers.clear();
                      },
                    )
                  : null,
            ),
            onChanged: (value) => cubit.add(DaleelTagSearched(value)),
          );
        },
      ),
    );
  }
}

// not used for now

// //------------------------------------------------------------------------------
// //----------------- Filter Date Bottom Sheet -----------------------------------
// //------------------------------------------------------------------------------

// Future<void> _openFilterDateSelectorBottomSheet(DaleelFilters filters, BuildContext context) async {
//   // ignore: inference_failure_on_function_invocation
//   await showModalBottomSheet(
//     elevation: 0,
//     context: context,
//     isScrollControlled: true,
//     useRootNavigator: true,
//     builder: (context) => Container(
//       height: 365.h,
//       decoration: BoxDecoration(
//         color: context.colorsX.background,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.r),
//           topRight: Radius.circular(24.r),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: context.colorsX.onBackgroundTint35,
//             blurRadius: 2,
//             blurStyle: BlurStyle.outer,
//           ),
//         ],
//       ),
//       child: const _FilterDateSelectorBottomSheetBody(),
//     ),
//   );
// }

// class _FilterDateSelectorBottomSheetBody extends StatelessWidget {
//   const _FilterDateSelectorBottomSheetBody();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 16.h,
//       children: [
//         Gap(2.h),
//         const _DragIndicator(),
//         const _EasyDateTimeLinePickerWidget(),
//         ApplyFilterButton(onPressed: () {})
//       ],
//     );
//   }
// }

// class _EasyDateTimeLinePickerWidget extends StatefulWidget {
//   const _EasyDateTimeLinePickerWidget();

//   @override
//   State<_EasyDateTimeLinePickerWidget> createState() => _EasyDateTimeLinePickerWidgetState();
// }

// class _EasyDateTimeLinePickerWidgetState extends State<_EasyDateTimeLinePickerWidget> {
//   DateTime selectedDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
//       child: Container(
//         width: double.infinity,
//         height: 200.h,
//         decoration: context.settingsBloc.state.settings.isThemeLight
//             ? null
//             : BoxDecoration(
//                 borderRadius: BorderRadius.circular(12.r),
//                 color: context.colorsX.onBackgroundTint35,
//               ),
//         child: EasyDateTimeLinePicker(
//           locale: Language.arabic.locale,
//           disableStrategy: const DisableStrategy.afterToday(),
//           monthYearPickerOptions:
//               MonthYearPickerOptions(cancelText: context.l10n.cancel, confirmText: context.l10n.ok),
//           firstDate: DateTime.now().subtract(const Duration(days: 30)),
//           daySeparatorPadding: 12.w,
//           lastDate: DateTime.now(),
//           focusedDate: selectedDate,
//           onDateChange: (date) => setState(() => selectedDate = date),
//         ),
//       ),
//     );
//   }
// }
