import 'package:athar/app/core/constants/app_colors.dart';
import 'package:athar/app/core/constants/app_icons.dart';
import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/features/athars/presentation/athars_screen.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('HomeScreen'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

  static String get homeBranch => AtharsScreen.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Directionality(
        textDirection: context.settingsBloc.state.isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(16.w),
              right: Radius.circular(16.w),
            ),
            child: NavigationBar(
              onDestinationSelected: _goBranch,
              selectedIndex: navigationShell.currentIndex,
              destinations: [
                NavigationDestination(
                  selectedIcon: Image.asset(AppIcons.hadith, scale: 2.w, color: AppColors.golden),
                  icon:
                      Image.asset(AppIcons.hadith, scale: 2.w, color: context.colorsX.onBackground),
                  label: context.l10n.athars.capitalizedDefinite,
                ),
                NavigationDestination(
                  selectedIcon: Image.asset(AppIcons.duas, scale: 2.w, color: AppColors.golden),
                  icon: Image.asset(AppIcons.duas, scale: 2.w, color: context.colorsX.onBackground),
                  label: context.l10n.duas.capitalizedDefinite,
                ),
                NavigationDestination(
                  selectedIcon: Image.asset(AppIcons.azkar, scale: 2.w, color: AppColors.golden),
                  icon:
                      Image.asset(AppIcons.azkar, scale: 2.w, color: context.colorsX.onBackground),
                  label: context.l10n.azkar.capitalizedDefinite,
                ),
                NavigationDestination(
                  selectedIcon: const Icon(Icons.settings, color: AppColors.golden),
                  icon: const Icon(Icons.settings_outlined),
                  label: context.l10n.settings.capitalizedDefinite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
