import 'package:flutter/material.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  static const String name = 'hadith';

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(),
    );
  }
}
