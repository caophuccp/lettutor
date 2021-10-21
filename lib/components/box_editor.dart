import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class BoxEditor extends StatelessWidget {
  const BoxEditor({
    Key? key,
    required this.title,
    this.hintText,
    this.textFieldHeight,
  }) : super(key: key);

  final String title;
  final String? hintText;
  final double? textFieldHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius:
            BorderRadius.circular(CornerRadiusValue.medium),
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
            height: textFieldHeight,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: PaddingValue.large,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText ?? '',
                hintStyle: TextStyles.subtitle1SemiBold,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
