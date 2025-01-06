part of 'add_new_ayah.dart';

class _AyahSelectionWidget extends StatelessWidget {
  const _AyahSelectionWidget({
    required this.firstAyahController,
    required this.lastAyahController,
  });

  final TextEditingController firstAyahController;
  final TextEditingController lastAyahController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        readOnly: true,
        onTap: () => _onLastAyahTapped(context),
        controller: lastAyahController,
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

    final surahNumber = currentState.selectedAyahs.first.surahNumber;
    final surahAyahs = FlutterQuran().getSurah(surahNumber).ayahs;
    final firstAyah = _parseToInt(firstAyahController.text);
    final initialValue = double.tryParse(firstAyahController.text) ?? 0;

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
    return selectedValue != null && selectedValue > firstAyah;
  }

  void _updateLastAyah(
      int lastAyahNumber,
      int surahNumber,
      int firstAyah,
      BuildContext context,
      ) {
    final adjustedFirstAyah = firstAyah > lastAyahNumber
        ? firstAyah - lastAyahNumber
        : firstAyah;

    lastAyahController.text = lastAyahNumber.toString();

    final surahAyahs = FlutterQuran()
        .getSurah(surahNumber)
        .ayahs
        .getRange(adjustedFirstAyah - 1, lastAyahNumber);

    final updatedAyahs = surahAyahs.toList();
    context.read<AddAyaCubit>().ayahsChanged(updatedAyahs);
  }
}
