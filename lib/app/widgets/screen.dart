import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final SafeAreaValues safeAreaValues;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const Screen({
    required this.body,
    this.appBar,
    this.padding,
    super.key,
    this.safeAreaValues = const SafeAreaValues(),
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(
          top: safeAreaValues.top,
          bottom: safeAreaValues.bottom,
          left: safeAreaValues.left,
          right: safeAreaValues.right,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
            child: body,
          ),
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}

final class SafeAreaValues {
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;

  const SafeAreaValues({
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
  });

  factory SafeAreaValues.none() =>
      const SafeAreaValues(top: false, bottom: false, left: false, right: false);
}
