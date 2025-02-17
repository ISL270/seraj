import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/dua/sub_features/add_dua/cubit/add_dua_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/tag_selection.dart';
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
    return Screen(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
        ),
        title: Text(
          context.read<AddDuaCubit>().state.duaId != null
              ? '${context.l10n.edit} ${context.l10n.dua}'
              : context.l10n.addDua,
          style: context.textThemeX.heading.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 14.h,
                children: [
                  _LabelTextFieldAlignWidget(label: context.l10n.dua),
                  const _TextOfDuaTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.reward),
                  const _DuaRewardTextField(),
                  _LabelTextFieldAlignWidget(label: context.l10n.explanation),
                  const _ExplanationOfDuaTextField(),
                  BlocBuilder<AddDuaCubit, AddDuaState>(
                    builder: (context, state) {
                      final cubit = context.read<AddDuaCubit>();
                      return TagSelectionWidget(
                        tags: state.tags,
                        onAddTag: (tag) {
                          final updatedTags = {...state.tags}; // Create a new modifiable set
                          if (updatedTags.add(tag)) {
                            cubit.tagsChanged(updatedTags);
                          }
                        },
                        onRemoveTag: (tag) => cubit.tagsChanged({...state.tags}..remove(tag)),
                        onClearTags: () => cubit.tagsChanged({}),
                        availableTags: cubit.getTags(),
                      );
                    },
                  ),
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
      onChanged: (duaText) => context.read<AddDuaCubit>().duaChanged(duaText),
      maxLines: 4,
      minLines: 2,
      controller: context.read<AddDuaCubit>().textOfDua,
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
      onChanged: (explain) => context.read<AddDuaCubit>().duaExplanationChanged(explain),
      maxLines: 4,
      minLines: 4,
      controller: context.read<AddDuaCubit>().explanationOfDua,
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
      onChanged: (reward) => context.read<AddDuaCubit>().rewardOfDuaChanged(reward),
      maxLines: 4,
      minLines: 1,
      controller: context.read<AddDuaCubit>().duaReward,
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
    return BlocBuilder<AddDuaCubit, AddDuaState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          child: Button.filled(
            key: const Key('duaForm_saveDuaForm_button'),
            maxWidth: true,
            density: ButtonDensity.comfortable,
            label: state.duaId == null ? context.l10n.add : context.l10n.update,
            onPressed: state.isValid
                ? () {
                    context.read<AddDuaCubit>().saveDuaForm();
                    if (context.mounted) {
                      context.pop();
                    }
                  }
                : null,
          ),
        );
      },
    );
  }
}
