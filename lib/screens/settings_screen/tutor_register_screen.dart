import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/settings_screen/tutor_register_basic_info.dart';
import 'package:lettutor/components/settings_screen/tutor_register_cv.dart';
import 'package:lettutor/components/settings_screen/tutor_register_done_view.dart';
import 'package:lettutor/components/settings_screen/tutor_register_introduction_video.dart';
import 'package:lettutor/components/settings_screen/tutor_register_student_info.dart';
import 'package:lettutor/components/settings_screen/tutor_register_view.dart';
import 'package:lettutor/components/settings_screen/user_profile_header.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorRegisterScreen extends StatefulWidget {
  const TutorRegisterScreen({Key? key}) : super(key: key);

  @override
  _TutorRegisterScreenState createState() => _TutorRegisterScreenState();
}

class _TutorRegisterScreenState extends State<TutorRegisterScreen> {
  bool isWaitingForApproval = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: hideKeyboard,
          child: isWaitingForApproval
              ? TutorRegisterWaitingView(back: dismiss)
              : TutorRegisterView(register: register),
        ),
      ),
    );
  }

  void dismiss() {
    Navigator.of(context).pop();
  }

  void register() {
    setState(() {
      isWaitingForApproval = true;
    });
  }

  void showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 250,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {},
            initialDateTime: DateTime.now(),
            minimumYear: 2000,
            maximumYear: 2025,
          ),
        );
      },
    );
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
