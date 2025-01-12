part of 'add_new_ayah.dart';

class _AyahSelectionWidget extends StatelessWidget {
  const _AyahSelectionWidget();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddAyaCubit>();
    return Expanded(
      child: TextField(
        readOnly: true,
        onTap: () => _onLastAyahTapped(context),
        controller: cubit.lastAyahController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: context.l10n.numofayah,
          hintStyle: context.textThemeX.medium.bold,
        ),
      ),
    );
  }

  Future<void> _onLastAyahTapped(BuildContext context) async {
    final currentState = context.read<AddAyaCubit>().state;
    final cubit = context.read<AddAyaCubit>();

    final surahNumber = currentState.selectedAyahs.first.surahNumber;
    final surahAyahs = FlutterQuran().getSurah(surahNumber).ayahs;
    final firstAyah = _parseToInt(cubit.firstAyahController.text);
    final initialValue = double.tryParse(cubit.firstAyahController.text) ?? 0;

    final selectedValue = await NumberPickerBS.show(
      context,
      initial: initialValue,
      renegeMax: surahAyahs.length,
    );

    if (_isValidSelection(selectedValue, firstAyah) && context.mounted) {
      _updateLastAyah(selectedValue!.toInt(), surahNumber, firstAyah, context);
    }
  }

  int _parseToInt(String value) {
    return int.tryParse(value) ?? 0;
  }

  bool _isValidSelection(double? selectedValue, int firstAyah) {
    return selectedValue != null;
  }

  void _updateLastAyah(
    int lastAyahNumber,
    int surahNumber,
    int firstAyah,
    BuildContext context,
  ) {
    final cubit = context.read<AddAyaCubit>();

    final adjustedFirstAyah = lastAyahNumber < firstAyah ? lastAyahNumber : firstAyah;
    cubit.lastAyahController.text = lastAyahNumber.toString();

    final surahAyahs =
        FlutterQuran().getSurah(surahNumber).ayahs.getRange(adjustedFirstAyah - 1, lastAyahNumber);

    final updatedAyahs = surahAyahs.toList();
    context.read<AddAyaCubit>().ayahsChanged(updatedAyahs);
  }
}
