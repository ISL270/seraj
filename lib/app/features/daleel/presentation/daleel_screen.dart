// ignore_for_file: deprecated_member_use_from_same_package, unused_element, deprecated_member_use, inference_failure_on_function_invocation

import 'dart:developer';

import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/datetime_x.dart';
import 'package:athar/app/core/extension_methods/english_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/presentation/bloc/daleel_bloc.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
import 'package:athar/app/features/daleel/presentation/widgets/priority_slider_w_label.dart';
import 'package:athar/app/features/daleel/sub_features/add_aya/presentation/add_new_ayah.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_athar/presentation/add_edit_athar_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_edit_hadith/presentation/add_edit_hadith_screen.dart';
import 'package:athar/app/features/daleel/sub_features/add_other/presentation/add_other_screen.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_details/presentation/daleel_details_screen.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:dartx/dartx.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

part 'widgets/bottom_sheet.dart';
part 'widgets/daleel_list_view_builder.dart';
part 'widgets/filter_bottom_sheet.dart';

class DaleelScreen extends StatefulWidget {
  const DaleelScreen({super.key});

  static const name = 'daleel-screen';

  @override
  State<DaleelScreen> createState() => _DaleelScreenState();
}

class _DaleelScreenState extends State<DaleelScreen> {
  late final TextEditingController _searchCntrlr;
  late final ScrollController _scrollCntrlr;
  final isCollapsed = ValueNotifier<bool>(false);

  late final DaleelBloc _bloc;
  late final DaleelFilters filters;
  @override
  void initState() {
    super.initState();
    filters = context.read<DaleelBloc>().state.daleelFilters;
    _scrollCntrlr = ScrollController();
    _bloc = context.read<DaleelBloc>();
    _searchCntrlr = TextEditingController();
    _searchCntrlr.addListener(
      () {
        if (_searchCntrlr.text.isBlank) {
          _bloc.add(const DaleelSearched(''));
        }
      },
    );
    _scrollCntrlr.addListener(
      () {
        if (_bloc.state.status.isSuccess && _bloc.state.daleels.elements.length > 2) {
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
          largeTitle: context.l10n.athars.capitalizedDefinite,
          textStyle: context.textThemeX.large.bold.copyWith(fontSize: 32.w),
          actions: [
            GestureDetector(
              onTap: () => _openBottomSheet(context),
              child: Assets.icons.plusSquaredOutlined.svg(
                width: 34.w,
                height: 34.w,
                color: context.colorsX.primary,
              ),
            ),
          ],
        ),
        title: Text(
          context.l10n.athars.capitalizedDefinite,
          style: context.textThemeX.large.bold.copyWith(color: context.colorsX.onBackground),
        ),
        backgroundColor: context.colorsX.background,
        searchBar: SuperSearchBar(
          height: 45.h,
          searchController: _searchCntrlr,
          placeholderText: context.l10n.search,
          cancelButtonText: context.l10n.cancel.capitalized,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          resultBehavior: SearchBarResultBehavior.neverVisible,
          cancelTextStyle: context.textThemeX.medium.bold.copyWith(color: context.colorsX.primary),
          onChanged: (searchTerm) => _bloc.add(DaleelSearched(searchTerm)),
          actions: [SuperAction(child: Gap(10.w))],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        controller: _scrollCntrlr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.w,
                  children: [
                    Gap(12.w),
                    BlocBuilder<DaleelBloc, DaleelState>(
                      builder: (context, state) {
                        return _DaleelFilterTypeWidget(
                          label: state.daleelFilters.daleelType.isEmpty
                              ? context.l10n.daleelType
                              : '${context.l10n.daleelType} : ${state.daleelFilters.daleelType.map((e) => e.toTranslate(context)).join(', ')}',
                          isActive: state.daleelFilters.daleelType.isNotEmpty,
                          onTap: () async {
                            await _openFilterDaleelTypeSelectorBottomSheet(filters, context);
                            _bloc.add(const DaleelSearched(''));
                          },
                          cancelFilterActive: state.daleelFilters.daleelType.isNotEmpty,
                          cancelFilteronTap: () {
                            state.daleelFilters.daleelType.clear();
                            _bloc.add(const DaleelSearched(''));
                          },
                        );
                      },
                    ),
                    BlocBuilder<DaleelBloc, DaleelState>(
                      builder: (context, state) {
                        return _DaleelFilterTypeWidget(
                          label: state.daleelFilters.priority.isEmpty
                              ? context.l10n.priority
                              : '${context.l10n.priority} : ${state.daleelFilters.priority.map((e) => e.toTranslate(context)).join(', ')}',
                          isActive: state.daleelFilters.priority.isNotEmpty,
                          onTap: () async {
                            await _openFilterPrioritySelectorBottomSheet(filters, context);
                            _bloc.add(const DaleelSearched(''));
                          },
                          cancelFilterActive: state.daleelFilters.priority.isNotEmpty,
                          cancelFilteronTap: () {
                            state.daleelFilters.priority.clear();
                            _bloc.add(const DaleelSearched(''));
                          },
                        );
                      },
                    ),
                    _DaleelFilterTypeWidget(
                      label: context.l10n.date,
                      onTap: () async {
                        await _openFilterDateSelectorBottomSheet(filters, context);
                      },
                    ),
                    Gap(12.w),
                  ],
                ),
              ),
            ),
            const _DaleelListViewBuilder(),
          ],
        ),
      ),
    );
  }
}

class _DaleelFilterTypeWidget extends StatelessWidget {
  const _DaleelFilterTypeWidget({
    this.label = 'تصنيف',
    this.isActive = false,
    this.onTap,
    this.cancelFilteronTap,
    this.cancelFilterActive = false,
  });

  final String label;
  final bool isActive;
  final void Function()? onTap;
  final void Function()? cancelFilteronTap;
  final bool cancelFilterActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.w),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 40.h,
        decoration: BoxDecoration(
          color: isActive
              ? context.colorsX.primary.withOpacity(0.15)
              : context.colorsX.onBackgroundTint35.withOpacity(0.10),
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.sp),
          child: Center(
            child: Row(
              spacing: 3.w,
              children: [
                Gap(4.w),
                Text(
                  label,
                  style: context.textThemeX.medium.bold.copyWith(
                    color: isActive ? context.colorsX.primary : context.colorsX.onBackgroundTint,
                  ),
                ),
                Gap(3.w),
                if (cancelFilterActive) CancelFilterButton(onTap: cancelFilteronTap),
                Gap(1.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
