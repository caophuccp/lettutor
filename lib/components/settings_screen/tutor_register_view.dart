import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/settings_screen/tutor_register_basic_info.dart';
import 'package:lettutor/components/settings_screen/tutor_register_cv.dart';
import 'package:lettutor/components/settings_screen/tutor_register_introduction_video.dart';
import 'package:lettutor/components/settings_screen/tutor_register_student_info.dart';
import 'package:lettutor/components/settings_screen/user_profile_header.dart';
import 'package:lettutor/styles/consts.dart';

class TutorRegisterView extends StatelessWidget {
  const TutorRegisterView({
    Key? key,
    this.register,
  }) : super(key: key);

  final tutorNameTest = 'April Corpuz';
  final tutorEmailTest = 'aprilcorpuz@email.com';
  final tutorAvatarTest =
      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg';

  final void Function()? register;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              PaddingValue.extraLarge,
              0,
              PaddingValue.extraLarge,
              PaddingValue.extraLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: NavigationBackButton(
                    title: 'Settings',
                  ),
                ),
                SizedBox(
                  height: SpacingValue.large,
                ),
                UserProfileHeader(
                  tutorAvatar: tutorAvatarTest,
                  tutorName: tutorNameTest,
                  tutorEmail: tutorEmailTest,
                ),
                SizedBox(
                  height: SpacingValue.large,
                ),
                SizedBox(
                  height: SpacingValue.large,
                ),
                TutorRegisterIntroductionVideo(),
                SizedBox(
                  height: SpacingValue.large,
                ),
                TutorRegisterBasicInfo(),
                SizedBox(
                  height: SpacingValue.extraLarge,
                ),
                TutorRegisterCV(),
                SizedBox(
                  height: SpacingValue.extraLarge,
                ),
                TutorRegisterStudentInfo(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: SpacingValue.large,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: PaddingValue.extraLarge),
          child: BarButton(
            height: 40,
            child: Text('Register'),
            onPressed: register,
          ),
        ),
        SizedBox(
          height: SpacingValue.large,
        ),
      ],
    );
  }
}
