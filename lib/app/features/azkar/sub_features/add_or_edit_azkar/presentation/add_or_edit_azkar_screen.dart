// ignore_for_file: unused_element, unused_local_variable

import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/azkar/sub_features/add_or_edit_azkar/presentation/cubit/add_or_edit_azkar_cubit.dart';
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

class AddOrEditAzkarScreen extends StatelessWidget {
  const AddOrEditAzkarScreen({super.key});

  static const String name = 'add-or-edit-azkar-screen';

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
          context.read<AddOrEditAzkarCubit>().state.azkarId == null
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
                  const _TextOfAzkarTextField(),
                  const _ExplanationOfAzkarTextField(),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: _LabelTextFieldAlignWidget(
                            label: context.l10n.azkarRepeat),
                      ),
                      const Expanded(child: _RepeatNumberOfAzkarTextField()),
                    ],
                  ),
                  BlocBuilder<AddOrEditAzkarCubit, AddOrEditAzkarState>(
                    builder: (context, state) {
                      final cubit = context.read<AddOrEditAzkarCubit>();
                      return TagSelectionWidget(
                        tags: state.tags,
                        onAddTag: (tag) {
                          final updatedTags = {...state.tags};
                          if (updatedTags.add(tag)) {
                            cubit.tagsChanged(updatedTags);
                          }
                        },
                        onRemoveTag: (tag) =>
                            cubit.tagsChanged(state.tags..remove(tag)),
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
    return BlocSelector<AddOrEditAzkarCubit, AddOrEditAzkarState, Name>(
      selector: (state) => state.text,
      builder: (context, text) {
        return TextField(
          key: const Key('AzkarForm_TextOfAzkar_textField'),
          maxLines: 3,
          minLines: 1,
          controller: context.read<AddOrEditAzkarCubit>().textOfAzkar,
          onChanged: (text) =>
              context.read<AddOrEditAzkarCubit>().textOfAzkarChanged(text),
          decoration: InputDecoration(
            labelText: context.l10n.azkarText,
            labelStyle: context.textThemeX.medium,
            errorText: text.displayError == null
                ? null
                : context.l10n.enterTextOfAzkar,
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
    return BlocBuilder<AddOrEditAzkarCubit, AddOrEditAzkarState>(
      builder: (context, state) {
        return TextField(
          key: const Key('AzkarForm_ExplanationOfAzkar_textField'),
          maxLines: 3,
          minLines: 2,
          onChanged: (text) =>
              context.read<AddOrEditAzkarCubit>().explanationChanged(text),
          controller: context.read<AddOrEditAzkarCubit>().explanation,
          decoration: InputDecoration(
            labelText: context.l10n.azkarExplain,
            labelStyle: context.textThemeX.medium,
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
    final cubit = context.read<AddOrEditAzkarCubit>();
    Future<void> onNoOfRepeatTapped() async {
      final currentState = context.read<AddOrEditAzkarCubit>().state;
      final initialValue =
          double.tryParse(cubit.noOfRepetitionsController.text) ?? 1;

      final newValue =
          await NumberPickerBS.show(context, initial: initialValue);
      if (newValue != null) {
        cubit.noOfRepetitionsChanged(newValue.toInt());
      }

      cubit.noOfRepetitionsController.text = newValue?.toInt().toString() ??
          // used to save the value of repeat number when dismiss the bottom sheet
          cubit.noOfRepetitionsController.text;
    }

    return BlocBuilder<AddOrEditAzkarCubit, AddOrEditAzkarState>(
      builder: (context, state) {
        return TextField(
          key: const Key('AzkarForm_RepeatNumberOfAzkar_textField'),
          controller: cubit.noOfRepetitionsController,
          readOnly: true,
          textAlign: TextAlign.center,
          onTap: onNoOfRepeatTapped,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
    return BlocConsumer<AddOrEditAzkarCubit, AddOrEditAzkarState>(
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
            label:
                state.azkarId == null ? context.l10n.add : context.l10n.update,
            onPressed: state.isValid
                ? () {
                    context.read<AddOrEditAzkarCubit>().addOrUpdateAzkarForm();
                    if (context.mounted) context.pop();
                  }
                : null,
          ),
        );
      },
    );
  }
}
