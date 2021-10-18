import 'package:flutter/material.dart';
import 'package:lettutor/styles/text_styles.dart';

class ButtonStyles {
  static MaterialStateProperty<Color?> color(
      Color? defaultColor, Color? disabledColor) {
    return MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return disabledColor;
      }
      return defaultColor; // Defer to the widget's default.
    });
  }

  static MaterialStateProperty<Color?> color3(
      Color? defaultColor, Color? disabledColor, Color? pressedColor) {
    return MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return disabledColor;
      }

      if (states.contains(MaterialState.pressed)) {
        return pressedColor;
      }
      return defaultColor; // Defer to the widget's default.
    });
  }

  static MaterialStateProperty<OutlinedBorder?> border(double cornerRadius) {
    return MaterialStateProperty.resolveWith<OutlinedBorder?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        );
      }
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ); // Defer to the widget's default.
    });
  }

  static MaterialStateProperty<BorderSide?> side(
      Color defaultColor, Color disabledColor, double width) {
    return MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: disabledColor,
          width: width,
        );
      }
      return BorderSide(
        color: defaultColor,
        width: width,
      ); // Defer to the widget's default.
    });
  }

  static MaterialStateProperty<TextStyle> textStyle() {
    return MaterialStateProperty.all<TextStyle>(TextStyles.subtitle1SemiBold);
  }

  static MaterialStateProperty<EdgeInsetsGeometry?> padding(
      EdgeInsetsGeometry value) {
    return MaterialStateProperty.all<EdgeInsetsGeometry>(value);
  }

  static ButtonStyle primaryButton({double cornerRadius = 0}) {
    return ButtonStyle(
        textStyle: textStyle(),
        backgroundColor: color(Colors.blue, Colors.grey.shade200),
        overlayColor: color(Colors.white24, Colors.grey.shade200),
        foregroundColor: color(Colors.white,
            Colors.grey.shade400), // Defer to the widget's default.
        shape: border(cornerRadius),
        side: side(Colors.blue, Colors.grey.shade200, 1),
        padding: padding(EdgeInsets.all(0)),
        minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)));
  }

  static ButtonStyle secondaryButton({double cornerRadius = 0}) {
    return ButtonStyle(
        textStyle: textStyle(),
        backgroundColor: color(Colors.grey.shade200, Colors.grey.shade200),
        overlayColor: color(Colors.white24, Colors.grey.shade200),
        foregroundColor: color(Colors.grey.shade800,
            Colors.grey.shade400), // Defer to the widget's default.
        shape: border(cornerRadius),
        side: side(Colors.grey.shade200, Colors.grey.shade200, 1),
        padding: padding(EdgeInsets.fromLTRB(0, 0, 0, 0)),
        minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)));
  }

  static ButtonStyle inactiveButton({double cornerRadius = 0}) {
    return ButtonStyle(
      textStyle: textStyle(),
      backgroundColor: color(Colors.grey.shade200, Colors.grey.shade200),
      overlayColor: color(Colors.grey.shade200, Colors.grey.shade200),
      foregroundColor: color(Colors.grey.shade400,
          Colors.grey.shade400), // Defer to the widget's default.
      shape: border(cornerRadius),
      side: side(Colors.grey.shade200, Colors.grey.shade200, 1),
      padding: padding(EdgeInsets.fromLTRB(0, 0, 0, 0)),
      minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
    );
  }

  static ButtonStyle style({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    Color borderColor = Colors.grey,
    double borderWidth = 1,
    double cornerRadius = 0,
  }) {
    return ButtonStyle(
      textStyle: textStyle(),
      backgroundColor: color(backgroundColor, Colors.grey.shade200),
      overlayColor: color(overlayColor, Colors.grey.shade200),
      foregroundColor: color(foregroundColor,
          Colors.grey.shade400), // Defer to the widget's default.
      shape: border(cornerRadius),
      side: side(borderColor, Colors.grey.shade200, borderWidth),
      padding: padding(EdgeInsets.fromLTRB(0, 0, 0, 0)),
      minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
    );
  }

  static ButtonStyle textButtonStyle(
      {Color foregroundColor = Colors.blue, Color? pressedColor = const Color(4293128957)}) {
    return ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor:
            color3(foregroundColor, Colors.grey.shade200, pressedColor));
  }
}
