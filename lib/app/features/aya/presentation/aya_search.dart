part of 'add_new_ayah.dart';

class _AyaSearch extends StatefulWidget {
  const _AyaSearch();

  @override
  State<_AyaSearch> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<_AyaSearch> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    FlutterQuran().init();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addAyaCubit = context.watch<AddAyaCubit>();
    final state = addAyaCubit.state;
    if (_textController.text != state.query) {
      _textController
        ..text = state.query ?? ''
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length),
        );
    }

    return SizedBox(
      height: state.ayahs.isEmpty ? 60.h : 400.h,
      child: Column(
        children: [
          TextField(
            controller: _textController,
            onChanged: (query) =>
                context.read<AddAyaCubit>().queryChanged(query),
            decoration: InputDecoration(
              hintText: context.l10n.search,
            ),
          ),
          if (state.ayahs.isNotEmpty && state.query == null) ...[
            const SizedBox(),
          ] else ...[
            Expanded(
              child: ListView.builder(
                itemCount: state.ayahs.length,
                itemBuilder: (context, index) {
                  final ayah = state.ayahs[index];
                  return Column(
                    children: [
                      ListTile(
                          title: Text(
                            ayah.ayah
                                .replaceAll('\n', ' ')
                                .decorateArabicNumbers(),
                            style: context.textThemeX.large.copyWith(
                              fontSize: 18.sp,
                              fontFamily: GoogleFonts.amiriQuran().fontFamily,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 16.h),
                              child: Text(
                                '${ayah.surahNameAr} '
                                '${ayah.ayahNumber.toString().decorateArabicNumbers()}',
                                style: context.textThemeX.small.copyWith(
                                  color: context.colorsX.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.h),
                          onTap: () {
                            context.read<AddAyaCubit>().ayahsChanged([ayah]);
                            context.read<AddAyaCubit>().queryChanged(
                                ''); // Reset the cubit query state
                          }),
                      Divider(
                        color: context.colorsX.onBackgroundTint35,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ]
        ],
      ),
    );
  }
}
