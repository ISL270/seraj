import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/aya/presentation/bloc/add_aya_cubit.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quran/flutter_quran.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddNewAyah extends StatelessWidget {
  final List<Ayah> ayah;

  const AddNewAyah({required this.ayah, super.key});

  static const String name = 'add-new-aya';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAyaCubit(
        ayaRepository: getIt.get<DaleelRepository>(),
        ayah: ayah,
      ),
      child: Screen(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
                      child: Column(
                        spacing: 20.h,
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
                          Gap(30.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.surahandnoayah,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          _SurahAndVerseNumTextField(
                            surahController: TextEditingController(
                                text: ayah[0].surahNameAr),
                            noAyahController: TextEditingController(
                                text: ayah
                                    .map((singleAyah) => singleAyah.ayahNumber)
                                    .join(',')),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.quranicversec,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          _QuranicVerseTextField(
                            controller: TextEditingController(
                              text: ayah
                                  .map((singleAyah) => singleAyah.ayah)
                                  .join(' '), // Combine ayahs
                            ),
                          ),
                          Gap(20.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.quranicayahexp,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          _QuranicVerseExplanationTextField(
                            controller: TextEditingController(text: ''),
                          ),
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
  final TextEditingController surahController;
  final TextEditingController noAyahController;

  const _SurahAndVerseNumTextField({
    required this.surahController,
    required this.noAyahController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            controller: surahController,
            minLines: 1,
            onChanged: (value) =>
                context.read<AddAyaCubit>().surahOfAyaChanged(value),
            decoration: InputDecoration(
              labelStyle: context.textThemeX.medium,
              alignLabelWithHint: true,
              label: Text(context.l10n.quranicayahsurah,
                  style: context.textThemeX.medium.bold),
            ),
          ),
        ),
        Gap(20.w),
        Expanded(
          child: TextField(
            controller: noAyahController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) =>
                context.read<AddAyaCubit>().nomOfAyaChanged(value),
            decoration: InputDecoration(
              labelStyle: context.textThemeX.medium,
              alignLabelWithHint: true,
              label: Text(context.l10n.numofayah,
                  style: context.textThemeX.medium.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuranicVerseTextField extends StatelessWidget {
  final TextEditingController controller;

  const _QuranicVerseTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: TextField(
        controller: controller,
        maxLines: 5,
        minLines: 3,
        onChanged: (value) =>
            context.read<AddAyaCubit>().textOfAyaChanged(value),
        decoration: InputDecoration(
          labelStyle: context.textThemeX.medium,
          alignLabelWithHint: true,
          label: Text(context.l10n.quranicversec,
              style: context.textThemeX.medium.bold),
        ),
      ),
    );
  }
}

class _QuranicVerseExplanationTextField extends StatelessWidget {
  final TextEditingController controller;

  const _QuranicVerseExplanationTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
    return BlocConsumer<AddAyaCubit, AddAyaState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (innerContext, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                context.l10n.ayahAdded,
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
          padding: EdgeInsets.symmetric(vertical: 12.w),
          child: Button.filled(
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            label: context.l10n.add,
            onPressed: state.isValid
                ? () => context.read<AddAyaCubit>().saveAyaForm()
                : null,
          ),
        );
      },
    );
  }
}
