import 'package:athar/app/core/extension_methods/bloc_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/presentation/dua_details/bloc/dua_details_bloc.dart';
import 'package:athar/app/features/settings/domain/settings.dart';
import 'package:athar/app/features/settings/settings/settings_bloc.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class DuaDetailsScreen extends StatelessWidget {
  const DuaDetailsScreen(this.dua, {super.key});

  final Dua dua;

  static const name = 'dua-details';

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10.h),
          Row(
            children: [
              GestureDetector(
                onTap: context.pop,
                child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
              ),
              const Spacer(flex: 2),
              Text(
                context.l10n.dua,
                style: context.textThemeX.heading.bold,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
            ],
          ),
          Gap(20.h),
          Container(
            height: 300.h,
            decoration: BoxDecoration(
              color: context.colorsX.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16.sp),
              boxShadow: [
                BoxShadow(
                  color: context.colorsX.primary.withValues(alpha: 0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                Text(
                  dua.text,
                  style: context.textThemeX.heading.copyWith(
                    fontSize: 28.sp,
                    fontFamily: GoogleFonts.amiriQuran().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    BlocSelector<DuaDetailsBloc, DuaState, bool>(
                      selector: (state) => state.data!.isFavourite,
                      builder: (context, isFavourite) => IconButton(
                        onPressed: () =>
                            context.read<DuaDetailsBloc>().add(const DuaFavouriteToggled()),
                        icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
                      ),
                    ),
                    BlocConsumer<DuaDetailsBloc, DuaState>(
                      builder: (context, state) => IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => context.read<DuaDetailsBloc>().add(const DuaDeleted()),
                      ),
                      listener: (context, state) {
                        if (state.isSuccess && state.data == null) {
                          context.pop();
                        }
                      },
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          Gap(25.h),
          ExpandablePanel(
            theme: ExpandableThemeData(
              hasIcon: true,
              expandIcon: Icons.expand_more,
              collapseIcon: Icons.expand_less,
              iconSize: 24.w,
            ),
            header: Text(
              context.l10n.reward,
              style: context.textThemeX.heading.bold.copyWith(fontSize: 20.sp),
            ),
            collapsed: const SizedBox(),
            expanded: Text(
              dua.reward ?? '',
              style: context.textThemeX.medium.copyWith(fontSize: 18.sp),
              textDirection: context.settingsBloc.state.settings.isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
          const Spacer(),
          _ShareAndCopyWidget(text: dua.text),
          Gap(20.h)
        ],
      ),
    );
  }
}

class _ShareAndCopyWidget extends StatelessWidget {
  final String text;

  const _ShareAndCopyWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: context.colorsX.primary.withValues(alpha: 0.5),
          ),
          onPressed: () => Share.share(text),
          icon: Icon(Icons.share, color: context.colorsX.onBackground),
          label: Text(
            context.l10n.share,
            style: context.textThemeX.medium.copyWith(color: context.colorsX.onBackground),
          ),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: context.colorsX.primary.withValues(alpha: 0.5),
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: text));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l10n.copied)),
            );
          },
          icon: Icon(Icons.copy, color: context.colorsX.onBackground),
          label: Text(
            context.l10n.copy,
            style: context.textThemeX.medium.copyWith(color: context.colorsX.onBackground),
          ),
        ),
      ],
    );
  }
}
