import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_dua/presentation/cubit/add_dua_cubit.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/duas/domain/repository/dua_repository.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/priority_slider_widget.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddDuaScreen extends StatelessWidget {
  const AddDuaScreen({super.key});

  static const name = 'add-dua';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDuaCubit(getIt.get<DuaRepository>()),
      child: Screen(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
          ),
          title: Text(
            context.l10n.addDua,
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
                    _LabelTextFieldAlignWidget(label: context.l10n.dua),
                    const _TextOfDuaTextField(),
                    _LabelTextFieldAlignWidget(label: context.l10n.reward),
                    const _DuaRewardTextField(),
                    _LabelTextFieldAlignWidget(label: context.l10n.explanation),
                    const _ExplanationOfDuaTextField(),
                    _LabelTextFieldAlignWidget(
                        label: context.l10n.numOfTimesANDpriority),
                    const _PrioritySlider()
                  ],
                ),
              ),
            ),
            const _DuaAddButton(),
            Gap(5.h),
          ],
        ),
      ),
    );
  }
}

class _PrioritySlider extends StatelessWidget {
  const _PrioritySlider();

  @override
  Widget build(BuildContext context) {
    return PrioritySliderWithLabelWidget<AddDuaCubit, AddDuaState>(
      getLabel: (context) => context.l10n.priority,
      getSliderValue: (state) => state.sliderValue,
      getPriorityName: (context, sliderValue) =>
          sliderValue.getPriorityName(context),
      onSliderChanged: (context, value) =>
          context.read<AddDuaCubit>().sliderPriorityChanged(value),
      max: Priority.values.length - 1,
      divisions: Priority.values.length - 1,
    );
  }
}

class _TextOfDuaTextField extends StatelessWidget {
  const _TextOfDuaTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('DuaaForm_TextOfDua_textField'),
      onChanged: (duaText) => context.read<AddDuaCubit>().duaChanged(duaText),
      maxLines: 4,
      minLines: 2,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        hintMaxLines: 4,
        hintText:
            'اللَّهُمَّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُسْلِمِينَ وَالْمُسْلِمَاتِ، الأَحْيَاءِ مِنْهُمْ وَالأَمْوَاتِ',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _ExplanationOfDuaTextField extends StatelessWidget {
  const _ExplanationOfDuaTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (explain) =>
          context.read<AddDuaCubit>().duaExplanationChanged(explain),
      maxLines: 4,
      minLines: 4,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        hintMaxLines: 4,
        hintText:
            'دعاء جامع لطلب مغفرة الذنوب وسلامة الدين والدنيا من كل سوء، وتحقيق الأمن والنعيم في الدنيا والآخرة.',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _DuaRewardTextField extends StatelessWidget {
  const _DuaRewardTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (reward) =>
          context.read<AddDuaCubit>().rewardOfDuaChanged(reward),
      maxLines: 4,
      minLines: 1,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        hintMaxLines: 1,
        hintText: 'يُكتب له أجر عمل صالح، ويشمله دعاء الملائكة، ',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
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

class _DuaAddButton extends StatelessWidget {
  const _DuaAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddDuaCubit, AddDuaState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (innerContext, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                context.l10n.duaAdded,
                style: context.textThemeX.medium.bold,
              ),
            ),
          );
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
            key: const Key('duaForm_saveDuaForm_button'),
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            label: context.l10n.add,
            onPressed: state.isValid
                ? () => context.read<AddDuaCubit>().saveDuaForm()
                : null,
          ),
        );
      },
    );
  }
}
