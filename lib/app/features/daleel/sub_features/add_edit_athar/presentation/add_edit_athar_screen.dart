import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/cubit/add_edit_athar_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/cubit/add_edit_athar_state.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/tag_selection.dart';
import 'package:athar/app/widgets/tag_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddOrEditAtharScreen extends StatelessWidget {
  const AddOrEditAtharScreen({super.key});

  static const name = 'add-edit-athar';

  @override
  Widget build(BuildContext context) {
    return Screen(
      padding: EdgeInsets.zero,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.r),
        ),
        title: Text(
          context.read<AddOrEditAtharCubit>().state.atharId == null
              ? '${context.l10n.add} ${context.l10n.athar}' // in add case
              : '${context.l10n.edit} ${context.l10n.athar.capitalizedDefinite}', // in edit case
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
                spacing: 22.h,
                children: [
                  Gap(2.h),
                  const _TextOfAtharTextField(),
                  const _SayerOfAtharTextField(),
                  const _ExplainationOfAtharTextField(),
                  const _PrioritySliderWithLabelWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: BlocBuilder<AddOrEditAtharCubit, AddOrEditAtharState>(
                      builder: (context, state) {
                        final cubit = context.read<AddOrEditAtharCubit>();
                        return TagSelectionWidget(
                          tags: state.tags,
                          onAddTag: (tag) {
                            final updatedTags = {...state.tags}; // Create a new modifiable set
                            if (updatedTags.add(tag)) {
                              cubit.tagsChanged(updatedTags);
                            }
                          },
                          onRemoveTag: (tag) => cubit.tagsChanged({...state.tags}..remove(tag)),
                          onClearTags: () => cubit.tagsChanged(const {}),
                          availableTags: cubit.getTags(),
                        );
                      },
                    ),
                  ),
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
  const _TextOfAtharTextField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddOrEditAtharCubit, AddOrEditAtharState, Name>(
      selector: (state) => state.athar,
      builder: (context, athar) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            maxLines: 3,
            minLines: 2,
            onChanged: (value) => context.read<AddOrEditAtharCubit>().atharChanged(value),
            controller: context.read<AddOrEditAtharCubit>().textOfAtharCtrlr,
            decoration: InputDecoration(
              labelText: context.l10n.atharText,
              labelText: context.l10n.atharText,
              labelStyle: context.textThemeX.medium,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
              errorText: athar.displayError == null ? null : context.l10n.enterTextOfAthar,
            ),
          ),
        );
      },
    );
  }
}

class _SayerOfAtharTextField extends StatelessWidget {
  const _SayerOfAtharTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditAtharCubit, AddOrEditAtharState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            onChanged: (value) => context.read<AddOrEditAtharCubit>().sayerChanged(value),
            controller: context.read<AddOrEditAtharCubit>().sayerOfAtharCtrlr,
            decoration: InputDecoration(
              labelText: context.l10n.atharSayer,
              labelText: context.l10n.atharSayer,
              labelStyle: context.textThemeX.medium,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
            ),
          ),
        );
      },
    );
  }
}

class _ExplainationOfAtharTextField extends StatelessWidget {
  const _ExplainationOfAtharTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditAtharCubit, AddOrEditAtharState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            maxLines: 3,
            minLines: 3,
            onChanged: (value) => context.read<AddOrEditAtharCubit>().explainationChanged(value),
            controller: context.read<AddOrEditAtharCubit>().descOfAtharCtrlr,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: context.l10n.explaination,
              labelStyle: context.textThemeX.medium,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
            ),
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
    return BlocBuilder<AddOrEditAtharCubit, AddOrEditAtharState>(
      builder: (context, state) {
        return Column(
          spacing: 15.h,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(context.l10n.priority, style: context.textThemeX.medium.bold),
                  ),
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
              onChanged: (value) =>
                  context.read<AddOrEditAtharCubit>().sliderPriorityChanged(value),
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

class _AtharAddButton extends StatelessWidget {
  const _AtharAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrEditAtharCubit, AddOrEditAtharState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (innerContext, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                state.atharId == null
                    ? context.l10n.atharAddedSuccessf // in the add case
                    : context.l10n.atharUpdatedSuccessf, // in the update case
                style: context.textThemeX.medium.bold,
              ),
            ),
          );
          if (state.atharId == null) innerContext.pop(); // in the add case
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Button.filled(
            key: const Key('atharForm_saveAtharForm_button'),
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            label: state.atharId == null ? context.l10n.add : context.l10n.update,
            onPressed: state.isValid
                ? () => context.read<AddOrEditAtharCubit>().saveOrUpdateAtharForm()
                : null,
          ),
        );
      },
    );
  }
}
