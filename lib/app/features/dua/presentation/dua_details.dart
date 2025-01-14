import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/presentation/bloc/dua_bloc.dart';
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

class DuaDetails extends StatefulWidget {
  const DuaDetails({required this.dua, super.key});

  final Dua dua;
  static const String name = 'dua-details';

  @override
  State<DuaDetails> createState() => _DuaDetailsState();
}

class _DuaDetailsState extends State<DuaDetails> {
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
                onTap: () => context.pop(),
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
                  widget.dua.text,
                  style: context.textThemeX.heading.copyWith(
                    fontSize: 28.sp,
                    fontFamily: GoogleFonts.amiriQuran().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    BlocBuilder<DuaBloc, DuaState>(
                      builder: (context, state) {
                        return _HeaderIcon(
                          icon: widget.dua.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: widget.dua.isFavorite
                              ? context.colorsX.primary
                              : context.colorsX.background,
                          onTap: () => context
                              .read<DuaBloc>()
                              .add(DuaAddToFavorite(widget.dua.id, widget.dua.isFavorite)),
                        );
                      },
                    ),
                    const _HeaderIcon(icon: Icons.delete),
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
              widget.dua.reward ?? '',
              style: context.textThemeX.medium.copyWith(fontSize: 18.sp),
            ),
          ),
          const Spacer(),
          _ShareAndCopyWidget(
            text: widget.dua.text,
          ),
          Gap(20.h)
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({required this.icon, this.onTap, this.color});

  final IconData icon;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Container(
          decoration: BoxDecoration(
            color: context.colorsX.onBackgroundTint35,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Icon(icon, size: 16.w, color: color ?? context.colorsX.background),
          ),
        ),
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
