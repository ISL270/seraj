import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_dua/presentation/cubit/add_dua_cubit.dart';
import 'package:athar/app/features/duas/domain/dua_repository.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

part 'widgets/priority_drop_down_button.dart';

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
                    _LabelTextFieldAlignWidget(label: context.l10n.duaText),
                    const _TextOfDuaTextField(),
                    _LabelTextFieldAlignWidget(label: context.l10n.reward),
                    const _DuaRewardTextField(),
                    _LabelTextFieldAlignWidget(label: context.l10n.explanation),
                    const _ExplanationOfDuaTextField(),
                    _LabelTextFieldAlignWidget(
                        label: context.l10n.numOfTimesANDpriority),
                    Row(
                      children: [
                        const Expanded(child: _DuaNumOfRepeatTextField()),
                        Gap(15.w),
                        const Expanded(
                            flex: 2, child: _PriorityDropDownButton()),
                      ],
                    ),
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

class _TextOfDuaTextField extends StatelessWidget {
  const _TextOfDuaTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('DuaaForm_TextOfDua_textField'),
      onChanged: (duaText) =>
          context.read<AddDuaCubit>().textOfDuaChanged(duaText),
      maxLines: 4,
      minLines: 4,
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
      minLines: 2,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        hintMaxLines: 4,
        hintText: 'شرح الدعاء',
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

class _DuaNumOfRepeatTextField extends StatelessWidget {
  const _DuaNumOfRepeatTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (numOfRepeat) =>
          context.read<AddDuaCubit>().numOfRepeatChanged(numOfRepeat),
      key: const Key('DuaaForm_NumOfRepeatDua_textField'),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText: context.l10n.numOfTimes,
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
    return BlocBuilder<AddDuaCubit, AddDuaState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          child: Button.filled(
            label: context.l10n.add,
            key: const Key('DuaForm_saveDuaForm_button'),
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            onPressed: state.isValid
                ? () => context.read<AddDuaCubit>().saveDuaForm()
                : null,
          ),
        );
      },
    );
  }
}

// widgets used in dua time and type drop down button
MenuItemStyleData _menuItemStyleData() {
  return MenuItemStyleData(
    height: 50.h,
    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
  );
}

ScrollbarThemeData _scrollBarTheme() {
  return ScrollbarThemeData(
    radius: Radius.circular(40.sp),
    thickness: WidgetStateProperty.all<double>(6.w),
    thumbVisibility: WidgetStateProperty.all<bool>(true),
  );
}

IconStyleData _iconStyleData(BuildContext context) {
  return IconStyleData(
    icon: const Icon(Icons.arrow_forward_ios_outlined),
    iconSize: 14.w,
    iconEnabledColor: context.colorsX.onBackground,
  );
}

ButtonStyleData _buttonStyleData(BuildContext context) {
  return ButtonStyleData(
    height: 56.h,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 14.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: context.colorsX.onBackgroundTint),
      color: context.colorsX.background,
    ),
    elevation: 0,
  );
}
