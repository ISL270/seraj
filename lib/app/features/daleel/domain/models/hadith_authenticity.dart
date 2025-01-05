enum HadithAuthenticity { daif, hasan, sahih }

extension HadithTypeX on HadithAuthenticity {
  bool get isDaif => this == HadithAuthenticity.daif;
  bool get isSahih => this == HadithAuthenticity.sahih;
  bool get isHasan => this == HadithAuthenticity.hasan;
}
