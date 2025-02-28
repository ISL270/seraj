import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @signUp.
  ///
  /// In ar, this message translates to:
  /// **'التسجيل'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الالكتروني'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirmPassword;

  /// No description provided for @signInWithGoogle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول بجوجل'**
  String get signInWithGoogle;

  /// No description provided for @createAccount.
  ///
  /// In ar, this message translates to:
  /// **'انشاء حساب'**
  String get createAccount;

  /// No description provided for @invalidEmail.
  ///
  /// In ar, this message translates to:
  /// **'بريد الكتروني غير صالح'**
  String get invalidEmail;

  /// No description provided for @invalidPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور غير صالحة'**
  String get invalidPassword;

  /// No description provided for @passwordsDontMatch.
  ///
  /// In ar, this message translates to:
  /// **'كلمات المرور لا تتطابق'**
  String get passwordsDontMatch;

  /// No description provided for @loginFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل تسجيل الدخول'**
  String get loginFailed;

  /// No description provided for @signUpFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل التسجيل'**
  String get signUpFailed;

  /// No description provided for @theme.
  ///
  /// In ar, this message translates to:
  /// **'النمط'**
  String get theme;

  /// No description provided for @light.
  ///
  /// In ar, this message translates to:
  /// **'فاتح'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In ar, this message translates to:
  /// **'داكن'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In ar, this message translates to:
  /// **'النظام'**
  String get system;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @athar.
  ///
  /// In ar, this message translates to:
  /// **'أثر'**
  String get athar;

  /// No description provided for @offline.
  ///
  /// In ar, this message translates to:
  /// **'غير متصل'**
  String get offline;

  /// No description provided for @online.
  ///
  /// In ar, this message translates to:
  /// **'متصل'**
  String get online;

  /// No description provided for @today.
  ///
  /// In ar, this message translates to:
  /// **'اليوم'**
  String get today;

  /// No description provided for @january.
  ///
  /// In ar, this message translates to:
  /// **'يناير'**
  String get january;

  /// No description provided for @february.
  ///
  /// In ar, this message translates to:
  /// **'فبراير'**
  String get february;

  /// No description provided for @march.
  ///
  /// In ar, this message translates to:
  /// **'مارس'**
  String get march;

  /// No description provided for @april.
  ///
  /// In ar, this message translates to:
  /// **'أبريل'**
  String get april;

  /// No description provided for @may.
  ///
  /// In ar, this message translates to:
  /// **'مايو'**
  String get may;

  /// No description provided for @june.
  ///
  /// In ar, this message translates to:
  /// **'يونيو'**
  String get june;

  /// No description provided for @july.
  ///
  /// In ar, this message translates to:
  /// **'يوليو'**
  String get july;

  /// No description provided for @august.
  ///
  /// In ar, this message translates to:
  /// **'أغسطس'**
  String get august;

  /// No description provided for @september.
  ///
  /// In ar, this message translates to:
  /// **'سبتمبر'**
  String get september;

  /// No description provided for @october.
  ///
  /// In ar, this message translates to:
  /// **'أكتوبر'**
  String get october;

  /// No description provided for @november.
  ///
  /// In ar, this message translates to:
  /// **'نوفمبر'**
  String get november;

  /// No description provided for @december.
  ///
  /// In ar, this message translates to:
  /// **'ديسمبر'**
  String get december;

  /// No description provided for @hadith.
  ///
  /// In ar, this message translates to:
  /// **'أحاديث'**
  String get hadith;

  /// No description provided for @duas.
  ///
  /// In ar, this message translates to:
  /// **'أدعية'**
  String get duas;

  /// No description provided for @azkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار'**
  String get azkar;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'إعدادات'**
  String get settings;

  /// No description provided for @done.
  ///
  /// In ar, this message translates to:
  /// **'تم'**
  String get done;

  /// No description provided for @name.
  ///
  /// In ar, this message translates to:
  /// **'إسم'**
  String get name;

  /// No description provided for @invalidName.
  ///
  /// In ar, this message translates to:
  /// **'إسم غير صالح'**
  String get invalidName;

  /// No description provided for @athars.
  ///
  /// In ar, this message translates to:
  /// **'أثار'**
  String get athars;

  /// No description provided for @search.
  ///
  /// In ar, this message translates to:
  /// **'بحث'**
  String get search;

  /// No description provided for @addNew.
  ///
  /// In ar, this message translates to:
  /// **'إضافة جديدة'**
  String get addNew;

  /// No description provided for @propheticHadith.
  ///
  /// In ar, this message translates to:
  /// **'حديث نبوي'**
  String get propheticHadith;

  /// No description provided for @propheticHadithC.
  ///
  /// In ar, this message translates to:
  /// **'الحديث النبوي'**
  String get propheticHadithC;

  /// No description provided for @hadithDesc.
  ///
  /// In ar, this message translates to:
  /// **'نص الحديث'**
  String get hadithDesc;

  /// No description provided for @quranicVerse.
  ///
  /// In ar, this message translates to:
  /// **'آيات قرآنية'**
  String get quranicVerse;

  /// No description provided for @others.
  ///
  /// In ar, this message translates to:
  /// **'اخرى'**
  String get others;

  /// No description provided for @add.
  ///
  /// In ar, this message translates to:
  /// **'إضافة'**
  String get add;

  /// No description provided for @selectHadithType.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع الحديث'**
  String get selectHadithType;

  /// No description provided for @title.
  ///
  /// In ar, this message translates to:
  /// **'عنوان'**
  String get title;

  /// No description provided for @concept.
  ///
  /// In ar, this message translates to:
  /// **'مفهوم'**
  String get concept;

  /// No description provided for @hadithType.
  ///
  /// In ar, this message translates to:
  /// **'نوع الحديث'**
  String get hadithType;

  /// No description provided for @textOfHadith.
  ///
  /// In ar, this message translates to:
  /// **'المتن'**
  String get textOfHadith;

  /// No description provided for @rawiOfHadith.
  ///
  /// In ar, this message translates to:
  /// **'الراوي'**
  String get rawiOfHadith;

  /// No description provided for @extractionOfHadith.
  ///
  /// In ar, this message translates to:
  /// **'التخريج'**
  String get extractionOfHadith;

  /// No description provided for @hadithDaif.
  ///
  /// In ar, this message translates to:
  /// **'ضعيف'**
  String get hadithDaif;

  /// No description provided for @hadithSahih.
  ///
  /// In ar, this message translates to:
  /// **'صحيح'**
  String get hadithSahih;

  /// No description provided for @hadithExplain.
  ///
  /// In ar, this message translates to:
  /// **'الشرح'**
  String get hadithExplain;

  /// No description provided for @enterTextOfHadith.
  ///
  /// In ar, this message translates to:
  /// **'ادخل متن الحديث'**
  String get enterTextOfHadith;

  /// No description provided for @hadithRule.
  ///
  /// In ar, this message translates to:
  /// **'الحكم'**
  String get hadithRule;

  /// No description provided for @hadithAddedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة الحديث بنجاح'**
  String get hadithAddedSuccessf;

  /// No description provided for @hadithHasan.
  ///
  /// In ar, this message translates to:
  /// **'حسن'**
  String get hadithHasan;

  /// No description provided for @priority.
  ///
  /// In ar, this message translates to:
  /// **'مدى الاهمية'**
  String get priority;

  /// No description provided for @saveIt.
  ///
  /// In ar, this message translates to:
  /// **'حفظه'**
  String get saveIt;

  /// No description provided for @normal.
  ///
  /// In ar, this message translates to:
  /// **'يرجى'**
  String get normal;

  /// No description provided for @high.
  ///
  /// In ar, this message translates to:
  /// **'يفضل'**
  String get high;

  /// No description provided for @urgent.
  ///
  /// In ar, this message translates to:
  /// **'يجب'**
  String get urgent;

  /// No description provided for @text.
  ///
  /// In ar, this message translates to:
  /// **'النص'**
  String get text;

  /// No description provided for @sayer.
  ///
  /// In ar, this message translates to:
  /// **'القائل'**
  String get sayer;

  /// No description provided for @explanation.
  ///
  /// In ar, this message translates to:
  /// **'الشرح'**
  String get explanation;

  /// No description provided for @enterText.
  ///
  /// In ar, this message translates to:
  /// **'ادخل النص'**
  String get enterText;

  /// No description provided for @atharText.
  ///
  /// In ar, this message translates to:
  /// **'النص'**
  String get atharText;

  /// No description provided for @atharSayer.
  ///
  /// In ar, this message translates to:
  /// **'القائل'**
  String get atharSayer;

  /// No description provided for @atharIsnad.
  ///
  /// In ar, this message translates to:
  /// **'الإسناد'**
  String get atharIsnad;

  /// No description provided for @atharRule.
  ///
  /// In ar, this message translates to:
  /// **'الحكم'**
  String get atharRule;

  /// No description provided for @atharExtraction.
  ///
  /// In ar, this message translates to:
  /// **'التخريج'**
  String get atharExtraction;

  /// No description provided for @intermittent.
  ///
  /// In ar, this message translates to:
  /// **'متقطع'**
  String get intermittent;

  /// No description provided for @other.
  ///
  /// In ar, this message translates to:
  /// **'اخرى'**
  String get other;

  /// No description provided for @explaination.
  ///
  /// In ar, this message translates to:
  /// **'الشرح'**
  String get explaination;

  /// No description provided for @explainationOfAthar.
  ///
  /// In ar, this message translates to:
  /// **'شرح الاثر'**
  String get explainationOfAthar;

  /// No description provided for @enterTextOfAthar.
  ///
  /// In ar, this message translates to:
  /// **'ادخل نص الاثر'**
  String get enterTextOfAthar;

  /// No description provided for @ok.
  ///
  /// In ar, this message translates to:
  /// **'موافق'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @areYouSure.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من الحذف؟'**
  String get areYouSure;

  /// No description provided for @daleelType.
  ///
  /// In ar, this message translates to:
  /// **'نوع الدليل'**
  String get daleelType;

  /// No description provided for @date.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ'**
  String get date;

  /// No description provided for @filter.
  ///
  /// In ar, this message translates to:
  /// **'تصفية'**
  String get filter;

  /// No description provided for @hadiths.
  ///
  /// In ar, this message translates to:
  /// **'الأحاديث النبوية'**
  String get hadiths;

  /// No description provided for @ayahs.
  ///
  /// In ar, this message translates to:
  /// **'الآيات القرآنية'**
  String get ayahs;

  /// No description provided for @addAyahs.
  ///
  /// In ar, this message translates to:
  /// **'إضافة آيات قرآنية'**
  String get addAyahs;

  /// No description provided for @atharsOfSahaba.
  ///
  /// In ar, this message translates to:
  /// **'اثار الصحابة'**
  String get atharsOfSahaba;

  /// No description provided for @apply.
  ///
  /// In ar, this message translates to:
  /// **'تطبيق'**
  String get apply;

  /// No description provided for @noResult.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد نتائج'**
  String get noResult;

  /// No description provided for @quranicayahsurah.
  ///
  /// In ar, this message translates to:
  /// **'سورة الآية القرآنية'**
  String get quranicayahsurah;

  /// No description provided for @surahandnoayah.
  ///
  /// In ar, this message translates to:
  /// **'السورة و الآيات'**
  String get surahandnoayah;

  /// No description provided for @searchForAya.
  ///
  /// In ar, this message translates to:
  /// **'البحث عن آية'**
  String get searchForAya;

  /// No description provided for @selectAyahs.
  ///
  /// In ar, this message translates to:
  /// **'حدد الآية'**
  String get selectAyahs;

  /// No description provided for @confirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكد'**
  String get confirm;

  /// No description provided for @ayah.
  ///
  /// In ar, this message translates to:
  /// **'آية'**
  String get ayah;

  /// No description provided for @ayahAdded.
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة الايه بنجاح'**
  String get ayahAdded;

  /// No description provided for @quranicverse.
  ///
  /// In ar, this message translates to:
  /// **'آية قرآنية'**
  String get quranicverse;

  /// No description provided for @quranicversec.
  ///
  /// In ar, this message translates to:
  /// **'آية قرآنية'**
  String get quranicversec;

  /// No description provided for @quranicayahexp.
  ///
  /// In ar, this message translates to:
  /// **'تفسير الآيات'**
  String get quranicayahexp;

  /// No description provided for @numofayah.
  ///
  /// In ar, this message translates to:
  /// **'رقم الآية'**
  String get numofayah;

  /// No description provided for @alreadyExists.
  ///
  /// In ar, this message translates to:
  /// **'موجود بالفعل'**
  String get alreadyExists;

  /// No description provided for @tag.
  ///
  /// In ar, this message translates to:
  /// **'التبويب'**
  String get tag;

  /// No description provided for @delTags.
  ///
  /// In ar, this message translates to:
  /// **'مسح التبويب'**
  String get delTags;

  /// No description provided for @from.
  ///
  /// In ar, this message translates to:
  /// **'من'**
  String get from;

  /// No description provided for @to.
  ///
  /// In ar, this message translates to:
  /// **'إلي'**
  String get to;

  /// No description provided for @warning.
  ///
  /// In ar, this message translates to:
  /// **'تنبيه'**
  String get warning;

  /// No description provided for @edit.
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get edit;

  /// No description provided for @ayaExist.
  ///
  /// In ar, this message translates to:
  /// **'الأية موجودة بالفعل'**
  String get ayaExist;

  /// No description provided for @addDua.
  ///
  /// In ar, this message translates to:
  /// **'إضافة دعاء'**
  String get addDua;

  /// No description provided for @selectDuaTime.
  ///
  /// In ar, this message translates to:
  /// **'اختر توقيت الدعاء'**
  String get selectDuaTime;

  /// No description provided for @addNotes.
  ///
  /// In ar, this message translates to:
  /// **'أضف ملاحظاتك'**
  String get addNotes;

  /// No description provided for @additionalNotes.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات إضافية'**
  String get additionalNotes;

  /// No description provided for @numOfTimes.
  ///
  /// In ar, this message translates to:
  /// **'عدد المرات'**
  String get numOfTimes;

  /// No description provided for @numOfTimesANDpriority.
  ///
  /// In ar, this message translates to:
  /// **'التكرار و الأولوية'**
  String get numOfTimesANDpriority;

  /// No description provided for @morning.
  ///
  /// In ar, this message translates to:
  /// **'صباحاً'**
  String get morning;

  /// No description provided for @evening.
  ///
  /// In ar, this message translates to:
  /// **'مساءً'**
  String get evening;

  /// No description provided for @withoutTime.
  ///
  /// In ar, this message translates to:
  /// **'بدون توقيت'**
  String get withoutTime;

  /// No description provided for @forgiveness.
  ///
  /// In ar, this message translates to:
  /// **'المغفرة'**
  String get forgiveness;

  /// No description provided for @livelihood.
  ///
  /// In ar, this message translates to:
  /// **'الرزق'**
  String get livelihood;

  /// No description provided for @healing.
  ///
  /// In ar, this message translates to:
  /// **'الشفاء'**
  String get healing;

  /// No description provided for @reward.
  ///
  /// In ar, this message translates to:
  /// **'الأجر'**
  String get reward;

  /// No description provided for @important.
  ///
  /// In ar, this message translates to:
  /// **'مهم'**
  String get important;

  /// No description provided for @vImportant.
  ///
  /// In ar, this message translates to:
  /// **'مهم جدا'**
  String get vImportant;

  /// No description provided for @dua.
  ///
  /// In ar, this message translates to:
  /// **'الدعاء'**
  String get dua;

  /// No description provided for @duaAdded.
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة الدعاء'**
  String get duaAdded;

  /// No description provided for @filterOptions.
  ///
  /// In ar, this message translates to:
  /// **'خيارات التصفيه'**
  String get filterOptions;

  /// No description provided for @all.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get all;

  /// No description provided for @fav.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get fav;

  /// No description provided for @clear.
  ///
  /// In ar, this message translates to:
  /// **'مسح'**
  String get clear;

  /// No description provided for @share.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة'**
  String get share;

  /// No description provided for @copy.
  ///
  /// In ar, this message translates to:
  /// **'نسخ'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In ar, this message translates to:
  /// **'! تم نسخ النص'**
  String get copied;

  /// No description provided for @noDua.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد ادعية مضافة حتي الان'**
  String get noDua;

  /// No description provided for @aya.
  ///
  /// In ar, this message translates to:
  /// **'آية'**
  String get aya;

  /// No description provided for @daleelSayer.
  ///
  /// In ar, this message translates to:
  /// **'قائل الدليل'**
  String get daleelSayer;

  /// No description provided for @daleelExplain.
  ///
  /// In ar, this message translates to:
  /// **'شرح الدليل'**
  String get daleelExplain;

  /// No description provided for @daleelTags.
  ///
  /// In ar, this message translates to:
  /// **'تبويبات الدليل'**
  String get daleelTags;

  /// No description provided for @daleelPriority.
  ///
  /// In ar, this message translates to:
  /// **'أهمية الدليل'**
  String get daleelPriority;

  /// No description provided for @daleelDate.
  ///
  /// In ar, this message translates to:
  /// **'آخر تحديث'**
  String get daleelDate;

  /// No description provided for @daleelHadithAuth.
  ///
  /// In ar, this message translates to:
  /// **'صحة الحديث'**
  String get daleelHadithAuth;

  /// No description provided for @daleelDetails.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الدليل'**
  String get daleelDetails;

  /// No description provided for @wentWrong.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطا ما'**
  String get wentWrong;

  /// No description provided for @addAzkar.
  ///
  /// In ar, this message translates to:
  /// **'إضافة اذكار'**
  String get addAzkar;

  /// No description provided for @azkarAdded.
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة الذكر'**
  String get azkarAdded;

  /// No description provided for @azkarText.
  ///
  /// In ar, this message translates to:
  /// **'الذكر'**
  String get azkarText;

  /// No description provided for @azkarExplain.
  ///
  /// In ar, this message translates to:
  /// **'الشرح'**
  String get azkarExplain;

  /// No description provided for @azkarRepeat.
  ///
  /// In ar, this message translates to:
  /// **'عدد التكرار'**
  String get azkarRepeat;

  /// No description provided for @enterTextOfAzkar.
  ///
  /// In ar, this message translates to:
  /// **'ادخل نص الذكر'**
  String get enterTextOfAzkar;

  /// No description provided for @noAzkars.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد أذكار'**
  String get noAzkars;

  /// No description provided for @noDescription.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد شرح'**
  String get noDescription;

  /// No description provided for @repetition.
  ///
  /// In ar, this message translates to:
  /// **'التكرار'**
  String get repetition;

  /// No description provided for @editOfDaleel.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الدليل'**
  String get editOfDaleel;

  /// No description provided for @textOfDaleel.
  ///
  /// In ar, this message translates to:
  /// **'نص الدليل'**
  String get textOfDaleel;

  /// No description provided for @sayerOfDaleel.
  ///
  /// In ar, this message translates to:
  /// **'قائل الدليل'**
  String get sayerOfDaleel;

  /// No description provided for @explainOfDaleel.
  ///
  /// In ar, this message translates to:
  /// **'شرح الدليل'**
  String get explainOfDaleel;

  /// No description provided for @tagsOfDaleel.
  ///
  /// In ar, this message translates to:
  /// **'الكلمات المرجعية للدليل'**
  String get tagsOfDaleel;

  /// No description provided for @priorityOfDaleel.
  ///
  /// In ar, this message translates to:
  /// **'أهمية الدليل'**
  String get priorityOfDaleel;

  /// No description provided for @extractOfHadith.
  ///
  /// In ar, this message translates to:
  /// **'تخريج الحديث'**
  String get extractOfHadith;

  /// No description provided for @ruleOfHadith.
  ///
  /// In ar, this message translates to:
  /// **'حكم الحديث'**
  String get ruleOfHadith;

  /// No description provided for @update.
  ///
  /// In ar, this message translates to:
  /// **'تحديث'**
  String get update;

  /// No description provided for @hadithEditedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الحديث بنجاح'**
  String get hadithEditedSuccessf;

  /// No description provided for @atharAddedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم اضافة الاثر بنجاح'**
  String get atharAddedSuccessf;

  /// No description provided for @atharUpdatedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الاثر بنجاح'**
  String get atharUpdatedSuccessf;

  /// No description provided for @hadithUpdatedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الحديث بنجاح'**
  String get hadithUpdatedSuccessf;

  /// No description provided for @otherUpdatedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الأخرى بنجاح'**
  String get otherUpdatedSuccessf;

  /// No description provided for @otherAddedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم اضافة الأخرى بنجاح'**
  String get otherAddedSuccessf;

  /// No description provided for @ayahUpdatedSuccessf.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الأية بنجاح'**
  String get ayahUpdatedSuccessf;

  /// No description provided for @tags.
  ///
  /// In ar, this message translates to:
  /// **'التبويبات'**
  String get tags;

  /// No description provided for @editTags.
  ///
  /// In ar, this message translates to:
  /// **'تعديل التبويبات'**
  String get editTags;

  /// No description provided for @save.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @editTag.
  ///
  /// In ar, this message translates to:
  /// **'تعديل التبويب'**
  String get editTag;

  /// No description provided for @enterNewTagName.
  ///
  /// In ar, this message translates to:
  /// **'أدخل اسم التبويب الجديد'**
  String get enterNewTagName;

  /// No description provided for @duaTags.
  ///
  /// In ar, this message translates to:
  /// **'تبويبات الدعاء'**
  String get duaTags;

  /// No description provided for @editAzkar.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الذكر'**
  String get editAzkar;

  /// No description provided for @tagsOfAzkar.
  ///
  /// In ar, this message translates to:
  /// **'تبويبات الذكر'**
  String get tagsOfAzkar;

  /// No description provided for @azkarTags.
  ///
  /// In ar, this message translates to:
  /// **'تبويبات الأذكار'**
  String get azkarTags;

  /// No description provided for @noAvailableTags.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم العثور على نتائج'**
  String get noAvailableTags;

  /// No description provided for @revision.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة'**
  String get revision;

  /// No description provided for @reviewAgain.
  ///
  /// In ar, this message translates to:
  /// **'راجع مرة آخري'**
  String get reviewAgain;

  /// No description provided for @noData.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد أدلة للمراجعة'**
  String get noData;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
