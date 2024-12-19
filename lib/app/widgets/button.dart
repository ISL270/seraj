import 'package:athar/app/core/theming/app_colors_extension.dart';
import 'package:athar/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final WidgetStatesController? statesController;
  final String label;
  final _ButtonVariant _variant;
  final bool maxWidth;
  final IconWithAlignment? iconWithAlignment;
  final ButtonShape shape;
  final bool bold;
  final ButtonDensity density;
  final bool isLoading;
  final double? height;

  const Button._({
    required this.onPressed,
    required this.label,
    required _ButtonVariant variant,
    required super.key,
    required this.onLongPress,
    required this.onHover,
    required this.onFocusChange,
    required this.focusNode,
    required this.autofocus,
    required this.clipBehavior,
    required this.statesController,
    required this.iconWithAlignment,
    required this.maxWidth,
    required this.shape,
    required this.bold,
    required this.density,
    required this.isLoading,
    required this.height,
  }) : _variant = variant;

  factory Button.filled({
    required VoidCallback? onPressed,
    required String label,
    bool? maxWidth,
    Key? key,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    IconWithAlignment? iconWithAlignment,
    ButtonShape? shape,
    bool? bold,
    ButtonDensity? density,
    bool? isLoading,
    double? height,
  }) =>
      Button._(
        iconWithAlignment: iconWithAlignment,
        onPressed: onPressed,
        label: label,
        variant: _ButtonVariant.filled,
        key: key,
        maxWidth: maxWidth ?? false,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        statesController: statesController,
        shape: shape ?? ButtonShape.circular,
        bold: bold ?? true,
        density: density ?? ButtonDensity.standard,
        isLoading: isLoading ?? false,
        height: height,
      );

  factory Button.outlined({
    required VoidCallback? onPressed,
    required String label,
    bool? maxWidth,
    Key? key,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    IconWithAlignment? iconWithAlignment,
    ButtonShape? shape,
    bool? bold,
    ButtonDensity? density,
    bool? isLoading,
    double? height,
  }) =>
      Button._(
        iconWithAlignment: iconWithAlignment,
        maxWidth: maxWidth ?? false,
        onPressed: onPressed,
        label: label,
        variant: _ButtonVariant.outlined,
        key: key,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        statesController: statesController,
        shape: shape ?? ButtonShape.circular,
        bold: bold ?? true,
        density: density ?? ButtonDensity.standard,
        isLoading: isLoading ?? false,
        height: height,
      );

  factory Button.secondary({
    required VoidCallback? onPressed,
    required String label,
    bool? maxWidth,
    Key? key,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    IconWithAlignment? iconWithAlignment,
    ButtonShape? shape,
    bool? bold,
    ButtonDensity? density,
    bool? isLoading,
    double? height,
  }) =>
      Button._(
        iconWithAlignment: iconWithAlignment,
        onPressed: onPressed,
        label: label,
        variant: _ButtonVariant.secondary,
        key: key,
        maxWidth: maxWidth ?? false,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        statesController: statesController,
        shape: shape ?? ButtonShape.circular,
        bold: bold ?? true,
        density: density ?? ButtonDensity.standard,
        isLoading: isLoading ?? false,
        height: height,
      );

  @override
  Widget build(BuildContext context) {
    final height = this.height ?? density.height;
    return AbsorbPointer(
      absorbing: isLoading,
      child: Builder(
        builder: (context) {
          final child = Stack(
            alignment: AlignmentDirectional.center,
            children: [
              if (isLoading)
                SizedBox(
                  height: height / 2,
                  width: height / 2,
                  child: CircularProgressIndicator(
                    color: _variant == _ButtonVariant.outlined
                        ? context.colorsX.primary
                        : context.colorsX.onPrimary,
                    strokeWidth: switch (density) {
                      ButtonDensity.compact => 2,
                      ButtonDensity.standard => 3,
                      ButtonDensity.comfortable => 4,
                    },
                  ),
                ),
              Opacity(opacity: isLoading ? 0 : 1, child: Text(label)),
            ],
          );
          final padding = EdgeInsets.symmetric(
            horizontal: height,
            vertical: height / 5,
          );
          final style = FilledButton.styleFrom(
              padding: padding,
              textStyle: context.textThemeX.small.copyWith(
                fontSize: density.fontSize,
                fontWeight: bold ? FontWeight.bold : null,
              ),
              minimumSize: maxWidth
                  ? Size.fromHeight(height)
                  : Size(double.minPositive, height),
              backgroundColor: _variant == _ButtonVariant.secondary
                  ? context.colorsX.secondary
                  : null,
              shape: switch (shape) {
                ButtonShape.roundedCorners => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ButtonShape.sharp => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                _ => null,
              });

          if (_variant == _ButtonVariant.outlined) {
            if (iconWithAlignment != null) {
              return OutlinedButton.icon(
                key: key,
                onPressed: onPressed,
                onLongPress: onLongPress,
                onHover: onHover,
                onFocusChange: onFocusChange,
                style: style,
                focusNode: focusNode,
                autofocus: autofocus,
                clipBehavior: clipBehavior,
                statesController: statesController,
                label: child,
                icon: iconWithAlignment!.icon,
                iconAlignment: iconWithAlignment!.alignment,
              );
            }
            return OutlinedButton(
              key: key,
              onPressed: onPressed,
              onLongPress: onLongPress,
              onHover: onHover,
              onFocusChange: onFocusChange,
              style: style,
              focusNode: focusNode,
              autofocus: autofocus,
              clipBehavior: clipBehavior,
              statesController: statesController,
              child: child,
            );
          }

          if (iconWithAlignment != null) {
            return FilledButton.icon(
              key: key,
              onPressed: onPressed,
              onLongPress: onLongPress,
              onHover: onHover,
              onFocusChange: onFocusChange,
              style: style,
              focusNode: focusNode,
              autofocus: autofocus,
              clipBehavior: clipBehavior,
              statesController: statesController,
              label: child,
              icon: iconWithAlignment!.icon,
              iconAlignment: iconWithAlignment!.alignment,
            );
          }
          return FilledButton(
            key: key,
            onPressed: onPressed,
            onLongPress: onLongPress,
            onHover: onHover,
            onFocusChange: onFocusChange,
            style: style,
            focusNode: focusNode,
            autofocus: autofocus,
            clipBehavior: clipBehavior,
            statesController: statesController,
            child: child,
          );
        },
      ),
    );
  }
}

class IconWithAlignment {
  final Widget icon;
  final IconAlignment alignment;
  const IconWithAlignment(this.icon, {this.alignment = IconAlignment.start});
}

enum _ButtonVariant { filled, secondary, outlined }

enum ButtonShape { circular, roundedCorners, sharp }

enum ButtonDensity {
  compact(height: 34, fontSize: 14),
  standard(height: 42, fontSize: 16),
  comfortable(height: 50, fontSize: 18);

  final double height;
  final double fontSize;

  const ButtonDensity({
    required this.height,
    required this.fontSize,
  });
}
