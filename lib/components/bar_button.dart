
import 'package:flutter/material.dart';
import 'package:lettutor/styles/button_styles.dart';

enum BarButtonStyle { primary, secondary, inactive }

class BarButton extends StatelessWidget {
  const BarButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.cornerRadius = 0,
    this.width,
    this.height,
    this.style = BarButtonStyle.primary,
  }) : super(key: key);

  final double cornerRadius;
  final double? width;
  final double? height;
  final BarButtonStyle style;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        alignment: Alignment.center,
        child: child,
      ),
      style: _getButtonStyle(),
    );
  }

  ButtonStyle _getButtonStyle() {
    if (style == BarButtonStyle.primary) {
      return ButtonStyles.primaryButton(cornerRadius: cornerRadius);
    }

    if (style == BarButtonStyle.secondary) {
      return ButtonStyles.secondaryButton(cornerRadius: cornerRadius);
    }

    return ButtonStyles.inactiveButton(cornerRadius: cornerRadius);
  }
}
