// ignore_for_file: unused_element, unused_local_variable

import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/azkar/sub_features/add_azkar/presentation/cubit/add_azkar_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/number_picker_bs.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/tag_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddAzkarScreen extends StatelessWidget {
  const AddAzkarScreen({super.key});

  static const String name = 'add-azkar-screen';

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
          context.read<AddAzkarCubit>().state.azkarId == null
              ? context.l10n.addAzkar
              : context.l10n.editAzkar,
          style: context.textThemeX.heading.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 12.h,
                children: [
                  _LabelTextFieldAlignWidget(label: context.l10n.azkarText),
                  const _TextOfAzkarTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.azkarExplain),
                  const _ExplanationOfAzkarTextField(),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: _LabelTextFieldAlignWidget(label: context.l10n.azkarRepeat),
                      ),
                      const Expanded(child: _RepeatNumberOfAzkarTextField()),
                    ],
                  ),
                  _LabelTextFieldAlignWidget(label: context.l10n.tagsOfAzkar),
                  BlocBuilder<AddAzkarCubit, AddAzkarState>(
                    builder: (context, state) {
                      final cubit = context.read<AddAzkarCubit>();
                      return TagSelectionWidget(
                        tags: state.tags,
                        onAddTag: (tag) {
                          final updatedTags = {...state.tags};
                          if (updatedTags.add(tag)) {
                            cubit.tagsChanged(updatedTags);
                          }
                        },
                        onRemoveTag: (tag) => cubit.tagsChanged(state.tags..remove(tag)),
                        onClearTags: () => cubit.tagsChanged({}),
                        availableTags: cubit.getTags(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const _AddAzkarButton(),
          Gap(10.h)
        ],
      ),
    );
  }
}

class _TextOfAzkarTextField extends StatelessWidget {
  const _TextOfAzkarTextField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddAzkarCubit, AddAzkarState, Name>(
      selector: (state) => state.text,
      builder: (context, text) {
        return TextField(
          key: const Key('AzkarForm_TextOfAzkar_textField'),
          maxLines: 3,
          minLines: 1,
          controller: context.read<AddAzkarCubit>().textOfAzkar,
          onChanged: (text) => context.read<AddAzkarCubit>().textOfAzkarChanged(text),
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            hintText: 'سبحان الله وبحمده، سبحان الله العظيم',
            errorText: text.displayError == null ? null : context.l10n.enterTextOfAzkar,
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

class _ExplanationOfAzkarTextField extends StatelessWidget {
  const _ExplanationOfAzkarTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAzkarCubit, AddAzkarState>(
      builder: (context, state) {
        return TextField(
          key: const Key('AzkarForm_ExplanationOfAzkar_textField'),
          maxLines: 3,
          minLines: 2,
          onChanged: (text) => context.read<AddAzkarCubit>().explanationChanged(text),
          controller: context.read<AddAzkarCubit>().explanation,
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            hintText:
                'ذكر "سبحان الله وبحمده، سبحان الله العظيم" هو من أذكار التسبيح التي تعبر عن تنزيه لله تعالى عن كل نقص وعيب، مع الثناء على جلاله وعظمته. يعتبر هذا الذكر من الأذكار المباركة التي لها فضل عظيم في الإسلام، فقد ورد في الأحاديث النبوية أن من يقول هذا الذكر مائة مرة يغفر الله له ذنوبه وإن كانت مثل زبد البحر. كما أن هذا الذكر يغرس للمسلم شجرة في الجنة،',
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

class _RepeatNumberOfAzkarTextField extends StatelessWidget {
  const _RepeatNumberOfAzkarTextField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddAzkarCubit>();
    Future<void> onNoOfRepeatTapped() async {
      final currentState = context.read<AddAzkarCubit>().state;
      final initialValue = double.tryParse(cubit.noOfRepetitionsController.text) ?? 1;

      final newValue = await NumberPickerBS.show(context, initial: initialValue);
      if (newValue != null) {
        cubit.noOfRepetitionsChanged(newValue.toInt());
      }

      cubit.noOfRepetitionsController.text = newValue?.toInt().toString() ??
          // used to save the value of repeat number when dismiss the bottom sheet
          cubit.noOfRepetitionsController.text;
    }

    return BlocBuilder<AddAzkarCubit, AddAzkarState>(
      builder: (context, state) {
        return TextField(
          key: const Key('AzkarForm_RepeatNumberOfAzkar_textField'),
          controller: cubit.noOfRepetitionsController,
          readOnly: true,
          textAlign: TextAlign.center,
          onTap: onNoOfRepeatTapped,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            hintText: state.noOfRepeats.toString(),
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

class _AddAzkarButton extends StatelessWidget {
  const _AddAzkarButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAzkarCubit, AddAzkarState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (innerContext, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                context.l10n.azkarAdded,
                style: context.textThemeX.medium.bold,
              ),
            ),
          );
          innerContext.pop();
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
            key: const Key('azkarForm_saveAzkarForm_button'),
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            label: state.azkarId == null ? context.l10n.add : context.l10n.update,
            onPressed: state.isValid
                ? () {
                    context.read<AddAzkarCubit>().addOrUpdateAzkarForm();
                    if (context.mounted) context.pop();
                  }
                : null,
          ),
        );
      },
    );
  }
}
