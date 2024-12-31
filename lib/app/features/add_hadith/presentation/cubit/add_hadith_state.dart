// ignore_for_file: strict_raw_type

part of 'add_hadith_cubit.dart';

final class AddHadithState extends Equatable with FormzMixin {
  const AddHadithState({
    this.hadithAuthenticity = HadithAuthenticity.sahih,
    this.textOfHadith = const Name.pure(),
    this.sayerOfHadith = '',
    this.extractionOfHadith = '',
    this.descOfHadith = '',
    this.sliderValue = 0.0,
    this.status = const Initial(),
    this.hintTexts = const [
      'أنا عِنْدَ ظَنِّ عَبْدِي بي، وأنا معهُ إذا ذَكَرَنِي، فإنْ ذَكَرَنِي في نَفْسِهِ ذَكَرْتُهُ في نَفْسِي، وإنْ ذَكَرَنِي في مَلَإٍ ذَكَرْتُهُ في مَلَإٍ خَيْرٍ منهمْ، وإنْ تَقَرَّبَ إلَيَّ بشِبْرٍ تَقَرَّبْتُ إلَيْهِ ذِراعًا، وإنْ تَقَرَّبَ إلَيَّ ذِراعًا تَقَرَّبْتُ إلَيْهِ باعًا، وإنْ أتانِي يَمْشِي أتَيْتُهُ هَرْوَلَةً',
      'عن أبي هريرة - رضي الله عنه - عن النبي ﷺ',
      'اخرجه البخاري ومسلم',
      'إن ظَنَّ باللهِ خَيرًا فَلَه، وإن ظَنَّ بِه سِوَى ذلك فَلَه، وحُسنُ الظَّنِّ باللهِ عزَّ وجلَّ يَكونُ بفِعلِ ما يُوجِبُ فَضلَ اللهِ وَرَجاءَه، فيَعمَلُ الصَّالِحاتِ، ويُحسِنُ الظَّنَّ بأنَّ اللهَ تَعالَى يَقبَلُه، فاللهُ سُبحانَه عِندَ مُنتهَى أمَلِ العَبدِ به،',
    ],
    this.priorityTexts = const [
      'يرجى',
      'يفضل',
      'يجب',
    ],
  });

  final List<String> hintTexts;
  final List<String> priorityTexts;

  final Name textOfHadith;
  final HadithAuthenticity hadithAuthenticity;
  final String sayerOfHadith;
  final String extractionOfHadith;
  final String descOfHadith;
  final double sliderValue;
  final VoidStatus status;

  @override
  List<Object> get props => [
        textOfHadith,
        hadithAuthenticity,
        sayerOfHadith,
        extractionOfHadith,
        descOfHadith,
        sliderValue,
        status,
      ];

  AddHadithState copyWith({
    Name? textOfHadith,
    String? sayerOfHadith,
    String? extractionOfHadith,
    HadithAuthenticity? hadithAuthenticity,
    String? descOfHadith,
    double? sliderValue,
    VoidStatus? status,
  }) {
    return AddHadithState(
      textOfHadith: textOfHadith ?? this.textOfHadith,
      sayerOfHadith: sayerOfHadith ?? this.sayerOfHadith,
      extractionOfHadith: extractionOfHadith ?? this.extractionOfHadith,
      hadithAuthenticity: hadithAuthenticity ?? this.hadithAuthenticity,
      descOfHadith: descOfHadith ?? this.descOfHadith,
      sliderValue: sliderValue ?? this.sliderValue,
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
