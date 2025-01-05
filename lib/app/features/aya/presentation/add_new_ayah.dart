import 'package:athar/app/core/extension_methods/context_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/aya/presentation/cubit/add_aya_cubit.dart';
import 'package:athar/app/features/daleel/domain/repositories/daleel_repository.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:athar/app/widgets/tag_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quran/flutter_quran.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
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
                            firstAyahController: TextEditingController(
                                text: ayah.first.ayahNumber.toString()),
                            lastAyahController: TextEditingController(
                                text: ayah.last.ayahNumber.toString()),
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
                                  .join(' ')
                                  .decorateArabicNumbers(),
                            ),
                          ),
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.tag,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          BlocBuilder<AddAyaCubit, AddAyaState>(
                            builder: (context, state) {
                              final cubit = context.read<AddAyaCubit>();
                              return TagSelectionWidget(
                                tags: state.tags,
                                onAddTag: (tag) =>
                                    cubit.tagsChanged([...state.tags, tag]),
                                onRemoveTag: (tag) {
                                  final updatedTags = state.tags
                                      .where((t) => t != tag)
                                      .toList();
                                  cubit.tagsChanged(updatedTags);
                                },
                                onClearTags: () => cubit.tagsChanged([]),
                                errorMessageBuilder: (tag) =>
                                    '$tag ${context.l10n.alreadyExists}',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _AyahAddButton(),
            Gap(5.h)
          ],
        ),
      ),
    );
  }
}

class _SurahAndVerseNumTextField extends StatelessWidget {
  final TextEditingController surahController;
  final TextEditingController firstAyahController;
  final TextEditingController lastAyahController;

  const _SurahAndVerseNumTextField({
    required this.surahController,
    required this.firstAyahController,
    required this.lastAyahController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            controller: surahController,
            minLines: 1,
            onChanged: (value) =>
                context.read<AddAyaCubit>().surahOfAyaChanged(value),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: context.l10n.quranicayahsurah,
              hintStyle: context.textThemeX.medium.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            '${context.l10n.from} :',
            style: context.textThemeX.medium,
          ),
        ),
        Expanded(
          child: TextField(
            controller: firstAyahController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) =>
                context.read<AddAyaCubit>().nomOfAyaChanged(value),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: context.l10n.numofayah,
              hintStyle: context.textThemeX.medium.bold,
            ),
          ),
        ),
        // Gap(6.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            '${context.l10n.to} :',
            style: context.textThemeX.medium,
          ),
        ),
        Expanded(
          child: TextField(
            controller: lastAyahController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) =>
                context.read<AddAyaCubit>().nomOfAyaChanged(value),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: context.l10n.numofayah,
              hintStyle: context.textThemeX.medium.bold,
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
    return TextField(
      style: context.textThemeX.medium.copyWith(
        fontFamily: GoogleFonts.amiriQuran().fontFamily,
      ),
      controller: controller,
      maxLines: 5,
      minLines: 3,
      onChanged: (value) => context.read<AddAyaCubit>().textOfAyaChanged(value),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: context.l10n.quranicversec,
        hintStyle: context.textThemeX.medium.bold,
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
        alignLabelWithHint: true,
        hintText: context.l10n.quranicayahexp,
        hintStyle: context.textThemeX.medium,
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
          padding: EdgeInsets.symmetric(vertical: 12.h),
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
