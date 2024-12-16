import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SelectionBottomsheet<T> extends StatelessWidget {
  const SelectionBottomsheet(
      {required this.items,
      required this.builder,
      required this.onItemSelected,
      this.onReset,
      this.controller,
      super.key});
  final List<T> items;
  final Widget Function(T) builder;
  final void Function(T) onItemSelected;
  final void Function()? onReset;
  final ScrollController? controller;

  Future<T?> showSelectionBottomsheet(BuildContext context) async {
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          // initialChildSize: 0.30,
          minChildSize: 0.15,
          expand: false,
          builder: (context, scrollController) {
            return SelectionBottomsheet(
              items: items,
              builder: builder,
              onItemSelected: onItemSelected,
              controller: scrollController,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.keyboard_arrow_down),
            ),
            const Spacer(),
            if (onReset != null)
              TextButton(
                onPressed: onReset,
                child: const Text('Reset'),
              )
          ],
        ),
        Center(
          child: Text(
            'Filter by',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Gap(8),
        ...items.map(
          (item) => GestureDetector(
            onTap: () => onItemSelected(item),
            child: builder(item),
          ),
        ),
      ],
    );
  }
}

class SelectionBottomsheetItem extends StatelessWidget {
  const SelectionBottomsheetItem({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
        ),
        const Divider(),
      ],
    );
  }
}
