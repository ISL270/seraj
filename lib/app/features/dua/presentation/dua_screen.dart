// ignore_for_file: deprecated_member_use_from_same_package, inference_failure_on_function_invocation, dead_code

import 'dart:developer';

import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/extension_methods/english_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/presentation/bloc/dua_bloc.dart';
import 'package:athar/app/features/dua/presentation/models/dua_filters.dart';
import 'package:athar/app/features/dua/sub_features/add_or_edit_dua/add_dua_screen.dart';
import 'package:athar/app/features/dua/sub_features/dua_details/dua_details_screen.dart';
import 'package:athar/app/widgets/action_buttoms.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/selectable_filter_chip.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

part 'widgets/dua_widget.dart';
part 'widgets/duas_listview.dart';
part 'widgets/favourite_filter_bottom_sheet.dart';
part 'widgets/tag_filter_bottom_sheet.dart';

class DuasScreen extends StatefulWidget {
  const DuasScreen({super.key});

  static const name = 'duas';

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
  late final TextEditingController _searchCntrlr;
  late final ScrollController _scrollCntrlr;
  final isCollapsed = ValueNotifier<bool>(false);

  late final DuaBloc _bloc;
  late final DuaFilters filters;

  @override
  void initState() {
    super.initState();
    filters = context.read<DuaBloc>().state.duaFilters;
    _scrollCntrlr = ScrollController();
    _bloc = context.read<DuaBloc>();
    _searchCntrlr = TextEditingController();
    _searchCntrlr.addListener(
      () {
        if (_searchCntrlr.text.isBlank) {
          _bloc.add(const DuaSearched(''));
        }
      },
    );
    _scrollCntrlr.addListener(
      () {
        if (_bloc.state.result.elements.length > 2) {
          return;
        }
        _scrollCntrlr.jumpTo(0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      scrollController: _scrollCntrlr,
      onCollapsed: (value) => isCollapsed.value = value,
      appBar: SuperAppBar(
        largeTitle: SuperLargeTitle(
          largeTitle: context.l10n.duas.capitalizedDefinite,
          textStyle: context.textThemeX.large.bold.copyWith(fontSize: 32.w),
          actions: [
            GestureDetector(
              onTap: () => context.pushNamed(AddOrEditDuaScreen.name),
              child: Assets.icons.plusSquaredOutlined.svg(
                width: 34.w,
                height: 34.w,
                color: context.colorsX.primary,
              ),
            ),
          ],
        ),
        title: Text(
          context.l10n.duas.capitalizedDefinite,
          style: context.textThemeX.large.bold
              .copyWith(color: context.colorsX.onBackground),
        ),
        backgroundColor: context.colorsX.background,
        searchBar: SuperSearchBar(
          height: 45.h,
          searchController: _searchCntrlr,
          placeholderText: context.l10n.search,
          scrollBehavior: SearchBarScrollBehavior.pinned,
          cancelButtonText: context.l10n.cancel.capitalized,
          resultBehavior: SearchBarResultBehavior.neverVisible,
          cancelTextStyle: TextStyle(color: context.colorsX.primary),
          onChanged: (searchTerm) => _bloc.add(DuaSearched(searchTerm)),
          actions: [
            SuperAction(
              behavior: SuperActionBehavior.alwaysVisible,
              child: IconButton(
                iconSize: 30,
                icon: const Icon(Icons.tune),
                color: context.colorsX.primary,
                padding: const EdgeInsetsDirectional.only(start: 20, end: 5),
                onPressed: () => _showFavouriteFilter(context),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollCntrlr,
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<DuaBloc, DuaState>(
                  builder: (context, state) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: SelectableFilterChip(
                        label: state.duaFilters.tags.isEmpty
                            ? context.l10n.tags
                            : '${context.l10n.tags} : ${state.duaFilters.tags.map((e) => e.name).join(', ')}',
                        isActive: state.duaFilters.tags.isNotEmpty,
                        cancelFilterActive: state.duaFilters.tags.isNotEmpty,
                        cancelFilteronTap: () {
                          state.duaFilters.tags.clear();
                          _bloc.add(DuaSearched(state.searchTerm));
                        },
                        onTap: () async {
                          await _openFilterTagSelectionBottomSheet(
                              filters, context);
                          _bloc.add(DuaSearched(state.searchTerm));
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            const _DuasListView(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollCntrlr.dispose();
    _searchCntrlr.dispose();
    super.dispose();
  }
}

void _showFavouriteFilter(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    scrollControlDisabledMaxHeightRatio: 0.75,
    builder: (_) => BlocProvider.value(
      value: context.read<DuaBloc>(),
      child: const _DuaFilterBottomSheet(),
    ),
  );
}
