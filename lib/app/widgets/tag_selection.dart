import 'package:athar/app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagSelectionWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<String> tags;
  final void Function(String tag) onAddTag;
  final void Function(String tag) onRemoveTag;
  final VoidCallback onClearTags;
  final String Function(String tag)? errorMessageBuilder;

  TagSelectionWidget({
    super.key,
    required this.tags,
    required this.onAddTag,
    required this.onRemoveTag,
    required this.onClearTags,
    this.errorMessageBuilder,
  });

  void _addTag(BuildContext context, String tag) {
    if (tag.isNotEmpty) {
      if (!tags.contains(tag)) {
        onAddTag(tag);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  errorMessageBuilder?.call(tag) ?? '$tag already exists')),
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
            hintText: context.l10n.addTags,
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
          children: tags.map((String tag) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: Theme.of(context).primaryColor,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '#$tag',
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    child: Icon(
                      Icons.cancel,
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    onTap: () => onRemoveTag(tag),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        TextButton(
          onPressed: onClearTags,
          child: Text(context.l10n.delTags),
        ),
      ],
    );
  }
}
