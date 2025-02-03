import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/injection/injection.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/settings/sub_features/tags_details/domain/tags_repository.dart';
import 'package:athar/app/features/settings/sub_features/tags_details/presentation/cubit/tags_cubit.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({super.key});

  static const name = 'tags-screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TagsCubit(getIt.get<TagsRepository>()),
      child: DefaultTabController(
        length: 2,
        child: Screen(
          padding: EdgeInsets.zero,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'التبويبات',
              style: context.textThemeX.heading.bold,
            ),
            bottom: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              indicatorColor: context.colorsX.primary,
              labelColor: context.colorsX.primary,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'تبويبات الدليل'),
                Tab(text: 'تبويبات الدعاء'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              _DaleelTagsWidget(),
              _DuaTagsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaleelTagsWidget extends StatefulWidget {
  const _DaleelTagsWidget();

  @override
  State<_DaleelTagsWidget> createState() => _DaleelTagsWidgetState();
}

class _DaleelTagsWidgetState extends State<_DaleelTagsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<TagsCubit>().loadTags(isDaleel: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _SearchBarWidget(isDaleel: true),
        Expanded(child: _TagListWidget(isDaleel: true)),
      ],
    );
  }
}

class _DuaTagsWidget extends StatefulWidget {
  const _DuaTagsWidget();

  @override
  State<_DuaTagsWidget> createState() => _DuaTagsWidgetState();
}

class _DuaTagsWidgetState extends State<_DuaTagsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<TagsCubit>().loadTags(isDaleel: false);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _SearchBarWidget(isDaleel: false),
        Expanded(child: _TagListWidget(isDaleel: false)),
      ],
    );
  }
}

class _SearchBarWidget extends StatelessWidget {
  final bool isDaleel;

  const _SearchBarWidget({required this.isDaleel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: BlocBuilder<TagsCubit, TagsState>(
        builder: (context, state) {
          return TextField(
            controller: context.read<TagsCubit>().searchController,
            decoration: InputDecoration(
              isDense: true,
              hintText: context.l10n.search,
              prefixIcon: Icon(Icons.search, color: context.colorsX.onBackground),
              suffixIcon: state.searchQuery.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.cancel, color: context.colorsX.error),
                      onPressed: () => context.read<TagsCubit>().clearSearch(isDaleel: isDaleel),
                    )
                  : null,
            ),
            onChanged: (value) => context.read<TagsCubit>().searchTags(value, isDaleel: isDaleel),
          );
        },
      ),
    );
  }
}

class _TagListWidget extends StatelessWidget {
  final bool isDaleel;

  const _TagListWidget({required this.isDaleel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagsCubit, TagsState>(
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (_, __) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Divider(height: 1.h, color: context.colorsX.onBackgroundTint35),
          ),
          itemCount: state.filteredTags.length,
          itemBuilder: (context, index) => _TagWidget(tag: state.filteredTags[index]),
        );
      },
    );
  }
}

class _TagWidget extends StatelessWidget {
  final Tag tag;

  const _TagWidget({required this.tag});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Text(
          tag.name,
          style: context.textThemeX.large.copyWith(
            fontSize: 22.sp,
            fontFamily: GoogleFonts.amiriQuran().fontFamily,
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => _showEditDialog(context, tag),
            child: _CircularIconWidget(Icons.edit, context.colorsX.primary),
          ),
          Gap(10.w),
          _CircularIconWidget(Icons.delete, context.colorsX.error),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, Tag tag) {
    final controller = TextEditingController(text: tag.name);
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: context.colorsX.background,
          backgroundColor: context.colorsX.background,
          title: const Text('تعديل التبويب'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                // Handle updating the tag
                Navigator.pop(context);
              },
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }
}

class _CircularIconWidget extends StatelessWidget {
  final IconData iconData;
  final Color color;

  const _CircularIconWidget(this.iconData, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.all(7.r),
        child: Icon(
          iconData,
          size: 20.sp,
          color: context.colorsX.background,
        ),
      ),
    );
  }
}
