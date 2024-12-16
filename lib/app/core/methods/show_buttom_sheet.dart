import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context, String label, String
selectedValue,
    List<String> options) {
  showModalBottomSheet<dynamic>(
    backgroundColor: context.colorsX.secondaryBackground,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            for (final String option in options)
              ListTile(
                title: Text(option),
                trailing: selectedValue == option
                    ?  Icon(Icons.check_circle, color:context.colorsX.primary)
                    : null,
                onTap: () {
                  Navigator.pop(context, option);
                },
              ),
          ],
        ),
      );
    },
  ).then((selectedOption) {
    if (selectedOption != null) {
      // Handle the selected option here
      // Example: Update state or call a function
    }
  });
}
