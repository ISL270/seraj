import 'package:athar/app/core/extension_methods/english_x.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/aya/presentation/add_new_ayah.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quran/flutter_quran.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AyaSearch extends StatefulWidget {
  const AyaSearch({super.key});

  static const String name = 'aya-search';

  @override
  State<AyaSearch> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<AyaSearch> {
  List<Ayah> ayahs = [];

  @override
  void initState() {
    FlutterQuran().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Screen(
        appBar: AppBar(
          title: Text(
            context.l10n.searchForAya.capitalized,
            style: context.textThemeX.heading.bold,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              TextField(
                onChanged: (txt) {
                  final ayahsList = FlutterQuran().search(txt);
                  setState(() {
                    ayahs = [...ayahsList];
                  });
                },
                decoration: InputDecoration(
                  hintText: context.l10n.search,
                ),
              ),
              Expanded(
                child: ListView(
                  children: ayahs
                      .map(
                        (ayah) => Column(
                          children: [
                            ListTile(
                              title: Text(
                                ayah.ayah
                                    .replaceAll('\n', ' ')
                                    .decorateArabicNumbers(),
                                style: context.textThemeX.large.copyWith(
                                  fontSize: 18.sp,
                                  fontFamily:
                                      GoogleFonts.amiriQuran().fontFamily,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 16.h),
                                  child: Text(
                                    '${ayah.surahNameAr} '
                                    '${ayah.ayahNumber.toString().decorateArabicNumbers()}',
                                    style: context.textThemeX.small.copyWith(
                                      color: context.colorsX.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.h),
                              onTap: () =>
                                  _showSurahSelectionDialog(context, ayah),
                            ),
                            Divider(
                              color: context.colorsX.onBackgroundTint35,
                              thickness: 1,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSurahSelectionDialog(
      BuildContext context, Ayah initialAyah) async {
    final surahAyahs =
        FlutterQuran().getSurah(initialAyah.surahNumber).ayahs.getRange(
              initialAyah.ayahNumber - 1,
              initialAyah.ayahNumber + 2,
            );
    final selectedAyahs = <Ayah>[];

    await showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              surfaceTintColor: context.colorsX.background,
              backgroundColor: context.colorsX.background,
              title: Text(context.l10n.selectAyahs),
              content: SingleChildScrollView(
                child: Column(
                  children: surahAyahs.map((ayah) {
                    final isSelected = selectedAyahs.contains(ayah);
                    return CheckboxListTile(
                      activeColor: context.colorsX.primary,
                      value: isSelected,
                      onChanged: (bool? value) {
                        if (selectedAyahs.length < 3) {
                          if (selectedAyahs.isEmpty ||
                              ayah.ayahNumber ==
                                  selectedAyahs.last.ayahNumber + 1) {
                            setState(() {
                              selectedAyahs.add(ayah);
                            });
                          }
                        } else if (value == false) {
                          setState(() {
                            selectedAyahs.remove(ayah);
                          });
                        }
                      },
                      title: Text(ayah.ayah.replaceAll('\n', ' '),
                          style: context.textThemeX.large.copyWith(
                            fontFamily: GoogleFonts.amiriQuran().fontFamily,
                          )),
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(context.l10n.cancel),
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                    _navigateToAddNewAyah(context,
                        selectedAyahs.isEmpty ? [initialAyah] : selectedAyahs);
                  },
                  child: Text(context.l10n.confirm),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _navigateToAddNewAyah(BuildContext context, List<Ayah> ayahs) {
    context.pushNamed(
      AddNewAyah.name,
      extra: ayahs,
    );
  }
}
