import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:athar/app/features/settings/sub_features/tags_details/presentation/cubit/tags_cubit.dart';
import 'package:athar/app/widgets/button.dart';
import 'package:athar/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({super.key});

  static const name = 'tags-screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Screen(
        padding: EdgeInsets.zero,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.l10n.tags,
            style: context.textThemeX.heading.bold,
          ),
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            // Disable TabBar scrolling
            indicatorColor: context.colorsX.primary,
            labelColor: context.colorsX.primary,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              context.read<TagsCubit>().switchTab(index == 0);
            },
            tabs: [
              Tab(text: context.l10n.daleelTags),
              Tab(text: context.l10n.duaTags),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(), // Disable TabBarView scrolling
          children: [
            _DaleelTagsWidget(),
            _DuaTagsWidget(),
          ],
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
    context.read<TagsCubit>().loadTags();
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
    context.read<TagsCubit>().loadTags();
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
                      onPressed: () => context.read<TagsCubit>().clearSearch(),
                    )
                  : null,
            ),
            onChanged: (value) => context.read<TagsCubit>().searchTags(value),
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
          _CircularIconWidget(
            Icons.edit,
            context.colorsX.primary,
            () => _showEditDialog(context, tag),
          ),
          Gap(10.w),
          _CircularIconWidget(
            Icons.delete,
            context.colorsX.error,
            () => context.read<TagsCubit>().deleteTag(id: tag.id ?? 0),
          ),
        ],
      ),
    );
  }
}

class _CircularIconWidget extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final void Function()? onTap;

  const _CircularIconWidget(this.iconData, this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}

void _showEditDialog(BuildContext context, Tag tag) {
  final controller = TextEditingController(text: tag.name);
  final tagsCubit = context.read<TagsCubit>();

  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: context.colorsX.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          context.l10n.editTags,
          style: context.textThemeX.heading.bold,
        ),
        content: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: context.l10n.enterNewTagName,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        actions: [
          // Cancel Button
          TextButton(
            onPressed: () => context.pop(dialogContext),
            child: Text(context.l10n.cancel),
          ),
          Button.filled(
            height: 20.h,
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                tagsCubit.updateTags(
                  id: tag.id ?? 0,
                  newTag: controller.text.trim(),
                );
              }
              context.pop();
            },
            label: context.l10n.save,
          ),
        ],
      );
    },
  );
}
