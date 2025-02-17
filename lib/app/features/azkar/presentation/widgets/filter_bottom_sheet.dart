part of '../azkar_screen.dart';

class _AzkarFilterBottomSheet extends StatefulWidget {
  const _AzkarFilterBottomSheet();

  @override
  State<_AzkarFilterBottomSheet> createState() => _AzkarFilterBottomSheetState();
}

class _AzkarFilterBottomSheetState extends State<_AzkarFilterBottomSheet> {
  late String selectedFilter;
  late AzkarFilters filters;

  @override
  void initState() {
    super.initState();
    selectedFilter =
        context.read<AzkarBloc>().state.azkarFilters.favourites.isEmpty ? 'All' : 'Favourite';
    filters = context.read<AzkarBloc>().state.azkarFilters.clone();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () => context.pop(),
      backgroundColor: context.colorsX.background,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.filterOptions, style: context.textThemeX.large.bold),
                TextButton(
                  onPressed: () {
                    setState(() {
                      filters.favourites.clear();
                      context.read<AzkarBloc>().add(AzkarFiltered(filters));
                      selectedFilter = 'All'; // Reset to default
                      context.pop();
                    });
                  },
                  child: Text(context.l10n.clear),
                ),
              ],
            ),
          ),
          RadioListTile<String>(
            activeColor: context.colorsX.primary,
            title: Text(context.l10n.all, style: context.textThemeX.medium.bold),
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
            title: Text(context.l10n.fav, style: context.textThemeX.medium.bold),
            value: 'Favourite',
            groupValue: selectedFilter,
            onChanged: (value) {
              setState(() {
                selectedFilter = value!;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Button.filled(
              height: 30.h,
              maxWidth: true,
              onPressed: () {
                // to ensure that favourites are cleared when tap on "تصفية"
                filters.favourites.clear();

                //check if selected is all or favourites
                if (selectedFilter == 'Favourite') {
                  filters.favourites.add(true);
                } else {
                  context
                      .read<AzkarBloc>()
                      .add(AzkarSearched(context.read<AzkarBloc>().state.searchTerm));
                }

                // used for debugging
                log(filters.toString());

                // take filter and emit AzkarFiltered
                context.read<AzkarBloc>().add(AzkarFiltered(filters));

                // close the bottom sheet
                context.pop();
              },
              label: context.l10n.filter,
            ),
          )
        ],
      ),
    );
  }
}
