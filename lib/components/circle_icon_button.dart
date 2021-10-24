import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.iconSize = 24,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? iconColor;
  final double iconSize;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: backgroundColor,
        child: IconButton(
          icon: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
