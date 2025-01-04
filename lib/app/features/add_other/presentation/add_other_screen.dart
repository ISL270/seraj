import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_other/presentation/cubit/add_other_cubit.dart';
import 'package:athar/app/features/add_other/presentation/cubit/add_other_state.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/priority_slider_w_label.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddOtherScreen extends StatelessWidget {
  const AddOtherScreen({super.key});

  static const name = 'add-other';

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
          '${context.l10n.add} ${context.l10n.others}',
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
                  _LabelTextFieldAlignWidget(label: context.l10n.text),
                  const _OtherTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.sayer),
                  const _OtherSayerTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.explanation),
                  const _OtherExplainTextField(),
                  const _PrioritySliderWithLabelBlocBuilder(),
                  Gap(30.h),
                ],
              ),
            ),
          ),
          const _AddOtherButton(),
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

class _OtherTextField extends StatelessWidget {
  const _OtherTextField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddOtherCubit, AddOtherState, Name>(
      selector: (state) => state.other,
      builder: (context, other) {
        return TextField(
          key: const Key('otherForm_otherText_textField'),
          maxLines: 3,
          minLines: 1,
          onChanged: (other) => context.read<AddOtherCubit>().otherTextChanged(other),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
            hintText: 'مقولة تاريخية، بيت شعر، حكمة، أو أي نص آخر',
            errorText: other.displayError == null ? null : context.l10n.enterText,
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

class _OtherSayerTextField extends StatelessWidget {
  const _OtherSayerTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOtherCubit, AddOtherState>(
      builder: (context, state) {
        return TextField(
          key: const Key('otherForm_otherSayer_textField'),
          minLines: 1,
          textInputAction: TextInputAction.next,
          onChanged: (sayer) => context.read<AddOtherCubit>().sayerChanged(sayer),
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
            hintText: 'اسم القائل او المصدر',
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

class _OtherExplainTextField extends StatelessWidget {
  const _OtherExplainTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOtherCubit, AddOtherState>(
      builder: (context, state) {
        return TextField(
          key: const Key('otherForm_otherExplanation_textField'),
          minLines: 2,
          maxLines: 4,
          textInputAction: TextInputAction.done,
          onChanged: (explain) => context.read<AddOtherCubit>().explanationChanged(explain),
          decoration: InputDecoration(
            labelStyle: context.textThemeX.medium,
            alignLabelWithHint: true,
            hintText: 'شرح النص',
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

class _PrioritySliderWithLabelBlocBuilder extends StatelessWidget {
  const _PrioritySliderWithLabelBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOtherCubit, AddOtherState>(
      builder: (context, state) {
        return PrioritySliderWithLabel(
          labelText: context.l10n.priority,
          priorityTitle: '${state.sliderValue.getPriorityName(context)} ${context.l10n.saveIt}',
          onPriorityChanged: (value) => context.read<AddOtherCubit>().sliderPriorityChanged(value),
          priorityValue: state.sliderValue,
          sliderMaxValue: Priority.values.length - 1,
          sliderDivisions: Priority.values.length - 1,
          sliderLabel: state.sliderValue.getPriorityName(context),
        );
      },
    );
  }
}

class _AddOtherButton extends StatelessWidget {
  const _AddOtherButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOtherCubit, AddOtherState>(
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
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Button.filled(
            key: const Key('otherForm_saveOtherForm_button'),
            maxWidth: true,
            density: ButtonDensity.comfortable,
            isLoading: state.status.isLoading,
            label: context.l10n.add,
            onPressed: state.isValid ? () => context.read<AddOtherCubit>().saveOtherForm() : null,
          ),
        );
      },
    );
  }
}
