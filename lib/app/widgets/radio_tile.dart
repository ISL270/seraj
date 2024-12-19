import 'package:flutter/material.dart';

class RadioTile<T> extends StatelessWidget {
  const RadioTile({required this.value, required this.groupValue, required this.title, this.nullable = false, this.onChanged, super.key});
  final T value;
  final T? groupValue;
  final String title;
  final bool nullable;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Radio<T>.adaptive(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          toggleable: nullable,
        ),
      ],
    );
  }
}
