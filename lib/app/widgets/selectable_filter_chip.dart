// ignore_for_file: deprecated_member_use

import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/presentation/daleel_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SelectableFilterChip extends StatelessWidget {
  const SelectableFilterChip({
    super.key,
    this.label = 'تصنيف',
    this.isActive = false,
    this.onTap,
    this.cancelFilteronTap,
    this.cancelFilterActive = false,
  });

  final String label;
  final bool isActive;
  final void Function()? onTap;
  final void Function()? cancelFilteronTap;
  final bool cancelFilterActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.w),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 40.h,
        decoration: BoxDecoration(
          color: isActive
              ? context.colorsX.primary.withOpacity(0.15)
              : context.colorsX.onBackgroundTint35.withOpacity(0.10),
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.sp),
          child: Center(
            child: Row(
              spacing: 3.w,
              children: [
                Gap(4.w),
                Text(
                  label,
                  style: context.textThemeX.medium.bold.copyWith(
                    color: isActive ? context.colorsX.primary : context.colorsX.onBackgroundTint,
                  ),
                ),
                Gap(3.w),
                if (cancelFilterActive) CancelFilterButton(onTap: cancelFilteronTap),
                Gap(1.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
