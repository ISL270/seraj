// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:developer';

import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/extension_methods/english_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/presentation/bloc/azkar_bloc.dart';
import 'package:athar/app/features/azkar/presentation/models/azkar_filters.dart';
import 'package:athar/app/features/azkar/sub_features/add_azkar/presentation/add_azkar_screen.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_details/presentation/azkar_details_screen.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

part 'widgets/azkar_list_view_builder.dart';
part 'widgets/filter_bottom_sheet.dart';
part 'widgets/azkar_widget.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  static const String name = 'azkar-screen';

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late final TextEditingController _searchCntrlr;
  late final ScrollController _scrollCntrlr;
  final isCollapsed = ValueNotifier<bool>(false);

  late final AzkarBloc _bloc;
  @override
  void initState() {
    super.initState();

    _scrollCntrlr = ScrollController();
    _bloc = context.read<AzkarBloc>();
    _searchCntrlr = TextEditingController();
    _searchCntrlr.addListener(
      () {
        if (_searchCntrlr.text.isEmpty) {
          _bloc.add(const AzkarSearched(''));
        }
      },
    );
    _scrollCntrlr.addListener(
      () {
        if (_bloc.state.azkars.elements.length > 2) {
          return;
        }
        _scrollCntrlr.jumpTo(0);
      },
    );
  }

  @override
  void dispose() {
    _searchCntrlr.dispose();
    _scrollCntrlr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(
        largeTitle: SuperLargeTitle(
          largeTitle: context.l10n.azkar.capitalizedDefinite,
          textStyle: context.textThemeX.large.bold.copyWith(fontSize: 32.w),
          actions: [
            GestureDetector(
              onTap: () => context.pushNamed(AddAzkarScreen.name),
              child: Assets.icons.plusSquaredOutlined.svg(
                width: 34.w,
                height: 34.w,
                color: context.colorsX.primary,
              ),
            ),
          ],
        ),
        title: Text(
          context.l10n.azkar.capitalizedDefinite,
          style: context.textThemeX.large.bold.copyWith(color: context.colorsX.onBackground),
        ),
        backgroundColor: context.colorsX.background,
        searchBar: SuperSearchBar(
          height: 45.h,
          placeholderText: context.l10n.search,
          searchController: _searchCntrlr,
          onChanged: (searchTerm) => _bloc.add(AzkarSearched(searchTerm)),
          scrollBehavior: SearchBarScrollBehavior.pinned,
          resultBehavior: SearchBarResultBehavior.neverVisible,
          cancelTextStyle: TextStyle(color: context.colorsX.primary),
          cancelButtonText: context.l10n.cancel.capitalized,
          actions: [
            SuperAction(
              behavior: SuperActionBehavior.alwaysVisible,
              child: IconButton(
                iconSize: 30,
                icon: const Icon(Icons.tune),
                color: context.colorsX.primary,
                padding: const EdgeInsetsDirectional.only(start: 20, end: 5),
                onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  useRootNavigator: true,
                  scrollControlDisabledMaxHeightRatio: 0.75,
                  builder: (context) => BlocProvider.value(
                    value: _bloc,
                    child: const _AzkarFilterBottomSheet(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        controller: _scrollCntrlr,
        child: const _AzkarListViewBuilder(),
      ),
    );
  }
}
