// ignore_for_file: deprecated_member_use, avoid_field_initializers_in_const_classes

import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_revision/cubit/daleel_revision_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_revision/cubit/daleel_revision_state.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DaleelRevisionScreen extends StatelessWidget {
  static const String name = 'daleel-revision';

  const DaleelRevisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          context.l10n.revision.capitalizedDefinite,
          style: context.textThemeX.heading.bold,
        ),
      ),
      body: BlocBuilder<DaleelRevisionCubit, DaleelRevisionState>(
        builder: (context, state) {
          if (state.daleels.isEmpty) {
            return Center(child: Text(context.l10n.noData));
          } else {
            return DaleelRevisionContent(daleels: state.daleels);
          }
        },
      ),
    );
  }
}

class DaleelRevisionContent extends StatelessWidget {
  const DaleelRevisionContent({
    required this.daleels,
    super.key,
  });

  final List<dynamic> daleels;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: DaleelCardSwiper(daleels: daleels),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: DaleelActionButtons(),
        ),
      ],
    );
  }
}

class DaleelCardSwiper extends StatelessWidget {
  const DaleelCardSwiper({
    required this.daleels,
    super.key,
  });

  final List<dynamic> daleels;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DaleelRevisionCubit>();
    return BlocBuilder<DaleelRevisionCubit, DaleelRevisionState>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state.showReviewButton,
          child: CardSwiper(
            controller: cubit.cardSwiperController,
            cardsCount: daleels.length,
            numberOfCardsDisplayed: daleels.length <= 2 ? 1 : 3,
            backCardOffset: const Offset(35, 40),
            padding: EdgeInsets.all(24.sp),
            onSwipe: (previousIndex, currentIndex, direction) {
              if (currentIndex != null && currentIndex < daleels.length) {
                cubit.updateCurrentIndex(currentIndex);
              }
              return true;
            },
            onEnd: () {
              cubit.setShowReviewButton(true);
            },
            cardBuilder: (context, index, _, __) {
              return Container(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.sp, vertical: 16.sp),
                      child: Text(
                        state.daleels[index].text,
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
              );
            },
          ),
        );
      },
    );
  }
}

class DaleelActionButtons extends StatelessWidget {
  const DaleelActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaleelRevisionCubit, DaleelRevisionState>(
      builder: (context, state) {
        final cubit = context.read<DaleelRevisionCubit>();
        return state.showReviewButton
            ? Button.filled(
                onPressed: () {
                  cubit
                    ..initalizeDaleelRevision()
                    ..setShowReviewButton(false);
                },
                label: context.l10n.reviewAgain,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'left',
                    backgroundColor: context.colorsX.primary,
                    onPressed: () {
                      if (state.currentIndex < state.daleels.length) {
                        cubit.incrementRevisionCount(
                            state.daleels[state.currentIndex].id!);
                        cubit.cardSwiperController
                            .swipe(CardSwiperDirection.left);
                      }
                    },
                    child: Icon(FontAwesomeIcons.check,
                        color: context.colorsX.background),
                  ),
                  FloatingActionButton(
                    heroTag: 'down',
                    backgroundColor: context.colorsX.error,
                    onPressed: () {
                      cubit.cardSwiperController
                          .swipe(CardSwiperDirection.bottom);
                    },
                    child: Icon(
                      FontAwesomeIcons.close,
                      color: context.colorsX.background,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
