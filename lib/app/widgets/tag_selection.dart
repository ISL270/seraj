import 'package:athar/app/core/extension_methods/text_style_x.dart';
import 'package:athar/app/core/l10n/l10n.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_tags/textfield_tags.dart';

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
  late TextfieldTagsController<Tag> _tagController;

  @override
  void initState() {
    super.initState();
    _tagController = TextfieldTagsController<Tag>();
  }

  @override
  void dispose() {
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tag Input with AutoComplete
        Autocomplete<Tag>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<Tag>.empty();
            }
            return widget.availableTags.where(
                (tag) => tag.name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFieldTags<Tag>(
              textfieldTagsController: _tagController,
              textEditingController: textEditingController,
              focusNode: focusNode,
              textSeparators: const [' ', ','],
              validator: (Tag tag) {
                if (widget.tags.any((t) => t.name.toLowerCase() == tag.name.toLowerCase())) {
                  return widget.errorMessageBuilder?.call(tag) ??
                      '${tag.name} ${context.l10n.alreadyExists}';
                }
                return null;
              },
              inputFieldBuilder: (context, inputFieldValues) {
                return TextField(
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: context.l10n.tags,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.colorsX.primary,
                        width: 2.w,
                      ),
                    ),
                    errorText: inputFieldValues.error,
                  ),
                  onChanged: (value) {
                    final tag = Tag(null, value);
                    inputFieldValues.onTagChanged(tag);
                  },
                  onSubmitted: (value) {
                    final trimmedValue = value.trim();
                    if (trimmedValue.isEmpty) return;
                    if (widget.tags
                        .any((t) => t.name.toLowerCase() == trimmedValue.toLowerCase())) {
                      return;
                    }
                    final existingTag = widget.availableTags.firstWhere(
                      (tag) => tag.name.toLowerCase() == trimmedValue.toLowerCase(),
                      orElse: () => Tag(null, trimmedValue),
                    );
                    if (!_tagController.getTags!.contains(existingTag)) {
                      _tagController.onTagSubmitted(existingTag);
                      widget.onAddTag(existingTag);
                    }
                    textEditingController.clear();
                  },
                );
              },
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorsX.background,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorsX.onBackgroundTint
                          .withValues(alpha: 0.1), // Light shadow color
                      blurRadius: 8, // Blur intensity
                      spreadRadius: 2, // Spread size
                      offset: const Offset(0, 4), // Vertical shadow position
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final tag = options.elementAt(index);
                    return ListTile(
                      leading: Icon(Icons.tag, color: context.colorsX.primary),
                      title: Text(tag.name, style: TextStyle(color: context.colorsX.primary)),
                      onTap: () => onSelected(tag),
                    );
                  },
                ),
              ),
            );
          },
          onSelected: (Tag tag) {
            _tagController.onTagSubmitted(tag);
            widget.onAddTag(tag);
          },
        ),

        SizedBox(height: 8.h),

        // Selected Tags Display
        Wrap(
          runSpacing: 4.h,
          spacing: 4.h,
          children: _tagController.getTags?.map((Tag tag) {
                return Chip(
                  label: Text('#${tag.name}'),
                  backgroundColor: context.colorsX.primary,
                  labelStyle: TextStyle(color: context.colorsX.background),
                  onDeleted: () {
                    _tagController.onTagRemoved(tag);
                    widget.onRemoveTag(tag);
                  },
                );
              }).toList() ??
              [],
        ),

        SizedBox(height: 8.h),

        // Clear Tags Button
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              _tagController.clearTags();
              widget.onClearTags();
            },
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
