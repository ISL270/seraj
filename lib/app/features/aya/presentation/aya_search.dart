part of 'add_new_ayah.dart';

class _AyaSearch extends StatelessWidget {
  const _AyaSearch();

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return BlocConsumer<AddAyaCubit, AddAyaState>(
      listener: (context, state) {
        if (state.status is Failure && context.mounted) {
          final failure = state.status as Failure;
          if (failure.exception.message == 'Aya already exists') {
            _showErrorDialog(
              context: context,
              title: context.l10n.warning,
              content: context.l10n.ayaExist,
            ).then((_) {
              context.mounted ? context.read<AddAyaCubit>().resetStatus() : null;
            });
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SearchBar(
                backgroundColor:
                    WidgetStateProperty.all(context.colorsX.background.withValues(alpha: 0.9)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                controller: textController,
                hintText: context.l10n.search,
                onChanged: (query) {
                  context.read<AddAyaCubit>().queryChanged(query);
                },
                trailing: [
                  IconButton(
                    onPressed: () {
                      textController.clear();
                      context.read<AddAyaCubit>().queryChanged('');
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              if (state.ayahs.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: context.colorsX.background,
                  ),
                  height: 300.h,
                  child: ListView.builder(
                    itemCount: state.ayahs.length,
                    itemBuilder: (context, index) {
                      final ayah = state.ayahs[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              ayah.ayah.replaceAll('\n', ' ').decorateArabicNumbers(),
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
                                  '${ayah.surahNameAr} ${ayah.ayahNumber.toString().decorateArabicNumbers()}',
                                  style: context.textThemeX.small.copyWith(
                                    color: context.colorsX.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
                            onTap: () {
                              context.read<AddAyaCubit>().ayahsChanged([ayah]);
                              context.read<AddAyaCubit>().queryChanged(''); // Reset query
                            },
                          ),
                          Divider(
                            color: context.colorsX.onBackgroundTint35,
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showErrorDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colorsX.background,
        surfaceTintColor: context.colorsX.background,
        title: Text(title),
        content: Text(content, style: context.textThemeX.large),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(context.l10n.edit),
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(context.l10n.cancel),
          ),
        ],
      ),
    );
  }
}
