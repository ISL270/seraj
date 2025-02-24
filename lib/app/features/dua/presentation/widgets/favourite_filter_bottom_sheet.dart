part of '../dua_screen.dart';

class _DuaFilterBottomSheet extends StatefulWidget {
  const _DuaFilterBottomSheet();

  @override
  State<_DuaFilterBottomSheet> createState() => _DuaFilterBottomSheetState();
}

class _DuaFilterBottomSheetState extends State<_DuaFilterBottomSheet> {
  late String selectedFilter;
  late DuaFilters filters;

  @override
  void initState() {
    super.initState();
    selectedFilter =
        context.read<DuaBloc>().state.duaFilters.favourites.isEmpty ? 'All' : 'Favourite';
    filters = context.read<DuaBloc>().state.duaFilters.clone();
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
                      context.read<DuaBloc>().add(DuaFiltered(filters));
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
                      .read<DuaBloc>()
                      .add(DuaSearched(context.read<DuaBloc>().state.searchTerm));
                }

                // used for debugging
                log(filters.toString());

                // take filter and emit DuaFilters
                context.read<DuaBloc>().add(DuaFiltered(filters));

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
