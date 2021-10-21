import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class BoxInfo extends StatelessWidget {
  const BoxInfo({
    Key? key,
    required this.title,
    required this.content,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String title;
  final String content;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.2),
            padding: EdgeInsets.symmetric(
              vertical: PaddingValue.medium,
              horizontal: PaddingValue.large,
            ),
            width: double.infinity,
            child: Text(
              title,
              style: TextStyles.subtitle1SemiBold,
            ),
          ),
          Container(
            padding: EdgeInsets.all(PaddingValue.large),
            width: double.infinity,
            child: Text(
              content,
              style: TextStyles.subtitle2SemiBold,
              textAlign: textAlign,
            ),
          ),
        ],
      ),
    );
  }
}
