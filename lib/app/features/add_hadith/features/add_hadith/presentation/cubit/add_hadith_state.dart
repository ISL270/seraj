// ignore_for_file: strict_raw_type

part of 'add_hadith_cubit.dart';

final class AddHadithState extends Equatable {
  const AddHadithState({
    this.hadithType = HadithType.sahih,
    this.textOfHadith = const Name.pure(),
    this.isnadOfHadith = '',
    this.sourceOfHadith = '',
    this.hadithExplain = '',
    this.status = const Initial(),
    this.hadithTypes = const [
      'حديث صحيح',
      'حديث حسن',
      'حديث ضعيف',
      'اخرى',
    ],
    this.hadithTypeDef = const [
      'ما اتصل سنده بنقل العدل الضابط عن مثله إلى منتهاه مع السلامة من الشذوذ والعلة',
      'الحديث المتوسط بين الحديث الصحيح والحديث الضعيف، ويشمل الحديث الحسن لذاته وهو الذي توفرت فيه كل شروط الحديث الصحيح إلا شرطا واحدا وهو ضبط الرواة',
      'يُشير لكل حديث فقد شرطا من شروط الحديث المقبول، أي لم تجتمع فيه صفات الحديث الصحيح ولا صفات الحديث الحسن',
      'الحديث المعلق، الحديث المنقطع، الحديث المعضل، الحديث المُرسَل، حديث مرسل الصحابي، الحديث المدلس، الحديث الموضوع، الحديث المتروك، الحديث المنكر، الحديث المطروح، الحديث المضعف، الحديث المجهول، الحديث المدرج، الحديث المقلوب، الحديث المُضطرِب، الحديث المصحف والمحرف، الحديث الشاذ، الحديث المعلل، الحديث المرفوع، الحديث الموقوف، الحديث المقطوع، الحديث المتواتر، خبر الآحاد، الحديث المُسنَد، الحديث المتصل، الحديث المسلسل، الاعتبار، حديث الفرد، الحديث المعنعن، الحديث المؤنن، الحديث المنقلب، الحديث العالي، الحديث النازل، الحديث الغريب، الحديث المبهم، الحديث المدبج.',
    ],
  });

  final List<String> hadithTypes;

  final List<String> hadithTypeDef;

  final Name textOfHadith;
  final HadithType hadithType;
  final String isnadOfHadith;
  final String sourceOfHadith;
  final String hadithExplain;
  final VoidStatus status;

  @override
  List<Object> get props => [
        textOfHadith,
        hadithType,
        isnadOfHadith,
        sourceOfHadith,
        hadithExplain,
        status,
      ];

  AddHadithState copyWith({
    Name? textOfHadith,
    String? isnadOfHadith,
    String? sourceOfHadith,
    HadithType? hadithType,
    String? hadithExplain,
    VoidStatus? status,
  }) {
    return AddHadithState(
      textOfHadith: textOfHadith ?? this.textOfHadith,
      isnadOfHadith: isnadOfHadith ?? this.isnadOfHadith,
      sourceOfHadith: sourceOfHadith ?? this.sourceOfHadith,
      hadithType: hadithType ?? this.hadithType,
      hadithExplain: hadithExplain ?? this.hadithExplain,
      status: status ?? this.status,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  List<FormzInput> get inputs => [
        textOfHadith,
      ];

  String get errorMsg {
    if (!status.isFailure) return '';
    return (status as Failure).exception.message ?? 'unkown error';
  }
}
