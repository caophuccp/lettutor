import 'package:flutter/material.dart';
import 'package:lettutor/components/settings_screen/user_info.dart';
import 'package:lettutor/components/settings_screen/user_info_combo_box.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorRegisterIntroductionVideo extends StatelessWidget {
  const TutorRegisterIntroductionVideo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: SpacingValue.large,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction video',
              style: TextStyles.h6SemiBold,
            ),
            SizedBox(
              height: SpacingValue.small,
            ),
            Text(
              'A few helpful tips:',
              style: TextStyles.subtitle2Regular,
            ),
            Text(
              '   -Find a clean and quiet space',
              style: TextStyles.subtitle2Regular,
            ),
            Text(
              '   -Smile and look at the camera',
              style: TextStyles.subtitle2Regular,
            ),
            Text(
              '   -Dress smart',
              style: TextStyles.subtitle2Regular,
            ),
            Text(
              '   -Speak for 1-3 minutes',
              style: TextStyles.subtitle2Regular,
            ),
            Text(
              '   -Brand yourself and have fun!',
              style: TextStyles.subtitle2Regular,
            ),
          ],
        ),
        UserInfoView(
          title: 'Introduction video',
          child: TextButton(
            onPressed: () {},
            child: Text('Choose Video'),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ],
    );
  }
}
