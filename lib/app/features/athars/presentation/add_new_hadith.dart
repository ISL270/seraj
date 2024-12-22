import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddNewHadith extends StatelessWidget {
  const AddNewHadith({super.key});

  static const String name = 'addNewHadith';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Padding(
                      padding: EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => context.pop(),
                                child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
                              ),
                              const Spacer(),
                              Text(
                                '${context.l10n.add} ${context.l10n.prophetichadith}',
                                style: context.textThemeX.heading.bold,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                          const Gap(50),
                          TextField(
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintMaxLines: 2,
                              labelStyle: context.textThemeX.medium,
                              alignLabelWithHint: true,
                              label: Text('${context.l10n.title} ${context.l10n.prophetichadithc}'),
                            ),
                          ),
                          const Gap(20),
                          TextField(
                            maxLines: 5,
                            minLines: 3,
                            decoration: InputDecoration(
                              labelStyle: context.textThemeX.medium,
                              alignLabelWithHint: true,
                              label: Text(context.l10n.hadithdesc),
                            ),
                          ),
                          const Gap(15),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('نوع الحديث', style: context.textThemeX.medium.bold),
                          ),
                          const Gap(5),
                        ],
                      ),
                    ),
                    const _HadithSelectionListViewBuilder(),
                    const Gap(10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Button.filled(
                label: context.l10n.add,
                maxWidth: true,
                onPressed: () {},
              ),
            ),
            const Gap(5)
          ],
        ),
      ),
    );
  }
}

class _HadithSelectionListViewBuilder extends StatefulWidget {
  const _HadithSelectionListViewBuilder();

  @override
  State<_HadithSelectionListViewBuilder> createState() => _HadithSelectionListViewBuilderState();
}

class _HadithSelectionListViewBuilderState extends State<_HadithSelectionListViewBuilder> {
  List<String> hadithTypes = [
    'حديث صحيح',
    'حديث حسن',
    'حديث ضعيف',
    'اخرى',
  ];

  List<String> hadithTypeDef = [
    'ما اتصل سنده بنقل العدل الضابط عن مثله إلى منتهاه مع السلامة من الشذوذ والعلة',
    'الحديث المتوسط بين الحديث الصحيح والحديث الضعيف، ويشمل الحديث الحسن لذاته وهو الذي توفرت فيه كل شروط الحديث الصحيح إلا شرطا واحدا وهو ضبط الرواة',
    'يُشير لكل حديث فقد شرطا من شروط الحديث المقبول، أي لم تجتمع فيه صفات الحديث الصحيح ولا صفات الحديث الحسن',
    'الحديث المعلق، الحديث المنقطع، الحديث المعضل، الحديث المُرسَل، حديث مرسل الصحابي، الحديث المدلس، الحديث الموضوع، الحديث المتروك، الحديث المنكر، الحديث المطروح، الحديث المضعف، الحديث المجهول، الحديث المدرج، الحديث المقلوب، الحديث المُضطرِب، الحديث المصحف والمحرف، الحديث الشاذ، الحديث المعلل، الحديث المرفوع، الحديث الموقوف، الحديث المقطوع، الحديث المتواتر، خبر الآحاد، الحديث المُسنَد، الحديث المتصل، الحديث المسلسل، الاعتبار، حديث الفرد، الحديث المعنعن، الحديث المؤنن، الحديث المنقلب، الحديث العالي، الحديث النازل، الحديث الغريب، الحديث المبهم، الحديث المدبج.',
  ];

  late int select = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.settingsBloc.state.language.isArabic ? 16.w : 0,
        left: context.settingsBloc.state.language.isEnglish ? 16.w : 0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 85.h,
            child: ListView.separated(
              itemCount: hadithTypes.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      select = index;
                    });
                  },
                  child: _AddNewHadithItemWidget(
                    label: hadithTypes[index],
                    selected: index == select,
                  ),
                );
              },
            ),
          ),
          const Gap(15),
          Padding(
            padding: EdgeInsets.only(right: 8.w, left: 16.w),
            child: Container(
              width: double.infinity,
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                    color: context.colorsX.onBackgroundTint35,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                hadithTypeDef[select],
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: context.textThemeX.medium.bold,
              ),
            ),
          ),
          const Gap(20),
          Visibility(
            visible: select == 3,
            child: Padding(
              padding: EdgeInsets.only(right: 8.w, left: 16.w),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: context.textThemeX.medium,
                  alignLabelWithHint: true,
                  label: Text('نوع الحديث', style: context.textThemeX.medium.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddNewHadithItemWidget extends StatelessWidget {
  const _AddNewHadithItemWidget({
    required this.label,
    required this.selected,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.w),
      child: AnimatedContainer(
        height: 60.h,
        width: 120.w,
        duration: const Duration(milliseconds: 600),
        curve: Curves.decelerate,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: context.colorsX.onBackgroundTint35,
          boxShadow: selected
              ? [
                  BoxShadow(
                    blurRadius: 5.w,
                    spreadRadius: 0.2.w,
                    blurStyle: BlurStyle.outer,
                    color: context.colorsX.primary,
                  ),
                  BoxShadow(
                    blurRadius: 5.w,
                    spreadRadius: 0.2.w,
                    blurStyle: BlurStyle.outer,
                    color: context.colorsX.primary,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(label, style: context.textThemeX.medium.bold),
        ),
      ),
    );
  }
}
