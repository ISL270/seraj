// ignore_for_file: deprecated_member_use_from_same_package, inference_failure_on_function_invocation, dead_code

import 'package:athar/app/core/assets_gen/assets.gen.dart';
import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/extension_methods/string_x.dart';
import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/add_dua/presentation/add_dua_screen.dart';
import 'package:athar/app/features/dua/presentation/bloc/dua_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

part 'widgets/dua_widget.dart';
part 'widgets/duas_listview.dart';

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});

  static const String name = 'duas';

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
        appBar: SuperAppBar(
          largeTitle: SuperLargeTitle(
            largeTitle: context.l10n.duas.capitalizedDefinite,
            textStyle: context.textThemeX.large.bold.copyWith(fontSize: 32.w),
            actions: [
              GestureDetector(
                onTap: () => context.pushNamed(AddDuaScreen.name),
                child: Assets.icons.plusSquaredOutlined.svg(
                  width: 34.w,
                  height: 34.w,
                  color: context.colorsX.primary,
                ),
              ),
            ],
          ),
          title: Text(
            context.l10n.duas.capitalizedDefinite,
            style: context.textThemeX.large.bold.copyWith(color: context.colorsX.onBackground),
          ),
          backgroundColor: context.colorsX.background,
          searchBar: SuperSearchBar(
            onChanged: (query) => context.read<DuaBloc>().add(DuaSearched(query)),
            placeholderText: context.l10n.search.capitalizedDefinite,
          ),
        ),
        body: const _DuasListView());
  }
}

class _FavoriteIconButton extends StatefulWidget {
  const _FavoriteIconButton();

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<_FavoriteIconButton> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() {
        _isFavorited = !_isFavorited;
      }),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Icon(
          _isFavorited ? Icons.favorite : Icons.favorite_border,
          key: ValueKey<bool>(_isFavorited),
          color: _isFavorited ? context.colorsX.error : context.colorsX.onBackground,
        ),
      ),
    );
  }
}
