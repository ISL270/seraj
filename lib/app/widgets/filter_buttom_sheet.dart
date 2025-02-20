// Favourite_filter_bottom_sheet.dart
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/models/favourite_filters.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteFilterBottomSheet extends StatefulWidget {
  final FavouriteFilters initialFilters;
  final ValueChanged<FavouriteFilters> onFilterApplied;
  final VoidCallback onClearFilters;

  const FavouriteFilterBottomSheet({
    required this.initialFilters,
    required this.onFilterApplied,
    required this.onClearFilters,
    super.key,
  });

  @override
  State<FavouriteFilterBottomSheet> createState() => _FavouriteFilterBottomSheetState();
}

class _FavouriteFilterBottomSheetState extends State<FavouriteFilterBottomSheet> {
  late String selectedFilter;
  late FavouriteFilters filters;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.initialFilters.favourites.isEmpty ? 'All' : 'Favourite';
    filters = widget.initialFilters.clone();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () => Navigator.pop(context),
      backgroundColor: context.colorsX.background,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.title, style: context.textThemeX.medium),
                TextButton(
                  onPressed: () {
                    widget.onClearFilters();
                    Navigator.pop(context);
                  },
                  child: Text(context.l10n.clear),
                ),
              ],
            ),
          ),
          RadioListTile<String>(
            activeColor: context.colorsX.primary,
            title: Text(context.l10n.all, style: context.textThemeX.medium),
            value: 'All',
            groupValue: selectedFilter,
            onChanged: (value) => setState(() => selectedFilter = value!),
          ),
          RadioListTile<String>(
            activeColor: context.colorsX.primary,
            title: Text(context.l10n.fav, style: context.textThemeX.medium),
            value: 'Favourite',
            groupValue: selectedFilter,
            onChanged: (value) => setState(() => selectedFilter = value!),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Button.filled(
              height: 30.h,
              maxWidth: true,
              onPressed: () {
                final updatedFilters = filters.clone();
                updatedFilters.favourites.clear();

                if (selectedFilter == 'Favourite') {
                  updatedFilters.favourites.add(true);
                }

                widget.onFilterApplied(updatedFilters);
                Navigator.pop(context);
              },
              label: context.l10n.filter,
            ),
          )
        ],
      ),
    );
  }
}
