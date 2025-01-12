enum DaleelType {
  aya,
  hadith,
  athar,
  other;
}

extension DaleelTypeX on DaleelType {
  bool get isAya => this == DaleelType.aya;
  bool get isHadith => this == DaleelType.hadith;
  bool get isAthar => this == DaleelType.athar;
  bool get isOther => this == DaleelType.other;
}
