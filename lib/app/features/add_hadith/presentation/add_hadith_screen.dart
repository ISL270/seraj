import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/add_hadith/presentation/cubit/add_hadith_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddHadith extends StatelessWidget {
  const AddHadith({super.key});

  static const String name = 'addHadith';

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
          '${context.l10n.add} ${context.l10n.propheticHadith}',
          style: context.textThemeX.heading.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  Gap(20.h),
                  _LabelTextFieldAlignWidget(label: context.l10n.textOfHadith),
                  Gap(15.h),
                  const _TextOfHadithTextField(),
                  Gap(15.h),
                  _LabelTextFieldAlignWidget(label: context.l10n.rawiOfHadith),
                  Gap(15.h),
                  const _RawiOfHadithTextField(),
                  Gap(15.h),
                  _LabelTextFieldAlignWidget(label: context.l10n.extractionOfHadith),
                  Gap(15.h),
                  const _ExtractionOfHadithTextField(),
                  Gap(15.h),
                  _LabelTextFieldAlignWidget(label: context.l10n.hadithRule),
                  Gap(10.h),
                  const _HadithTypeSegmentedButton(),
                  Gap(10.h),
                  _LabelTextFieldAlignWidget(label: context.l10n.hadithExplain),
                  Gap(15.h),
                  const _HadithExplanationTextField(),
                  Gap(25.h),
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

class _HadithTypeSegmentedButton extends StatelessWidget {
  const _HadithTypeSegmentedButton();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddHadithCubit, AddHadithState, HadithAuthenticity>(
      selector: (state) => state.hadithAuthenticity,
      builder: (context, hadithType) {
        return SizedBox(
          height: 50.h,
          child: SegmentedButton(
            style: SegmentedButton.styleFrom(textStyle: context.textThemeX.medium.bold),
            onSelectionChanged: (selection) =>
                context.read<AddHadithCubit>().hadithAuthenticityChanged(selection.first),
            expandedInsets: EdgeInsets.all(1.h),
            showSelectedIcon: false,
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
            selected: {hadithType},
          ),
        );
      },
    );
  }
}

class _TextOfHadithTextField extends StatelessWidget {
  const _TextOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddHadithCubit, AddHadithState>(
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_TextOfHadith_textField'),
          onChanged: (value) => context.read<AddHadithCubit>().textOfHadithChanged(value),
          maxLines: 4,
          minLines: 1,
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            errorText:
                state.textOfHadith.displayError == null ? null : context.l10n.enterTextOfHadith,
            hintMaxLines: 1,
            hintText: state.hintTexts[0],
            hintStyle: context.textThemeX.medium.bold.copyWith(
              height: 1.5.h,
              overflow: TextOverflow.ellipsis,
              color: context.colorsX.onBackgroundTint35,
            ),
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
    return BlocBuilder<AddHadithCubit, AddHadithState>(
      buildWhen: (previous, current) => previous.rawiOfHadith != current.rawiOfHadith,
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_rawiOfHadith_textField'),
          onChanged: (value) => context.read<AddHadithCubit>().rawiOfHadithChanged(value),
          minLines: 1,
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
            hintText: state.hintTexts[1],
            hintStyle: context.textThemeX.medium.bold.copyWith(
              height: 1.5.h,
              color: context.colorsX.onBackgroundTint35,
            ),
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
    return BlocBuilder<AddHadithCubit, AddHadithState>(
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_extractionOfHadith_textField'),
          onChanged: (value) => context.read<AddHadithCubit>().extractionOfHadithChanged(value),
          minLines: 1,
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
            hintText: state.hintTexts[2],
            hintStyle: context.textThemeX.medium.bold.copyWith(
              height: 1.5.h,
              color: context.colorsX.onBackgroundTint35,
            ),
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
    return BlocBuilder<AddHadithCubit, AddHadithState>(
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_hadithExplanation_textField'),
          onChanged: (value) => context.read<AddHadithCubit>().hadithExplainChanged(value),
          maxLines: 4,
          minLines: 1,
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
            hintMaxLines: 2,
            hintText: state.hintTexts[3],
            hintStyle: context.textThemeX.medium.bold.copyWith(
              height: 1.5.h,
              overflow: TextOverflow.ellipsis,
              color: context.colorsX.onBackgroundTint35,
            ),
          ),
        );
      },
    );
  }
}

class _HadithAddButton extends StatelessWidget {
  const _HadithAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddHadithCubit, AddHadithState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (innerContext, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                context.l10n.hadithAddedSuccessf,
                style: context.textThemeX.medium.bold,
              ),
            ),
          );
          // temp way to navigate to athars screen.
          innerContext.pop();
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
            label: context.l10n.add,
            onPressed: state.isValid ? () => context.read<AddHadithCubit>().saveDaleelForm() : null,
          ),
        );
      },
    );
  }
}
