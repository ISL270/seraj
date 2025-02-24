import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_hadith/presentation/cubit/add_edit_hadith_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/tag_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddOrEditHadith extends StatelessWidget {
  const AddOrEditHadith({super.key});

  static const name = 'add-edit-hadith';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.r),
        ),
        title: Text(
          // check if the hadithId is fetched from the previous daleel screen
          context.read<AddOrEditHadithCubit>().state.hadithId != null
              ? '${context.l10n.edit} ${context.l10n.propheticHadithC}' // in edit hadith case
              : '${context.l10n.add} ${context.l10n.propheticHadith}',
          // in add hadith case
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
                  const _TextOfHadithTextField(),
                  const _RawiOfHadithTextField(),
                  const _ExtractionOfHadithTextField(),
                  const _HadithTypeSegmentedButton(),
                  const _HadithExplanationTextField(),
                  const _PrioritySliderWithLabelWidget(),
                  BlocBuilder<AddOrEditHadithCubit, AddOrEditHadithState>(
                    builder: (context, state) {
                      final cubit = context.read<AddOrEditHadithCubit>();
                      return TagSelectionWidget(
                        tags: state.tags,
                        onAddTag: (tag) {
                          final updatedTags = {
                            ...state.tags
                          }; // Create a new modifiable set
                          if (updatedTags.add(tag)) {
                            cubit.tagsChanged(updatedTags);
                          }
                        },
                        onRemoveTag: (tag) =>
                            cubit.tagsChanged({...state.tags}..remove(tag)),
                        onClearTags: () => cubit.tagsChanged(const {}),
                        availableTags: cubit.getTags(),
                      );
                    },
                  ),
                  Gap(30.h),
                ],
              ),
            ),
          ),
          const _HadithAddButton(),
          Gap(5.h)
        ],
      ),
    );
  }
}

class _TextOfHadithTextField extends StatelessWidget {
  const _TextOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditHadithCubit, AddOrEditHadithState>(
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_TextOfHadith_textField'),
          onChanged: (value) =>
              context.read<AddOrEditHadithCubit>().textOfHadithChanged(value),
          controller: context.read<AddOrEditHadithCubit>().textOfHadith,
          maxLines: 4,
          minLines: 1,
          decoration: InputDecoration(
            labelText: context.l10n.textOfHadith,
            labelStyle: context.textThemeX.medium,
            errorText: state.hadith.displayError == null
                ? null
                : context.l10n.enterTextOfHadith,
          ),
        );
      },
    );
  }
}

class _RawiOfHadithTextField extends StatelessWidget {
  const _RawiOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditHadithCubit, AddOrEditHadithState>(
      buildWhen: (previous, current) => previous.sayer != current.sayer,
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_rawiOfHadith_textField'),
          onChanged: (value) =>
              context.read<AddOrEditHadithCubit>().rawiOfHadithChanged(value),
          controller: context.read<AddOrEditHadithCubit>().rawiOfHadith,
          minLines: 1,
          decoration: InputDecoration(
            labelText: context.l10n.rawiOfHadith,
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
          ),
        );
      },
    );
  }
}

class _ExtractionOfHadithTextField extends StatelessWidget {
  const _ExtractionOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditHadithCubit, AddOrEditHadithState>(
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_extractionOfHadith_textField'),
          onChanged: (value) => context
              .read<AddOrEditHadithCubit>()
              .extractionOfHadithChanged(value),
          controller: context.read<AddOrEditHadithCubit>().extractionOfHadith,
          minLines: 1,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: context.l10n.extractionOfHadith,
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
          ),
        );
      },
    );
  }
}

class _HadithTypeSegmentedButton extends StatelessWidget {
  const _HadithTypeSegmentedButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditHadithCubit, AddOrEditHadithState>(
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: SegmentedButton(
            style: SegmentedButton.styleFrom(
                textStyle: context.textThemeX.medium.bold),
            onSelectionChanged: (selection) => context
                .read<AddOrEditHadithCubit>()
                .hadithAuthenticityChanged(selection.first!),
            expandedInsets: EdgeInsets.all(1.h),
            showSelectedIcon: false,
            emptySelectionAllowed: true,
            segments: [
              ButtonSegment(
                label: Text(context.l10n.hadithSahih),
                value: HadithAuthenticity.sahih,
              ),
              ButtonSegment(
                label: Text(context.l10n.hadithHasan),
                value: HadithAuthenticity.hasan,
              ),
              ButtonSegment(
                label: Text(context.l10n.hadithDaif),
                value: HadithAuthenticity.daif,
              ),
            ],
            selected: {state.authenticity},
          ),
        );
      },
    );
  }
}

class _HadithExplanationTextField extends StatelessWidget {
  const _HadithExplanationTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditHadithCubit, AddOrEditHadithState>(
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_hadithExplanation_textField'),
          onChanged: (value) =>
              context.read<AddOrEditHadithCubit>().descOfHadithChanged(value),
          controller: context.read<AddOrEditHadithCubit>().descOfHadith,
          maxLines: 4,
          minLines: 3,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: context.l10n.explaination,
            labelStyle: context.textThemeX.medium,
          ),
        );
      },
    );
  }
}

class _PrioritySliderWithLabelWidget extends StatelessWidget {
  const _PrioritySliderWithLabelWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditHadithCubit, AddOrEditHadithState>(
      builder: (context, state) {
        return Column(
          spacing: 15.h,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(context.l10n.priority,
                      style: context.textThemeX.medium.bold),
                ),
                Gap(8.w),
                Text(
                  '${Priority.translate(context, state.sliderValue)} ${context.l10n.saveIt}',
                  style: context.textThemeX.medium.bold.copyWith(
                    color: context.colorsX.primary,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
            Slider.adaptive(
              onChanged: (value) => context
                  .read<AddOrEditHadithCubit>()
                  .sliderPriorityChanged(value),
              value: state.sliderValue,
              activeColor: context.colorsX.primary,
              inactiveColor: context.colorsX.onBackgroundTint35,
              max: Priority.values.length - 1,
              divisions: Priority.values.length - 1,
              label: Priority.translate(context, state.sliderValue),
            ),
          ],
        );
      },
    );
  }
}

class _HadithAddButton extends StatelessWidget {
  const _HadithAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrEditHadithCubit, AddOrEditHadithState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (innerContext, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                state.hadithId == null
                    ? context.l10n.hadithAddedSuccessf // in the add case
                    : context.l10n.hadithUpdatedSuccessf, // in the update case
                style: context.textThemeX.medium.bold,
              ),
            ),
          );
          if (state.hadithId == null) innerContext.pop(); // in the add case
          context.pop();
        }

        if (state.status.isFailure) {
          context.scaffoldMessenger
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          child: Button.filled(
            key: const Key('hadithForm_saveHadithForm_button'),
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            label:
                state.hadithId == null ? context.l10n.add : context.l10n.update,
            onPressed: state.isValid
                ? () => context
                    .read<AddOrEditHadithCubit>()
                    .saveOrUpdateHadithForm()
                : null,
          ),
        );
      },
    );
  }
}
