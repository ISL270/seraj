part of '../add_dua_screen.dart';

class _DuaTimeDropDownButton extends StatefulWidget {
  const _DuaTimeDropDownButton();

  @override
  State<_DuaTimeDropDownButton> createState() => _DuaTimeDropDownButtonState();
}

class _DuaTimeDropDownButtonState extends State<_DuaTimeDropDownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final items = <String>[context.l10n.morning, context.l10n.evening, context.l10n.withoutTime];
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          style: context.textThemeX.medium.bold,
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.selectDuaTime,
                  style:
                      context.textThemeX.medium.copyWith(color: context.colorsX.onBackgroundTint35),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: items
              .map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: context.textThemeX.medium.copyWith(
                      color: context.colorsX.onBackground,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: _buttonStyleData(context),
          iconStyleData: _iconStyleData(context),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200.h,
            width: 200.w,
            direction: DropdownDirection.left,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.srcATop,
              borderRadius: BorderRadius.circular(14.sp),
              color: context.colorsX.background,
            ),
            offset: Offset(-5.w, -2.h),
            scrollbarTheme: _scrollBarTheme(),
          ),
          menuItemStyleData: _menuItemStyleData(),
        ),
      ),
    );
  }
}
