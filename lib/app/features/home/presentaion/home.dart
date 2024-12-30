// ignore_for_file: deprecated_member_use_from_same_package

import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/features/daleel/presentation/athars_screen.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey('HomeScreen'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) =>
      navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);

  static String get homeBranch => AtharsScreen.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Directionality(
        textDirection:
            context.settingsBloc.state.settings.isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.w),
            topRight: Radius.circular(32.w),
          ),
          child: NavigationBar(
            animationDuration: const Duration(milliseconds: 600),
            onDestinationSelected: _goBranch,
            selectedIndex: navigationShell.currentIndex,
            destinations: [
              // first nav. bar item
              NavigationDestination(
                selectedIcon: Assets.icons.quran.svg(color: context.colorsX.primary),
                icon: Assets.icons.quran.svg(color: context.colorsX.onBackground),
                label: context.l10n.athars.capitalizedDefinite,
              ),
              // second nav. bar item
              NavigationDestination(
                selectedIcon: Assets.icons.duas.svg(color: context.colorsX.primary),
                icon: Assets.icons.duas.svg(color: context.colorsX.onBackground),
                label: context.l10n.duas.capitalizedDefinite,
              ),
              // third nav. bar item
              NavigationDestination(
                selectedIcon: Assets.icons.praying.svg(color: context.colorsX.primary),
                icon: Assets.icons.praying.svg(color: context.colorsX.onBackground),
                label: context.l10n.azkar.capitalizedDefinite,
              ),
              // last nav. bar item
              NavigationDestination(
                selectedIcon: Icon(Icons.settings, color: context.colorsX.primary),
                icon: const Icon(Icons.settings_outlined),
                label: context.l10n.settings.capitalizedDefinite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
