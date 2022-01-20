import 'package:flutter/material.dart';
import 'package:lettutor/components/avatar.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class UserProfileSettingButton extends StatelessWidget {
  const UserProfileSettingButton({
    Key? key,
    this.onTap,
    required this.userAvatar,
  }) : super(key: key);

  final void Function()? onTap;
  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            UserAvatar(
              size: 56,
              imageUrl: userAvatar,
            ),
            SizedBox(
              width: PaddingValue.medium,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Global.user?.name ?? '',
                  style: TextStyles.subtitle1SemiBold,
                ),
                SizedBox(
                  height: PaddingValue.small,
                ),
                Text(
                  Global.user?.email ?? '',
                  style: TextStyles.subtitle2Regular,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
