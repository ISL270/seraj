import 'package:flutter/material.dart';

extension ScrollControllerX on ScrollController {
  bool get hasReachBottom {
    if (!hasClients) return false;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = offset;
    return currentScroll >= (maxScroll * .8);
  }
}
