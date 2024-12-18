import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/l10n/language.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@singleton
final class L10nService {
  AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context);

  String trFromStr(String trStrKey, BuildContext context) {
    final trKey = _Transaltions.values.firstOrNullWhere((tr) => tr.name == trStrKey);
    if (trKey == null) return trStrKey;
    return trKey.getTr(context.settingsBloc.state.language);
  }
}

/// Translations that can't be predefined in [AppLocalizations]
enum _Transaltions {
  nameRequired(ar: 'الاسم مطلوب', en: 'Name is required'),
  strength(ar: 'القوة', en: 'Strength'),
  stretching(ar: 'تمارين الإطالة', en: 'Stretching'),
  plyometrics(ar: 'تمارين البلومتريكس', en: 'Plyometrics'),
  powerLifting(ar: 'رفع الأثقال', en: 'Powerlifting'),
  olympicWeightlifting(ar: 'رفع الأثقال الأولمبي', en: 'Olympic Weightlifting'),
  strongman(ar: 'القوة البدنية', en: 'Strongman'),
  cardio(ar: 'تمارين الكارديو', en: 'Cardio'),
  quadriceps(ar: 'عضلة الفخذ الرباعية', en: 'Quadriceps'),
  shoulders(ar: 'الكتفين', en: 'Shoulders'),
  abdominals(ar: 'عضلات البطن', en: 'Abdominals'),
  chest(ar: 'الصدر', en: 'Chest'),
  hamstrings(ar: 'أوتار الركبة', en: 'Hamstrings'),
  triceps(ar: 'العضلة ثلاثية الرؤوس', en: 'Triceps'),
  biceps(ar: 'العضلة ذات الرأسين', en: 'Biceps'),
  lats(ar: 'عضلات الظهر الجانبية', en: 'Lats'),
  middleBack(ar: 'منتصف الظهر', en: 'Middle Back'),
  calves(ar: 'عضلات الساق', en: 'Calves'),
  lowerBack(ar: 'أسفل الظهر', en: 'Lower Back'),
  forearms(ar: 'الساعدين', en: 'Forearms'),
  glutes(ar: 'عضلات الأرداف', en: 'Glutes'),
  traps(ar: 'عضلات شبه المنحرفة', en: 'Traps'),
  adductors(ar: 'العضلات الضامة', en: 'Adductors'),
  abductors(ar: 'العضلات المبعدة', en: 'Abductors'),
  neck(ar: 'الرقبة', en: 'Neck'),
  beginner(ar: 'مبتدئ', en: 'Beginner'),
  intermediate(ar: 'متوسط', en: 'Intermediate'),
  expert(ar: 'خبير', en: 'Expert'),
  barbell(ar: 'باربيل', en: 'Barbell'),
  dumbbell(ar: 'دمبل', en: 'Dumbbell'),
  cable(ar: 'كابل', en: 'Cable'),
  machine(ar: 'آلة', en: 'Machine'),
  kettlebells(ar: 'الدامبل الروسي', en: 'Kettlebells'),
  bands(ar: 'أشرطة المقاومة', en: 'Bands'),
  medicineBall(ar: 'كرة طبية', en: 'Medicine Ball'),
  exerciseBall(ar: 'كرة التمارين', en: 'Exercise Ball'),
  foamRoll(ar: 'أسطوانة الفوم', en: 'Foam Roll'),
  ezCurlBar(ar: 'بار الزد كيرل', en: 'EZ Curl Bar'),
  bodyOnly(ar: 'تمارين بوزن الجسم فقط', en: 'Body Only'),
  bodyWeight(ar: 'وزن الجسم', en: 'Body Weight'),
  timed(ar: 'مؤقت', en: 'Timed'),
  distance(ar: 'مسافة', en: 'Distance'),
  other(ar: 'أخرى', en: 'Other');

  final String ar;
  final String en;

  const _Transaltions({
    required this.ar,
    required this.en,
  });

  String getTr(Language lang) => switch (lang) {
        Language.arabic => ar,
        Language.english => en,
      };
}
