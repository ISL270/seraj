// ignore_for_file: must_be_immutable

part of '../azkar_screen.dart';

Future<void> _openFilterTagSelectionBottomSheet(AzkarFilters filters, BuildContext context) async {
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

  AzkarFilters filters;

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
          child: BlocBuilder<AzkarBloc, AzkarState>(
            builder: (context, state) {
              final tags = state.searchedTags.isNotEmpty
                  ? state.searchedTags
                  : context.read<AzkarBloc>().getTags();
              if (state.searchedTags.isEmpty &&
                  context.read<AzkarBloc>().tagSearchController.text.isNotBlank) {
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
                    final isSelected =
                        widget.filters.tags.any((t) => t.id == tag.id); // Check by ID
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            widget.filters.tags.removeWhere((t) => t.id == tag.id); // Remove by ID
                          } else {
                            widget.filters.tags.add(tag);
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
          onPressed: widget.filters.tags.isEmpty
              ? null
              : () {
                  context.read<AzkarBloc>().add(AzkarFiltered(widget.filters));
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
      child: BlocBuilder<AzkarBloc, AzkarState>(
        builder: (context, state) {
          final cubit = context.read<AzkarBloc>();
          return TextField(
            controller: cubit.tagSearchController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              isDense: true,
              hintText: context.l10n.search,
              prefixIcon: Icon(Icons.search, color: context.colorsX.onBackground),
              suffixIcon: state.searchedTags.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.cancel, color: context.colorsX.error),
                      onPressed: () {
                        cubit.add(const AzkarTagSearched(''));
                        cubit.tagSearchController.clear();
                      },
                    )
                  : null,
            ),
            onChanged: (value) => cubit.add(AzkarTagSearched(value)),
          );
        },
      ),
    );
  }
}

//------------------------------------------------------------------------------
//----------------- Drag Indicator Bottom Sheet --------------------------------
//------------------------------------------------------------------------------

class _DragIndicator extends StatelessWidget {
  const _DragIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 6.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: context.colorsX.onBackground,
          borderRadius: BorderRadius.circular(32.w),
        ),
      ),
    );
  }
}
