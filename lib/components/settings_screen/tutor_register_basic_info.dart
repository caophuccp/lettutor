import 'package:flutter/material.dart';
import 'package:lettutor/components/settings_screen/user_info.dart';
import 'package:lettutor/components/settings_screen/user_info_combo_box.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorRegisterBasicInfo extends StatelessWidget {
  const TutorRegisterBasicInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: SpacingValue.large,
      children: [
        Text(
          'Basic info',
          style: TextStyles.h6SemiBold,
        ),
        UserInfoView(
          title: 'Tutoring name',
          child: TextField(
            style: TextStyles.subtitle2SemiBold,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              border: InputBorder.none,
              hintText: 'Tutoring name',
            ),
          ),
        ),
        UserInfoView(
          title: 'Birthday',
          child: TextButton(
            onPressed: () {},
            child: Text('20/12/2021'),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        UserInfoView(
          title: 'Phone Number',
          child: TextField(
            style: TextStyles.subtitle2SemiBold,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              border: InputBorder.none,
              hintText: 'Phone number',
            ),
          ),
        ),
        UserInfoView(
          title: 'Country',
          child: UserInfoComboBox(
            header: 'Country',
            items: List.generate(20, (index) => 'Country $index'),
            allowsMultipleSelection: false,
          ),
        ),
      ],
    );
  }
}
