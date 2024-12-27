part of '../athars_screen.dart';

Future<void> _openBottomSheet(BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showModalBottomSheet(
    elevation: 0,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: context.colorsX.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.h),
            topRight: Radius.circular(24.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.w, bottom: 15.w, right: 10.w),
          child: _BottomSheetBody(
            items: [
              context.l10n.prophetichadith,
              context.l10n.quranicverse,
              context.l10n.others
            ],
          ),
        ),
      );
    },
  );
}

class _BottomSheetBody extends StatelessWidget {
  const _BottomSheetBody({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DragIndicator(),
        Gap(10.h),
        Text(context.l10n.addnew, style: context.textThemeX.large.bold),
        Gap(20.h),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) => const Gap(15),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    context.pushNamed(AddNewHadith.name);
                  case 1:
                    context.pushNamed(AddNewAyah.name);
                }
              },
              child: _BottomSheetWidget(items[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomSheetWidget extends StatelessWidget {
  const _BottomSheetWidget(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: context.colorsX.onBackgroundTint35,
      ),
      child: Center(child: Text(label, style: context.textThemeX.medium.bold)),
    );
  }
}

class _DragIndicator extends StatelessWidget {
  const _DragIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 6.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: context.colorsX.onBackground,
          borderRadius: BorderRadius.circular(32.w),
        ),
      ),
    );
  }
}
