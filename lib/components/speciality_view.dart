import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({
    Key? key,
    required this.speciality,
    this.onTap,
    this.isActive = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: PaddingValue.large,
      vertical: PaddingValue.medium,
    ),
  }) : super(key: key);

  final String speciality;
  final void Function()? onTap;
  final bool isActive;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isActive ? Colors.blue[100] : Colors.grey[200];
    final foregroundColor = isActive ? Colors.blue[900] : Colors.grey[700];
    final overlayColor = isActive ? Colors.blue[100] : Colors.grey[300];
    return OutlinedButton(
      onPressed: onTap,
      child: Text(
        speciality,
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
        padding: MaterialStateProperty.all(padding),
        textStyle:
            MaterialStateProperty.all<TextStyle?>(TextStyles.captionRegular),
        foregroundColor: MaterialStateProperty.all<Color?>(foregroundColor),
        backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
        overlayColor: MaterialStateProperty.all<Color?>(overlayColor),
        shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
