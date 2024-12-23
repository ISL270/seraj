import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/domain/models/hadith_type.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddHadith extends StatelessWidget {
  const AddHadith({super.key});

  static const String name = 'addHadith';

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        const Gap(10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
                            ),
                            const Spacer(),
                            Text(
                              '${context.l10n.add} ${context.l10n.propheticHadith}',
                              style: context.textThemeX.heading.bold,
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                        const Gap(50),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.l10n.textOfHadith,
                            style: context.textThemeX.medium.bold,
                          ),
                        ),
                        const Gap(15),
                        const _TextOfHadithTextField(),
                        const Gap(15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.l10n.isnadOfHadith,
                            style: context.textThemeX.medium.bold,
                          ),
                        ),
                        const Gap(15),
                        const _IsnadOfHadithTextField(),
                        const Gap(15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.l10n.sourceOfHadith,
                            style: context.textThemeX.medium.bold,
                          ),
                        ),
                        const Gap(15),
                        const _SourceOfHadithTextField(),
                        const Gap(15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.l10n.hadithType,
                            style: context.textThemeX.medium.bold,
                          ),
                        ),
                        const Gap(10),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                      child: SegmentedButton(
                        style: SegmentedButton.styleFrom(textStyle: context.textThemeX.medium.bold),
                        onSelectionChanged: (v) {},
                        expandedInsets: EdgeInsets.all(1.h),
                        showSelectedIcon: false,
                        segments: [
                          ButtonSegment(
                            label: Text(context.l10n.hadithSahih),
                            value: HadithType.sahih,
                          ),
                          ButtonSegment(
                            label: Text(context.l10n.hadithDaif),
                            value: HadithType.daif,
                          ),
                        ],
                        selected: const {HadithType.sahih},
                      ),
                    ),
                    const Gap(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        context.l10n.hadithExplain,
                        style: context.textThemeX.medium.bold,
                      ),
                    ),
                    const Gap(10),
                    const _HadithExplanationTextField(),
                    const Gap(20),
                  ],
                ),
              ),
            ),
            const _HadithAddButton(),
            const Gap(5)
          ],
        ),
      ),
    );
  }
}

class _TextOfHadithTextField extends StatelessWidget {
  const _TextOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,
      minLines: 4,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText:
            'أنا عِنْدَ ظَنِّ عَبْدِي بي، وأنا معهُ إذا ذَكَرَنِي، فإنْ ذَكَرَنِي في نَفْسِهِ ذَكَرْتُهُ في نَفْسِي، وإنْ ذَكَرَنِي في مَلَإٍ ذَكَرْتُهُ في مَلَإٍ خَيْرٍ منهمْ، وإنْ تَقَرَّبَ إلَيَّ بشِبْرٍ تَقَرَّبْتُ إلَيْهِ ذِراعًا، وإنْ تَقَرَّبَ إلَيَّ ذِراعًا تَقَرَّبْتُ إلَيْهِ باعًا، وإنْ أتانِي يَمْشِي أتَيْتُهُ هَرْوَلَةً',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _IsnadOfHadithTextField extends StatelessWidget {
  const _IsnadOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText: 'رواه البخاري ومسلم',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _SourceOfHadithTextField extends StatelessWidget {
  const _SourceOfHadithTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText: 'حديث صحيح عن النبي ﷺ',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _HadithExplanationTextField extends StatelessWidget {
  const _HadithExplanationTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,
      minLines: 4,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        hintText:
            'إن ظَنَّ باللهِ خَيرًا فَلَه، وإن ظَنَّ بِه سِوَى ذلك فَلَه، وحُسنُ الظَّنِّ باللهِ عزَّ وجلَّ يَكونُ بفِعلِ ما يُوجِبُ فَضلَ اللهِ وَرَجاءَه، فيَعمَلُ الصَّالِحاتِ، ويُحسِنُ الظَّنَّ بأنَّ اللهَ تَعالَى يَقبَلُه، فاللهُ سُبحانَه عِندَ مُنتهَى أمَلِ العَبدِ به،',
        hintStyle: context.textThemeX.medium.bold.copyWith(
          height: 1.5.h,
          overflow: TextOverflow.ellipsis,
          color: context.colorsX.onBackgroundTint35,
        ),
      ),
    );
  }
}

class _HadithAddButton extends StatelessWidget {
  const _HadithAddButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.w),
      child: Button.filled(
        label: context.l10n.add,
        maxWidth: true,
        onPressed: () {},
      ),
    );
  }
}
