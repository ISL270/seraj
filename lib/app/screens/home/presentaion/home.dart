import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey('HomeScreen'));

  void _goBranch(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

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
                selectedIcon: Icon(Icons.wallet),
                icon: Icon(Icons.wallet),
                label: context.l10n.exercise(0).capitalizedDefinite,
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.wallet),
                icon: Icon(Icons.wallet),
                label: context.l10n.workout(0).capitalizedDefinite,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.person),
                icon: const Icon(Icons.person_outlined),
                label: context.l10n.client(0).capitalizedDefinite,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.settings),
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
