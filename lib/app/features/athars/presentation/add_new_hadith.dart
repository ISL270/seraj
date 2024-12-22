part of 'athars_screen.dart';

class AddNewHadith extends StatelessWidget {
  const AddNewHadith({super.key});

  static const String name = 'addNewHadith';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => context.pop(),
                                child: Icon(Icons.keyboard_arrow_right_outlined, size: 32.w),
                              ),
                              const Spacer(),
                              Text(
                                '${context.l10n.add} ${context.l10n.prophetichadith}',
                                style: context.textThemeX.heading.bold,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                          const Gap(50),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${context.l10n.title} ${context.l10n.prophetichadithc}',
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          const Gap(15),
                          TextField(
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintMaxLines: 2,
                              labelStyle: context.textThemeX.medium,
                              alignLabelWithHint: true,
                              label: Text('${context.l10n.title} ${context.l10n.prophetichadithc}'),
                            ),
                          ),
                          const Gap(20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.hadithdesc,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          const Gap(15),
                          TextField(
                            maxLines: 5,
                            minLines: 3,
                            decoration: InputDecoration(
                              labelStyle: context.textThemeX.medium,
                              alignLabelWithHint: true,
                              label: Text(context.l10n.hadithdesc),
                            ),
                          ),
                          const Gap(15),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.hadithtype,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    ),
                    const _HadithSelectionListViewBuilder(),
                    const Gap(10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Button.filled(
                label: context.l10n.add,
                maxWidth: true,
                onPressed: () {},
              ),
            ),
            const Gap(5)
          ],
        ),
      ),
    );
  }
}
