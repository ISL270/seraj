part of 'athars_screen.dart';

class AddNewAyah extends StatelessWidget {
  const AddNewAyah({super.key});

  static const String name = 'addNewAyah';

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
                                '${context.l10n.add} ${context.l10n.quranicverse}',
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
                              context.l10n.surahandnoayah,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          const Gap(20),
                          const _SurahAndVerseNumTextField(),
                          const Gap(20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.quranicversec,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          const Gap(20),
                          const _QuranicVerseTextField(),
                          const Gap(20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.l10n.quranicayahexp,
                              style: context.textThemeX.medium.bold,
                            ),
                          ),
                          const Gap(20),
                          const _QuranicVerseExplanationTextField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _AyahAddButton(),
            const Gap(5)
          ],
        ),
      ),
    );
  }
}

class _SurahAndVerseNumTextField extends StatelessWidget {
  const _SurahAndVerseNumTextField();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: _SurahTextField(),
        ),
        Gap(20),
        Expanded(
          child: _NoAyahOfSurah(),
        ),
      ],
    );
  }
}

class _SurahTextField extends StatelessWidget {
  const _SurahTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.quranicayahsurah, style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _NoAyahOfSurah extends StatelessWidget {
  const _NoAyahOfSurah();

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.numofayah, style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _QuranicVerseTextField extends StatelessWidget {
  const _QuranicVerseTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 3,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.quranicversec, style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _QuranicVerseExplanationTextField extends StatelessWidget {
  const _QuranicVerseExplanationTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 4,
      decoration: InputDecoration(
        labelStyle: context.textThemeX.medium,
        alignLabelWithHint: true,
        label: Text(context.l10n.quranicayahexp, style: context.textThemeX.medium.bold),
      ),
    );
  }
}

class _AyahAddButton extends StatelessWidget {
  const _AyahAddButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Button.filled(
        label: context.l10n.add,
        maxWidth: true,
        onPressed: () => context.read<AtharsCubit>().ensureCubit(),
      ),
    );
  }
}
