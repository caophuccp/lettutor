
import 'package:flutter/material.dart';
import 'package:lettutor/styles/text_styles.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyles.subtitle1SemiBold,),
        Spacer(),
        Text(content, style: TextStyles.subtitle1Regular,),
      ],
    );
  }
}
