import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsTextWidget extends StatelessWidget {
  const DetailsTextWidget({required this.text, required this.actions, super.key});

  final String text;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorsX.primary.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: context.colorsX.primary.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(25.h),
            if (text.length < 100) Gap(50.h),
            const Spacer(flex: 4),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Text(
                text,
                style: context.textThemeX.heading.copyWith(
                  fontSize: 24.sp,
                  fontFamily: GoogleFonts.amiri().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (text.length < 100) Gap(50.h),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
            const Spacer(),
            Gap(25.h),
          ],
        ),
      ),
    );
  }
}
