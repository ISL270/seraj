import 'package:flutter/material.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  static const String name = 'azkar';

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(),
    );
  }
}
