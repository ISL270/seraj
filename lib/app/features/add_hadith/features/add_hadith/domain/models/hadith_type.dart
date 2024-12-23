enum HadithType { daif, sahih }

extension HadithTypeX on HadithType {
  bool get isDaif => this == HadithType.daif;
  bool get isSahih => this == HadithType.sahih;
}
