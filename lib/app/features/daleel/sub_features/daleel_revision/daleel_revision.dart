// ignore_for_file: deprecated_member_use, avoid_field_initializers_in_const_classes

import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_revision/cubit/daleel_revision_cubit.dart';
import 'package:athar/app/features/daleel/sub_features/daleel_revision/cubit/daleel_revision_state.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DaleelRevisionScreen extends StatefulWidget {
  static const String name = 'daleel-revision';

  const DaleelRevisionScreen({super.key});

  @override
  State<DaleelRevisionScreen> createState() => _DaleelRevisionScreenState();
}

class _DaleelRevisionScreenState extends State<DaleelRevisionScreen> {
  late final DaleelRevisionCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<DaleelRevisionCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaleelRevisionCubit, DaleelRevisionState>(
      builder: (context, state) {
        final daleels = state.daleels;
        return Screen(
          appBar: AppBar(
            leading: const BackButton(),
            centerTitle: true,
            title: Text(
              context.l10n.revision.capitalizedDefinite,
              style: context.textThemeX.heading.bold,
            ),
          ),
          body: state.daleels.isEmpty
              ? Center(
                  child: Text(
                    context.l10n.noAvailableDaleelsToRev,
                    style: context.textThemeX.medium.bold,
                  ),
                )
              : BlocBuilder<DaleelRevisionCubit, DaleelRevisionState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CardSwiper(
                            controller: _cubit.cardSwiperController,
                            cardsCount: state.daleels.length,
                            numberOfCardsDisplayed: state.daleels.length <= 2 ? 1 : 3,
                            backCardOffset: const Offset(35, 40),
                            padding: EdgeInsets.all(24.sp),
                            onSwipe: (previousIndex, currentIndex, direction) {
                              if (currentIndex != null && currentIndex < daleels.length) {
                                _cubit.currentIndex = currentIndex;
                              }

                              return true;
                            },
                            cardBuilder: (innerContext, index, _, __) {
                              return Container(
                                height: 700.h,
                                width: 500.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 32.sp, vertical: 16.sp),
                                      child: Text(
                                        daleels[index].text,
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
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                heroTag: 'left',
                                backgroundColor: context.colorsX.primary,
                                onPressed: () {
                                  if (_cubit.currentIndex < daleels.length) {
                                    context
                                        .read<DaleelRevisionCubit>()
                                        .incrementRevisionCount(daleels[_cubit.currentIndex].id!);
                                    context
                                        .read<DaleelRevisionCubit>()
                                        .cardSwiperController
                                        .swipe(CardSwiperDirection.left);
                                  }
                                },
                                child:
                                    Icon(FontAwesomeIcons.check, color: context.colorsX.background),
                              ),
                              FloatingActionButton(
                                heroTag: 'down',
                                backgroundColor: context.colorsX.error,
                                onPressed: () {
                                  context
                                      .read<DaleelRevisionCubit>()
                                      .cardSwiperController
                                      .swipe(CardSwiperDirection.bottom);
                                },
                                child:
                                    Icon(FontAwesomeIcons.close, color: context.colorsX.background),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
