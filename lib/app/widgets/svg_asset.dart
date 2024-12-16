import 'package:athar/app/core/extension_methods/color_x.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAsset extends StatelessWidget {
  final String path;
  final double? size;
  final Color? color;

  const SvgAsset(
    this.path, {
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: (color ?? context.colorsX.onBackground).srcInFilter,
    );
  }
}
