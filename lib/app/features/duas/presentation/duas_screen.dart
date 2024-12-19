import 'package:flutter/material.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});

  static const String name = 'duas';

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(),
    );
  }
}
