import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20.r,
        child: Icon(icon, color: context.colorsX.background, size: 18.r),
      ),
    );
  }
}
