import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DuaFilterBottomSheet extends StatefulWidget {
  const DuaFilterBottomSheet({super.key});

  @override
  State<DuaFilterBottomSheet> createState() => _DuaFilterBottomSheetState();
}

class _DuaFilterBottomSheetState extends State<DuaFilterBottomSheet> {
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = 'All'; // Default selection
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: context.colorsX.background,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.filterOptions,
                  style: context.textThemeX.medium,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedFilter = 'All'; // Reset to default
                    });
                  },
                  child: Text(context.l10n.clear),
                ),
              ],
            ),
          ),
          RadioListTile<String>(
            activeColor: context.colorsX.primary,
            title: Text(context.l10n.all),
            value: 'All',
            groupValue: selectedFilter,
            onChanged: (value) {
              setState(() {
                selectedFilter = value!;
              });
            },
          ),
          RadioListTile<String>(
            activeColor: context.colorsX.primary,
            title: Text(context.l10n.fav),
            value: 'Favorite',
            groupValue: selectedFilter,
            onChanged: (value) {
              setState(() {
                selectedFilter = value!;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Button.filled(height: 30.h, onPressed: () {}, label: context.l10n.filter),
          )
        ],
      ),
    );
  }
}
