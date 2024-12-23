import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

part 'widgets/hadith_list_view_builder.dart';

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
                            '${context.l10n.title} ${context.l10n.propheticHadithC}',
                            style: context.textThemeX.medium.bold,
                          ),
                        ),
                        const Gap(15),
                        const _HadithTitleTextField(),
                        const Gap(20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.l10n.hadithDesc,
                            style: context.textThemeX.medium.bold,
                          ),
                        ),
                        const Gap(15),
                        const _HadithDescTextField(),
                        const Gap(15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.l10n.hadithType,
                            style: context.textThemeX.medium.bold,
                          ),
                        ),
                        const Gap(5),
                      ],
                    ),
                    const _HadithSelectionListViewBuilder(),
                    const Gap(10),
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

class _HadithTitleTextField extends StatelessWidget {
  const _HadithTitleTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      minLines: 1,
      decoration: InputDecoration(
        hintMaxLines: 2,
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text('${context.l10n.title} ${context.l10n.propheticHadithC}'),
      ),
    );
  }
}

class _HadithDescTextField extends StatelessWidget {
  const _HadithDescTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 3,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.hadithDesc),
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
