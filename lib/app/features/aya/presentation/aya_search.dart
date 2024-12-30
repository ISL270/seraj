import 'package:athar/app/core/extension_methods/english_x.dart';
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
                              title: Text(ayah.ayah.replaceAll('\n', ' ')),
                              subtitle: Text(ayah.surahNameAr),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.h),
                              onTap: () => context.pushNamed(
                                AddNewAyah.name,
                                extra: ayah,
                              ),
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
}
