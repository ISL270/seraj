// ignore_for_file: deprecated_member_use_from_same_package, inference_failure_on_function_invocation

import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});

  static const String name = 'duas';

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(
        largeTitle: SuperLargeTitle(
          largeTitle: context.l10n.duas.capitalizedDefinite,
          textStyle: context.textThemeX.large.bold.copyWith(fontSize: 32.w),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Assets.icons.plusSquaredOutlined.svg(
                width: 34.w,
                height: 34.w,
                color: context.colorsX.primary,
              ),
            ),
          ],
        ),
        title: Row(
          children: [
            Text(
              context.l10n.athars.capitalizedDefinite,
              style: context.textThemeX.large.bold.copyWith(color: context.colorsX.onBackground),
            ),
          ],
        ),
        backgroundColor: context.colorsX.background,
        searchBar: SuperSearchBar(placeholderText: context.l10n.search.capitalizedDefinite),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _DuaWidget(),
          ],
        ),
      ),
    );
  }
}

class _DuaWidget extends StatelessWidget {
  const _DuaWidget();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('1'),
      resizeDuration: const Duration(microseconds: 600),
      onDismissed: (v) {},
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: context.colorsX.primary.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12.w),
          boxShadow: [
            BoxShadow(
              blurRadius: 0.5,
              spreadRadius: 0.2,
              blurStyle: BlurStyle.outer,
              color: context.colorsX.onBackgroundTint35,
            ),
            BoxShadow(
              blurRadius: 0.7,
              spreadRadius: 0.5,
              blurStyle: BlurStyle.outer,
              color: context.colorsX.onBackgroundTint35,
            ),
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 0.9,
              blurStyle: BlurStyle.outer,
              color: context.colorsX.onBackgroundTint35,
            ),
          ],
        ),
        child: SizedBox(
          height: 80.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.rtl,
              children: [
                Gap(5.w),
                Expanded(
                  child: Text(
                    'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
                    style: context.textThemeX.medium.bold,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Gap(5.w),
                const _FavoriteIconButton(),
                Gap(15.w),
                GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              context.l10n.areYouSure,
                              textAlign: TextAlign.center,
                              style: context.textThemeX.medium.copyWith(
                                color: context.settingsBloc.state.isThemeDark
                                    ? context.colorsX.background
                                    : context.colorsX.onBackground,
                              ),
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            contentPadding: EdgeInsets.all(8.w),
                            actions: [
                              TextButton(
                                child: Text(
                                  context.l10n.cancel,
                                  style: context.textThemeX.medium.copyWith(
                                    color: context.settingsBloc.state.isThemeDark
                                        ? context.colorsX.background
                                        : context.colorsX.onBackground,
                                  ),
                                ),
                                onPressed: () => context.pop(),
                              ),
                              TextButton(
                                child: Text(
                                  context.l10n.ok,
                                  style: context.textThemeX.medium.copyWith(
                                    color: context.colorsX.error,
                                  ),
                                ),
                                onPressed: () {},
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.delete_rounded)),
                Gap(10.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteIconButton extends StatefulWidget {
  const _FavoriteIconButton();

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<_FavoriteIconButton> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: Icon(
          _isFavorited ? Icons.favorite : Icons.favorite_border,
          key: ValueKey<bool>(_isFavorited),
          color: _isFavorited ? context.colorsX.error : context.colorsX.onBackground,
        ),
      ),
    );
  }
}
