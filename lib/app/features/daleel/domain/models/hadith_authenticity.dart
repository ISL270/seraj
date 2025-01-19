import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum HadithAuthenticity { sahih, hasan, daif }

extension HadithTypeX on HadithAuthenticity {
  bool get isSahih => this == HadithAuthenticity.sahih;
  bool get isHasan => this == HadithAuthenticity.hasan;
}

extension HadithAuthenticityStringX on String {
  String gethadithTypeString(BuildContext context) {
    switch (this) {
      case 'daif':
        return context.l10n.hadithDaif;
      case 'hasan':
        return context.l10n.hadithHasan;
      case 'sahih':
        return context.l10n.hadithSahih;
      default:
        return '';
    }
  }
}
