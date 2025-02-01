import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagSelectionWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final Set<Tag> tags;
  final void Function(Tag tag) onAddTag;
  final void Function(Tag tag) onRemoveTag;
  final VoidCallback onClearTags;
  final String Function(Tag tag)? errorMessageBuilder;

  TagSelectionWidget({
    required this.tags,
    required this.onAddTag,
    required this.onRemoveTag,
    required this.onClearTags,
    super.key,
    this.errorMessageBuilder,
  });

  void _addTag(BuildContext context, String tagName) {
    if (tagName.isNotEmpty) {
      final newTag = Tag(null, tagName);
      final updatedTags = {...tags}; // Create a new modifiable set

      if (updatedTags.add(newTag)) { // Now we modify a copy, not the original set
        onAddTag(newTag);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
            Text(errorMessageBuilder?.call(newTag) ?? '$tagName ${context.l10n.alreadyExists}'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            isDense: true,
            hintText: context.l10n.tag,
          ),
          onSubmitted: (value) {
            _addTag(context, value.trim());
            _controller.clear();
          },
        ),
        SizedBox(height: 8.h),
        Wrap(
          runSpacing: 4.h,
          spacing: 4.h,
          children: tags.map((Tag tag) {
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
                    onTap: () => onRemoveTag(tag),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        InkWell(
          onTap: onClearTags,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              context.l10n.delTags,
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
