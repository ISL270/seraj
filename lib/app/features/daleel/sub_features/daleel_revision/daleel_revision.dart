// ignore_for_file: deprecated_member_use

import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DaleelRevisionScreen extends StatefulWidget {
  const DaleelRevisionScreen({super.key});

  static const String name = 'daleel-revision';

  @override
  State<DaleelRevisionScreen> createState() => _DaleelRevisionScreenState();
}

class _DaleelRevisionScreenState extends State<DaleelRevisionScreen> {
  final CardSwiperController controller = CardSwiperController();

  final List<String> cards = [
    '1',
    '2',
    'الٓرۚ تِلۡكَ ءَايَٰتُ ٱلۡكِتَٰبِ ٱلۡمُبِينِ (1) إِنَّآ أَنزَلۡنَٰهُ قُرۡءَٰنًا عَرَبِيّٗا لَّعَلَّكُمۡ تَعۡقِلُونَ (2) نَحۡنُ نَقُصُّ عَلَيۡكَ أَحۡسَنَ ٱلۡقَصَصِ بِمَآ أَوۡحَيۡنَآ إِلَيۡكَ هَٰذَا ٱلۡقُرۡءَانَ وَإِن كُنتَ مِن قَبۡلِهِۦ لَمِنَ ٱلۡغَٰفِلِينَ (3) إِذۡ قَالَ يُوسُفُ لِأَبِيهِ يَٰٓأَبَتِ إِنِّي رَأَيۡتُ أَحَدَ عَشَرَ كَوۡكَبٗا وَٱلشَّمۡسَ وَٱلۡقَمَرَ رَأَيۡتُهُمۡ لِي سَٰجِدِينَ (4) قَالَ يَٰبُنَيَّ لَا تَقۡصُصۡ رُءۡيَاكَ عَلَىٰٓ إِخۡوَتِكَ فَيَكِيدُواْ لَكَ كَيۡدًاۖ إِنَّ ٱلشَّيۡطَٰنَ لِلۡإِنسَٰنِ عَدُوّٞ مُّبِينٞ (5) وَكَذَٰلِكَ يَجۡتَبِيكَ رَبُّكَ وَيُعَلِّمُكَ مِن تَأۡوِيلِ ٱلۡأَحَادِيثِ وَيُتِمُّ نِعۡمَتَهُۥ عَلَيۡكَ وَعَلَىٰٓ ءَالِ يَعۡقُوبَ كَمَآ أَتَمَّهَا عَلَىٰٓ أَبَوَيۡكَ مِن قَبۡلُ إِبۡرَٰهِيمَ وَإِسۡحَٰقَۚ إِنَّ رَبَّكَ عَلِيمٌ حَكِيمٞ (6) ۞لَّقَدۡ كَانَ فِي يُوسُفَ وَإِخۡوَتِهِۦٓ ءَايَٰتٞ لِّلسَّآئِلِينَ (7) إِذۡ قَالُواْ لَيُوسُفُ وَأَخُوهُ أَحَبُّ إِلَىٰٓ أَبِينَا مِنَّا وَنَحۡنُ عُصۡبَةٌ إِنَّ أَبَانَا لَفِي ضَلَٰلٖ مُّبِينٍ (8) ٱقۡتُلُواْ يُوسُفَ أَوِ ٱطۡرَحُوهُ أَرۡضٗا يَخۡلُ لَكُمۡ وَجۡهُ أَبِيكُمۡ وَتَكُونُواْ مِنۢ بَعۡدِهِۦ قَوۡمٗا صَٰلِحِينَ (9)',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text('المراجعة', style: context.textThemeX.heading.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(35, 40),
              padding: const EdgeInsets.all(24),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) =>
                  Container(
                height: 700.h,
                width: 500.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.colorsX.primary,
                  boxShadow: [
                    BoxShadow(
                      color: context.colorsX.background,
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Text(
                        cards[index],
                        style: context.textThemeX.heading.copyWith(
                          fontSize: 24.sp,
                          fontFamily: GoogleFonts.amiri().fontFamily,
                          color: context.colorsX.background,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'left',
                  backgroundColor: context.colorsX.primary,
                  onPressed: () => controller.swipe(CardSwiperDirection.left),
                  child: Icon(FontAwesomeIcons.check, color: context.colorsX.onBackground),
                ),
                FloatingActionButton(
                  heroTag: 'right',
                  backgroundColor: context.colorsX.error,
                  onPressed: () => controller.swipe(CardSwiperDirection.bottom),
                  child: Icon(FontAwesomeIcons.close, color: context.colorsX.onBackground),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
