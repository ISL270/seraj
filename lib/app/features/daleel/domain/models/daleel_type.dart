import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/widgets.dart';

enum DaleelType {
  aya,
  hadith,
  athar,
  other;
}

extension DaleelTypeX on DaleelType {
  String toTranslate(BuildContext context) => switch (this) {
        DaleelType.hadith => context.l10n.hadith,
        DaleelType.athar => context.l10n.athar,
        DaleelType.other => context.l10n.others,
        DaleelType.aya => context.l10n.aya,
      };

  Color get color => switch (this) {
        DaleelType.hadith => const Color(0xffDEAA79),
        DaleelType.athar => const Color(0xff3D8D7A),
        DaleelType.other => const Color(0xffB1C29E),
        DaleelType.aya => const Color(0xff659287),
      };

  bool get isAya => this == DaleelType.aya;
  bool get isHadith => this == DaleelType.hadith;
  bool get isAthar => this == DaleelType.athar;
  bool get isOther => this == DaleelType.other;
}
