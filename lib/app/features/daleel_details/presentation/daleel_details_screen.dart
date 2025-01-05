// ignore_for_file: deprecated_member_use

import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class DaleelDetailsScreen extends StatelessWidget {
  const DaleelDetailsScreen({super.key});

  static const name = 'daleel-details';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(iconSize: WidgetStatePropertyAll(24.r)),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.edit, size: 22.r)),
        ],
        centerTitle: true,
        title: Text(
          'تفاصيل الأثر',
          style: context.textThemeX.heading.bold,
        ),
      ),
      body: Align(
        alignment:
            context.settingsBloc.state.settings.isArabic ? Alignment.topRight : Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.h,
            children: [
              Gap(10.h),
              _DaleelDetailsWidget(label: 'نوع الأثر', labelValue: context.l10n.propheticHadith),
              const _DaleelDetailsWidget(
                label: 'مضمون الأثر',
                labelValue:
                    'من كانتِ الآخرةُ هَمَّهُ جعلَ اللَّهُ غناهُ في قلبِهِ وجمعَ لَه شملَهُ وأتتهُ الدُّنيا وَهيَ راغمة، ومن كانتِ الدُّنيا همَّهُ جعلَ اللَّهُ فقرَهُ بينَ عينيهِ وفرَّقَ عليهِ شملَهُ، ولم يأتِهِ منَ الدُّنيا إلَّا ما قُدِّرَ لَهُ',
              ),
              const _DaleelDetailsWidget(label: 'قائل الأثر', labelValue: 'الرّسول ﷺ'),
              Text(
                'الكلمات المرجعية للأثر',
                style: context.textThemeX.large.bold.copyWith(
                  color: context.colorsX.onBackgroundTint35,
                ),
              ),
              Wrap(
                spacing: 3.w,
                runSpacing: 10.h,
                children: List.generate(
                  9,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: Container(
                      height: 30.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: context.colorsX.primary,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Center(
                        child: Text(
                          'كلمة ${index + 1}',
                          style: context.textThemeX.medium.bold.copyWith(
                            color: context.colorsX.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const _DaleelDetailsWidget(label: 'أهمية الأثر', labelValue: 'يجب حفظه'),
              const _DaleelDetailsWidget(
                label: 'شرح الأثر',
                labelValue:
                    'الحديث الشريف يبين أن من يركز على الآخرة ويجعلها هدفه الرئيسي في الحياة، يمنحه الله القناعة والطمأنينة في قلبه، ويسهل له أموره، وتأتيه الدنيا بيسر وبركة دون عناء كبير. أما من يجعل الدنيا شغله الشاغل ويغفل عن الآخرة، فإنه يعيش في قلق دائم وشعور بالفقر والاحتياج، حتى لو امتلك الكثير، وتكون حياته مليئة بالمشكلات والتشتت، ولن يحصل من الدنيا إلا على ما قسمه الله له.',
              ),
              const _DaleelDetailsWidget(
                  label: 'وقت الإضافة الأثر', labelValue: '٠٣:٤٥ صباحًا\n١ يناير ٢٠٢٥'),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaleelDetailsWidget extends StatelessWidget {
  const _DaleelDetailsWidget({
    required this.label,
    required this.labelValue,
  });

  final String label;
  final String labelValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textThemeX.large.bold.copyWith(
            color: context.colorsX.onBackgroundTint35,
          ),
        ),
        Gap(10.h),
        Padding(
          padding: EdgeInsets.only(
            right: context.settingsBloc.state.settings.isArabic ? 6.w : 0,
            left: context.settingsBloc.state.settings.isEnglish ? 6.w : 0,
          ),
          child: Text(
            labelValue,
            style: context.textThemeX.medium.bold.copyWith(color: context.colorsX.primary),
          ),
        ),
      ],
    );
  }
}
