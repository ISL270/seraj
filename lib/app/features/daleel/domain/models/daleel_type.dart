import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum DaleelType { hadith, athar, others }

// 1. hadith
// 2. ayat
// 3. athar
// 4. others

extension DaleelTypeX on DaleelType {
  String toTranslate(BuildContext context) => switch (this) {
        DaleelType.hadith => context.l10n.hadith,
        DaleelType.athar => context.l10n.athar,
        DaleelType.others => context.l10n.others,
      };

  bool get isHadith => this == DaleelType.hadith;
  bool get isAthar => this == DaleelType.athar;
  bool get isOthers => this == DaleelType.others;
}
