import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_aya/presentation/bloc/add_aya_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddNewAyah extends StatelessWidget {
  const AddNewAyah({super.key});

  static const String name = 'addNewAyah';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddAyaCubit>(),
      child: Screen(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => context.pop(),
                                child: Icon(Icons.keyboard_arrow_right_outlined,
                                    size: 32.w),
                              ),
                              const Spacer(),
                              Text(
                                '${context.l10n.add} ${context.l10n.quranicverse}',
                                style: context.textThemeX.heading.bold,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                          Gap(50.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.surahandnoayah,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          Gap(20.h),
                          const _SurahAndVerseNumTextField(),
                          Gap(20.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.quranicversec,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          Gap(20.h),
                          const _QuranicVerseTextField(),
                          Gap(20.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.quranicayahexp,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          Gap(20.h),
                          const _QuranicVerseExplanationTextField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _AyahAddButton(),
            const Gap(5)
          ],
        ),
      ),
    );
  }
}

class _SurahAndVerseNumTextField extends StatelessWidget {
  const _SurahAndVerseNumTextField();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: _SurahTextField(),
        ),
        Gap(20),
        Expanded(
          child: _NoAyahOfSurah(),
        ),
      ],
    );
  }
}

class _SurahTextField extends StatelessWidget {
  const _SurahTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      onChanged: (value) =>
          context.read<AddAyaCubit>().surahOfAyaChanged(value),
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.quranicayahsurah,
            style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _NoAyahOfSurah extends StatelessWidget {
  const _NoAyahOfSurah();

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) => context.read<AddAyaCubit>().nomOfAyaChanged(value),
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label:
            Text(context.l10n.numofayah, style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _QuranicVerseTextField extends StatelessWidget {
  const _QuranicVerseTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 3,
      onChanged: (value) => context.read<AddAyaCubit>().textOfAyaChanged(value),
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.quranicversec,
            style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _QuranicVerseExplanationTextField extends StatelessWidget {
  const _QuranicVerseExplanationTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 4,
      onChanged: (value) =>
          context.read<AddAyaCubit>().ayaExplainChanged(value),
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.quranicayahexp,
            style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _AyahAddButton extends StatelessWidget {
  const _AyahAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAyaCubit, AddAyaState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Button.filled(
            label: context.l10n.add,
            maxWidth: true,
            onPressed: state.isValid
                ? () => context.read<AddAyaCubit>().saveAyaForm()
                : null,
          ),
        );
      },
    );
  }
}
