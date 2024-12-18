import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerBS extends StatefulWidget {
  const NumberPickerBS._({required this.isDecimal, required this.initial});
  final bool isDecimal;
  final double initial;

  static Future<double?> show(BuildContext context, {bool isDecimal = false, double initial = 0}) =>
      showModalBottomSheet<double>(
        context: context,
        builder: (context) => NumberPickerBS._(isDecimal: isDecimal, initial: initial),
      );

  @override
  State<NumberPickerBS> createState() => _NumberPickerBSState();
}

class _NumberPickerBSState extends State<NumberPickerBS> {
  late double _currentValue;

  @override
  void initState() {
    _currentValue = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: context.colorsX.secondaryBackground,
      onClosing: () {},
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20) + const EdgeInsets.only(bottom: 20),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: widget.isDecimal
                  ? DecimalNumberPicker(
                      value: _currentValue,
                      minValue: 0,
                      maxValue: 100,
                      haptics: true,
                      onChanged: (value) => setState(() => _currentValue = value),
                    )
                  : NumberPicker(
                      value: _currentValue.toInt(),
                      minValue: 0,
                      maxValue: 100,
                      haptics: true,
                      onChanged: (value) => setState(() => _currentValue = value.toDouble()),
                    ),
            ),
            TextButton(
              onPressed: () => context.pop(_currentValue),
              child: Text(
                '',
                style: context.textThemeX.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
