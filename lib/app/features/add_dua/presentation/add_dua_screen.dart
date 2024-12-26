import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

part 'widgets/dua_type_drop_down_button.dart';
part 'widgets/dua_time_drop_down_button.dart';

class AddDuaScreen extends StatelessWidget {
  const AddDuaScreen({super.key});

  static const name = 'addDua';

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
          context.l10n.addDua,
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
                spacing: 12.h,
                children: [
                  _LabelTextFieldAlignWidget(label: context.l10n.duaText),
                  const _TextOfDuaTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.duaType),
                  const _DuaTypeDropDownButton(),
                  _LabelTextFieldAlignWidget(label: context.l10n.numOfTimesANDtime),
                  Row(
                    children: [
                      const Expanded(child: _DuaNumOfRepeatTextField()),
                      Gap(15.w),
                      const Expanded(flex: 2, child: _DuaTimeDropDownButton()),
                    ],
                  ),
                  _LabelTextFieldAlignWidget(label: context.l10n.additionalNotes),
                  const _AddNotesTextField(),
                ],
              ),
            ),
          ),
          const _DuaAddButton(),
          Gap(5.h),
        ],
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
      onChanged: (v) {},
      maxLines: 4,
      minLines: 1,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        hintMaxLines: 1,
        hintText: 'ربنا ما خلقت هذا باطلاً سُبحانك فقنا عذاب النار.',
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

class _AddNotesTextField extends StatelessWidget {
  const _AddNotesTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('DuaaForm_NotesOfDua_textField'),
      onChanged: (v) {},
      maxLines: 2,
      minLines: 1,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        hintMaxLines: 1,
        hintText: context.l10n.addNotes,
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.w),
      child: Button.filled(
        label: context.l10n.add,
        key: const Key('DuaForm_saveDuaForm_button'),
        maxWidth: true,
        density: ButtonDensity.comfortable,
        onPressed: () {},
      ),
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
