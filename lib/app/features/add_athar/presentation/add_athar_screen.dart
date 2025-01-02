// ignore_for_file: unused_element, avoid_field_initializers_in_const_classes, unnecessary_statements

import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_athar/presentation/cubit/add_athar_cubit.dart';
import 'package:athar/app/features/add_athar/presentation/cubit/add_athar_state.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddAtharScreen extends StatelessWidget {
  const AddAtharScreen({super.key});

  static const String name = 'add-athar';

  @override
  Widget build(BuildContext context) {
    return Screen(
      padding: EdgeInsets.zero,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
        ),
        title: Text(
          '${context.l10n.add} ${context.l10n.athar}',
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
                spacing: 15.h,
                children: [
                  Gap(10.h),
                  _LabelTextFieldAlignWidget(label: context.l10n.atharText),
                  const _TextOfAtharTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.atharSayer),
                  const _SayerOfAtharTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.explaination),
                  const _ExplainationOfAtharTextField(),
                  const _PrioritySliderWithLabelWidget(),
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
  const _TextOfAtharTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddAtharCubit, AddAtharState, Name>(
      selector: (state) => state.athar,
      builder: (context, athar) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            maxLines: 3,
            minLines: 2,
            onChanged: (value) => context.read<AddAtharCubit>().atharChanged(value),
            decoration: InputDecoration(
              labelStyle: context.textThemeX.medium,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
              hintText: 'حدثنا مروان بن معاوية أن عمر فرض للهر مزان',
              hintMaxLines: 1,
              hintStyle: context.textThemeX.medium.bold.copyWith(
                height: 1.5.h,
                color: context.colorsX.onBackgroundTint35,
              ),
              errorText: athar.displayError == null ? null : context.l10n.enterTextOfAthar,
              alignLabelWithHint: false,
            ),
          ),
        );
      },
    );
  }
}

class _SayerOfAtharTextField extends StatelessWidget {
  const _SayerOfAtharTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAtharCubit, AddAtharState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            onChanged: (value) => context.read<AddAtharCubit>().sayerChanged(value),
            decoration: InputDecoration(
              labelStyle: context.textThemeX.medium,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
              hintText: 'أبو عبيد',
              hintStyle: context.textThemeX.medium.bold.copyWith(
                height: 1.5.h,
                color: context.colorsX.onBackgroundTint35,
              ),
              alignLabelWithHint: false,
            ),
          ),
        );
      },
    );
  }
}

class _ExplainationOfAtharTextField extends StatelessWidget {
  const _ExplainationOfAtharTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAtharCubit, AddAtharState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            maxLines: 3,
            minLines: 3,
            onChanged: (value) => context.read<AddAtharCubit>().explainationChanged(value),
            decoration: InputDecoration(
              labelStyle: context.textThemeX.medium,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
              hintText: context.l10n.explainationOfAthar,
              hintStyle: context.textThemeX.medium.bold.copyWith(
                height: 1.5.h,
                color: context.colorsX.onBackgroundTint35,
              ),
              alignLabelWithHint: false,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<AddAtharCubit, AddAtharState>(
        builder: (context, state) {
          return Column(
            spacing: 15.h,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  _LabelTextFieldAlignWidget(label: context.l10n.priority),
                  Gap(8.w),
                  Text(
                    '${state.sliderValue.getPriority(context)} ${context.l10n.saveIt}',
                    style: context.textThemeX.medium.bold.copyWith(
                      color: context.colorsX.primary,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ],
              ),
              Slider.adaptive(
                onChanged: (value) => context.read<AddAtharCubit>().sliderPriorityChanged(value),
                value: state.sliderValue,
                activeColor: context.colorsX.primary,
                inactiveColor: context.colorsX.onBackgroundTint35,
                max: Priority.values.length - 1,
                divisions: Priority.values.length - 1,
                label: state.sliderValue.getPriority(context),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _LabelTextFieldAlignWidget extends StatelessWidget {
  const _LabelTextFieldAlignWidget({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(label, style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _AtharAddButton extends StatelessWidget {
  const _AtharAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAtharCubit, AddAtharState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Button.filled(
            key: const Key('atharForm_saveAtharForm_button'),
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            label: context.l10n.add,
            onPressed: state.isValid ? () => context.read<AddAtharCubit>().saveAtharForm() : null,
          ),
        );
      },
    );
  }
}
