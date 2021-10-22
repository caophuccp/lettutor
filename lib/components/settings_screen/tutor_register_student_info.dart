import 'package:flutter/material.dart';
import 'package:lettutor/components/settings_screen/user_info.dart';
import 'package:lettutor/components/settings_screen/user_info_combo_box.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorRegisterStudentInfo extends StatelessWidget {
  const TutorRegisterStudentInfo({
    Key? key,
  }) : super(key: key);
  
  final specialities = const [
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOEFL',
    'TOEIC',
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: SpacingValue.large,
      children: [
        Text(
          'Who I teach',
          style: TextStyles.h6SemiBold,
        ),
        UserInfoView(
          title: 'Introduction',
          child: Container(
            height: 90,
            child: TextField(
              style: TextStyles.subtitle2Regular,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                border: InputBorder.none,
                hintText: 'Introduction',
              ),
              maxLines: null,
            ),
          ),
        ),
        UserInfoView(
          title: 'Specialities',
          child: UserInfoComboBox(
            header: 'Specialities',
            items: specialities,
            selectedItems: [],
            allowsMultipleSelection: true,
          ),
        ),
      ],
    );
  }
}
