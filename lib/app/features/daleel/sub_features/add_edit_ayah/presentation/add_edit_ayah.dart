import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_ayah/presentation/cubit/add_edit_aya_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/number_picker_bs.dart';
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

part 'ayah_search.dart';
part 'ayah_selection_widget.dart';

class AddEditAyah extends StatefulWidget {
  const AddEditAyah({super.key});

  static const name = 'add-new-aya';

  @override
  State<AddEditAyah> createState() => _AddEditAyahState();
}

class _AddEditAyahState extends State<AddEditAyah> {
  @override
  void initState() {
    super.initState();
    FlutterQuran().init();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    spacing: 20.h,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: Icon(Icons.keyboard_arrow_right_outlined,
                                size: 32.w),
                          ),
                          const Spacer(flex: 2),
                          Text(
                            context
                                    .read<AddEditAyahCubit>()
                                    .state
                                    .selectedAyahs
                                    .isEmpty
                                ? '${context.l10n.edit} ${context.l10n.ayah.capitalizedDefinite}'
                                : context.l10n.addAyahs,
                            style: context.textThemeX.heading.bold,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(flex: 3),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 80.h),
                            child:
                                BlocBuilder<AddEditAyahCubit, AddEditAyahState>(
                              builder: (context, state) {
                                final cubit = context.read<AddEditAyahCubit>();
                                return state.selectedAyahs.isNotEmpty ||
                                        state.ayaId != null
                                    ? Column(
                                        spacing: 10.h,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              context.l10n.surahandnoayah,
                                              style: context
                                                  .textThemeX.medium.bold,
                                            ),
                                          ),
                                          _SurahAndVerseNumTextField(
                                            surahController:
                                                cubit.surahController,
                                            firstAyahController:
                                                cubit.firstAyahController,
                                            lastAyahController:
                                                cubit.lastAyahController,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              context.l10n.ayahs,
                                              style: context
                                                  .textThemeX.medium.bold,
                                            ),
                                          ),
                                          _QuranicVerseTextField(
                                            controller:
                                                cubit.quranicVerseController,
                                          ),
                                          Gap(5.h),
                                          _QuranicVerseExplanationTextField(
                                            controller:
                                                cubit.explanationController,
                                          ),
                                          Gap(5.h),
                                          TagSelectionWidget(
                                            tags: state.tags,
                                            availableTags: cubit.getTags(),
                                            onAddTag: (tag) {
                                              final updatedTags = {
                                                ...state.tags
                                              }; // Create a new modifiable set
                                              if (updatedTags.add(tag)) {
                                                // Modify the copy, not the original
                                                cubit.tagsChanged(updatedTags);
                                              }
                                            },
                                            onRemoveTag: (tag) =>
                                                cubit.tagsChanged({
                                              ...state.tags
                                            }..remove(tag)),
                                            onClearTags: () =>
                                                cubit.tagsChanged({}),
                                          )
                                        ],
                                      )
                                    : const SizedBox();
                              },
                            ),
                          ),
                          const _AyaSearch(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const _AyahAddButton(),
          Gap(5.h)
        ],
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
            readOnly: true,
            controller: surahController,
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
            readOnly: true,
            controller: firstAyahController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            '${context.l10n.to} :',
            style: context.textThemeX.medium,
          ),
        ),
        const _AyahSelectionWidget()
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
      readOnly: true,
      style: context.textThemeX.medium.copyWith(
        fontFamily: GoogleFonts.amiriQuran().fontFamily,
      ),
      controller: controller,
      maxLines: 5,
      minLines: 1,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: context.l10n.quranicversec,
        labelStyle: context.textThemeX.medium.bold,
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
          context.read<AddEditAyahCubit>().ayaExplainChanged(value),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: context.l10n.quranicayahexp,
        labelStyle: context.textThemeX.medium,
      ),
    );
  }
}

class _AyahAddButton extends StatelessWidget {
  const _AyahAddButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEditAyahCubit, AddEditAyahState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (innerContext, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                state.selectedAyahs.isEmpty
                    ? context.l10n.ayahUpdatedSuccessf
                    : context.l10n.ayahAdded,
                style: context.textThemeX.medium.bold,
              ),
            ),
          );
          innerContext.pop();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Button.filled(
            maxWidth: true,
            isLoading: state.status.isLoading,
            density: ButtonDensity.comfortable,
            label: state.ayaId == null ? context.l10n.add : context.l10n.update,
            onPressed: state.isValid
                ? () => context.read<AddEditAyahCubit>().saveAyaForm()
                : null,
          ),
        );
      },
    );
  }
}
