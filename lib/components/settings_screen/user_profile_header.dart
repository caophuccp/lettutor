import 'package:flutter/material.dart';
import 'package:lettutor/components/settings_screen/user_avatar_edit.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    Key? key,
    required this.tutorAvatar,
    required this.tutorName,
    required this.tutorEmail,
  }) : super(key: key);

  final String tutorAvatar;
  final String tutorName;
  final String tutorEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          UserAvatarEdit(
            avatar: tutorAvatar,
          ),
          SizedBox(
            height: SpacingValue.medium,
          ),
          Text(
            tutorName,
            style: TextStyles.subtitle1SemiBold,
          ),
          Text(
            tutorEmail,
            style: TextStyles.subtitle1Regular,
          ),
        ],
      ),
    );
  }
}
