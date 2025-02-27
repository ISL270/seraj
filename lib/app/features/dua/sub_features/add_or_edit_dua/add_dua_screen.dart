import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/dua/sub_features/add_or_edit_dua/cubit/add_or_edit_dua_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/tag_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddOrEditDuaScreen extends StatelessWidget {
  const AddOrEditDuaScreen({super.key});

  static const name = 'add-or-edit-dua-screen';

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
          context.read<AddOrEditDuaCubit>().state.duaId != null
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
                spacing: 22.h,
                children: [
                  Gap(2.h),
                  const _TextOfDuaTextField(),
                  const _DuaRewardTextField(),
                  const _ExplanationOfDuaTextField(),
                  BlocBuilder<AddOrEditDuaCubit, AddOrEditDuaState>(
                    builder: (context, state) {
                      final cubit = context.read<AddOrEditDuaCubit>();
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
      onChanged: (duaText) => context.read<AddOrEditDuaCubit>().duaChanged(duaText),
      maxLines: 4,
      minLines: 2,
      controller: context.read<AddOrEditDuaCubit>().textOfDua,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: context.l10n.dua,
        labelStyle: context.textThemeX.medium,
      ),
    );
  }
}

class _DuaRewardTextField extends StatelessWidget {
  const _DuaRewardTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (reward) => context.read<AddOrEditDuaCubit>().rewardOfDuaChanged(reward),
      maxLines: 4,
      minLines: 1,
      controller: context.read<AddOrEditDuaCubit>().duaReward,
      decoration: InputDecoration(
        labelText: context.l10n.reward,
        labelStyle: context.textThemeX.medium,
        hintMaxLines: 1,
      ),
    );
  }
}

class _ExplanationOfDuaTextField extends StatelessWidget {
  const _ExplanationOfDuaTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (explain) => context.read<AddOrEditDuaCubit>().duaExplanationChanged(explain),
      maxLines: 4,
      minLines: 4,
      controller: context.read<AddOrEditDuaCubit>().explanationOfDua,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: context.l10n.explanation,
        labelStyle: context.textThemeX.medium,
      ),
    );
  }
}

class _DuaAddButton extends StatelessWidget {
  const _DuaAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditDuaCubit, AddOrEditDuaState>(
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
                    context.read<AddOrEditDuaCubit>().saveDuaForm();
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
