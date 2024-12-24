enum HadithAuthenticity { daif, sahih }

extension HadithTypeX on HadithAuthenticity {
  bool get isDaif => this == HadithAuthenticity.daif;
  bool get isSahih => this == HadithAuthenticity.sahih;
}
