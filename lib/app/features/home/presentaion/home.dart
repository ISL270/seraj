import 'package:athar/app/core/constants/app_icons.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/features/hadith/presentation/hadith_screen.dart';
import 'package:flutter/material.dart';
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

  static String get homeBranch => HadithScreen.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: ClipRRect(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(35),
            right: Radius.circular(35),
          ),
          child: NavigationBar(
            onDestinationSelected: _goBranch,
            selectedIndex: navigationShell.currentIndex,
            destinations: [
              NavigationDestination(
                // selectedIcon: const Icon(Icons.wallet),
                icon: Image.asset(AppIcons.hadith),
                label: context.l10n.hadith,
              ),
              NavigationDestination(
                // selectedIcon: const Icon(Icons.wallet),
                icon: Image.asset(AppIcons.duas),
                label: context.l10n.duas,
              ),
              NavigationDestination(
                // selectedIcon: const Icon(Icons.person),
                icon: Image.asset(AppIcons.azkar),
                label: context.l10n.azkar,
              ),
              NavigationDestination(
                // selectedIcon: const Icon(Icons.settings),
                icon: const Icon(Icons.settings_outlined),
                label: context.l10n.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
