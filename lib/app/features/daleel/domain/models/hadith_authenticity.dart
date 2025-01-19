enum HadithAuthenticity {
  sahih,
  hasan,
  daif;
}

extension HadithTypeX on HadithAuthenticity {
  bool get isSahih => this == HadithAuthenticity.sahih;
  bool get isHasan => this == HadithAuthenticity.hasan;
  bool get isDaif => this == HadithAuthenticity.daif;
}
