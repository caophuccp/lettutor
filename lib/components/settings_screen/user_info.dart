import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.subtitle1SemiBold,
          ),
          SizedBox(height: SpacingValue.medium,),
          Container(
            padding: EdgeInsets.all(4),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
              border: Border.all(
                color: Colors.grey.shade200,
              )
            ),
            child: child,
          )
        ],
      ),
    );
  }
}
