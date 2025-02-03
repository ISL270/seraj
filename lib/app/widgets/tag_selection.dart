import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagSelectionWidget extends StatefulWidget {
  final Set<Tag> tags;
  final void Function(Tag tag) onAddTag;
  final void Function(Tag tag) onRemoveTag;
  final VoidCallback onClearTags;
  final String Function(Tag tag)? errorMessageBuilder;
  final List<Tag> availableTags;

  const TagSelectionWidget({
    required this.tags,
    required this.onAddTag,
    required this.onRemoveTag,
    required this.onClearTags,
    required this.availableTags,
    this.errorMessageBuilder,
    super.key,
  });

  @override
  State<TagSelectionWidget> createState() => _TagSelectionWidgetState();
}

class _TagSelectionWidgetState extends State<TagSelectionWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String searchQuery = '';

  void _addTag(BuildContext context, String tagName) {
    if (tagName.isNotEmpty) {
      final newTag = Tag(null, tagName);

      if (widget.tags.any((tag) => tag.name.toLowerCase() == tagName.toLowerCase())) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.errorMessageBuilder?.call(newTag) ??
                '$tagName ${context.l10n.alreadyExists}'),
          ),
        );
      } else {
        widget.onAddTag(newTag);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredTags = widget.availableTags
        .where((tag) => tag.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search input
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            isDense: true,
            hintText: context.l10n.tags,
          ),
          onChanged: (value) {
            setState(() {
              searchQuery = value.trim();
            });
          },
          onSubmitted: (value) {
            _addTag(context, value.trim());
            _controller.clear();
          },
        ),
        SizedBox(height: 8.h),

        // Suggestions (above the list of selected tags)
        if (searchQuery.isNotEmpty) ...[
          Wrap(
            spacing: 8.w,
            runSpacing: 4.h,
            children: filteredTags.map((tag) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                  color: context.colorsX.secondary, // Light background for suggestions
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: GestureDetector(
                  onTap: () {
                    _addTag(context, tag.name);
                    _controller.clear();
                    setState(() {
                      searchQuery = '';
                    });
                  },
                  child: Text(
                    '#${tag.name}',
                    style: TextStyle(
                      color: context.colorsX.background, // Text color
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],

        SizedBox(height: 8.h),

        // Selected tags list
        Wrap(
          runSpacing: 4.h,
          spacing: 4.h,
          children: widget.tags.map((Tag tag) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                color: context.colorsX.primary,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '#${tag.name}',
                    style: TextStyle(color: context.colorsX.background),
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    child: Icon(
                      Icons.cancel,
                      size: 14.sp,
                      color: context.colorsX.background,
                    ),
                    onTap: () => widget.onRemoveTag(tag),
                  ),
                ],
              ),
            );
          }).toList(),
        ),

        // Clear Tags button
        InkWell(
          onTap: widget.onClearTags,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              context.l10n.clear,
              style: context.textThemeX.medium.bold.copyWith(
                color: context.colorsX.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
