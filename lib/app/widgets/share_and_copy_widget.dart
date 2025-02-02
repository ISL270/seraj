import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class ShareAndCopyWidget extends StatelessWidget {
  const ShareAndCopyWidget({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: context.colorsX.primary.withValues(alpha: 0.5),
            ),
            onPressed: () => Share.share(text),
            icon: Icon(Icons.share, color: context.colorsX.onBackground),
            label: Text(
              context.l10n.share,
              style: context.textThemeX.medium.copyWith(color: context.colorsX.onBackground),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: context.colorsX.primary.withValues(alpha: 0.5),
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: text));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.copied)),
              );
            },
            icon: Icon(Icons.copy, color: context.colorsX.onBackground),
            label: Text(
              context.l10n.copy,
              style: context.textThemeX.medium.copyWith(color: context.colorsX.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}
