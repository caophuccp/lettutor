import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).cardTheme.shadowColor ?? Colors.transparent,
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: PaddingValue.medium),
      child: Text(
        title,
        style: TextStyles.subtitle1SemiBold,
      ),
    );
  }
}
