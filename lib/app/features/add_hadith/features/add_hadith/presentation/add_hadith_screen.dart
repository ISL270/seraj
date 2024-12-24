import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/domain/models/hadith_type.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/presentation/cubit/add_hadith_cubit.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    const Gap(20),
                    _LabelTextFieldAlignWidget(label: context.l10n.textOfHadith),
                    const Gap(15),
                    const _TextOfHadithTextField(),
                    const Gap(15),
                    _LabelTextFieldAlignWidget(label: context.l10n.isnadOfHadith),
                    const Gap(15),
                    const _IsnadOfHadithTextField(),
                    const Gap(15),
                    _LabelTextFieldAlignWidget(label: context.l10n.sourceOfHadith),
                    const Gap(15),
                    const _SourceOfHadithTextField(),
                    const Gap(15),
                    _LabelTextFieldAlignWidget(label: context.l10n.hadithRule),
                    const Gap(10),
                    const _HadithTypeSegmentedButton(),
                    const Gap(10),
                    _LabelTextFieldAlignWidget(label: context.l10n.hadithExplain),
                    const Gap(15),
                    const _HadithExplanationTextField(),
                    const Gap(25),
                  ],
                ),
              ),
            ),
            const _HadithAddButton(),
            const Gap(5)
          ],
        ),
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
    return BlocSelector<AddHadithCubit, AddHadithState, HadithType>(
      selector: (state) => state.hadithType,
      builder: (context, hadithType) {
        return SizedBox(
          height: 50.h,
          child: SegmentedButton(
            style: SegmentedButton.styleFrom(textStyle: context.textThemeX.medium.bold),
            onSelectionChanged: (selection) =>
                context.read<AddHadithCubit>().hadithTypeChanged(selection.first),
            expandedInsets: EdgeInsets.all(1.h),
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                label: Text(context.l10n.hadithSahih),
                value: HadithType.sahih,
              ),
              ButtonSegment(
                label: Text(context.l10n.hadithDaif),
                value: HadithType.daif,
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
          key: const Key('textOfHadith_nameInput_textField'),
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

class _IsnadOfHadithTextField extends StatelessWidget {
  const _IsnadOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddHadithCubit, AddHadithState>(
      buildWhen: (previous, current) => previous.isnadOfHadith != current.isnadOfHadith,
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_isnadOfHadith_textField'),
          onChanged: (value) => context.read<AddHadithCubit>().isnadOfHadithChanged(value),
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

class _SourceOfHadithTextField extends StatelessWidget {
  const _SourceOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddHadithCubit, AddHadithState>(
      builder: (context, state) {
        return TextField(
          key: const Key('hadithForm_sourceOfHadith_textField'),
          onChanged: (value) => context.read<AddHadithCubit>().sourceOfHadithChanged(value),
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
      listener: (context, state) {
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
            onPressed: state.isValid ? () => context.read<AddHadithCubit>().saveHadithForm() : null,
          ),
        );
      },
    );
  }
}
