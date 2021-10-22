import 'package:flutter/material.dart';
import 'package:lettutor/components/settings_screen/user_info.dart';
import 'package:lettutor/components/settings_screen/user_info_combo_box.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorRegisterCV extends StatelessWidget {
  const TutorRegisterCV({
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
              'CV',
              style: TextStyles.h6SemiBold,
            ),
            SizedBox(
              height: SpacingValue.small,
            ),
            Text(
              'Students will view this information on your profile to decide if you\'re a good fit for them.',
              style: TextStyles.subtitle2Regular,
            ),
          ],
        ),
        UserInfoView(
          title: 'Interests',
          child: Container(
            height: 90,
            child: TextField(
              style: TextStyles.subtitle2Regular,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                border: InputBorder.none,
                hintText: 'Interests',
              ),
              maxLines: null,
            ),
          ),
        ),
        UserInfoView(
          title: 'Education',
          child: Container(
            height: 90,
            child: TextField(
              style: TextStyles.subtitle2Regular,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                border: InputBorder.none,
                hintText: 'Education',
              ),
              maxLines: null,
            ),
          ),
        ),
        UserInfoView(
          title: 'Experience',
          child: Container(
            height: 90,
            child: TextField(
              style: TextStyles.subtitle2Regular,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                border: InputBorder.none,
                hintText: 'Experience',
              ),
              maxLines: null,
            ),
          ),
        ),
        UserInfoView(
          title: 'Current or Previous Profession',
          child: Container(
            height: 90,
            child: TextField(
              style: TextStyles.subtitle2Regular,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                border: InputBorder.none,
                hintText: 'Current or Previous Profession',
              ),
              maxLines: null,
            ),
          ),
        ),
        UserInfoView(
          title: 'Languages',
          child: UserInfoComboBox(
            header: 'Languages',
            items: List.generate(20, (index) => 'Language $index'),
            allowsMultipleSelection: true,
          ),
        ),
      ],
    );
  }
}
