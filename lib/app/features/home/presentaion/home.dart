import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey('HomeScreen'));
  final StatefulNavigationShell navigationShell;

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
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.wallet),
                icon: Icon(Icons.wallet),
                label: 'test',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.wallet),
                icon: Icon(Icons.wallet),
                label: 'test',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outlined),
                label: 'test',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings_outlined),
                label: 'test',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
