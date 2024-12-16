import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void showAlertDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: context.colorsX.secondaryBackground,
        backgroundColor: context.colorsX.secondaryBackground,
        // title: const Text('Alert Dialog'),
        content: SizedBox(
          height: 0.32.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🗃️',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                context.l10n.archiveClient,
                style: context.textThemeX.large.bold,
              ),
              Text(
                context.l10n.archiveClientConfirmation,
                style: context.textThemeX.small,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Button.filled(
                label: context.l10n.ok,
                onPressed: () {
                  context.pop();
                },
              ),
              TextButton(onPressed: () {}, child: Text(context.l10n.cancel))
            ],
          ),
        ),
      );
    },
  );
}
