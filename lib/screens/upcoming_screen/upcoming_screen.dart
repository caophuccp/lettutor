import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/lesson_date_session.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:lettutor/screens/upcoming_screen/meeting_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Total lesson time is 12 hours 55 minutes',
                  style: TextStyles.subtitle1SemiBold.copyWith(
                    color: Colors.white
                  ),
                ),
                color: Colors.blue,
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LessonDateSession(
                      isExpanded: true,
                      date: 'Sat 23 Oct 21',
                      showTutorReview: false,
                      isCancellable: true,
                      countdown: true,
                      onCancel: cancel,
                      joinMeeting: joinMeeting,
                      directMessage: directMessage,
                    ),
                    LessonDateSession(
                      date: 'Thu 21 Oct 21',
                      showTutorReview: false,
                      isCancellable: true,
                      onCancel: cancel,
                      joinMeeting: joinMeeting,
                      directMessage: directMessage,
                    ),
                    LessonDateSession(
                      date: 'Wed 20 Oct 21',
                      showTutorReview: false,
                      isCancellable: true,
                      onCancel: cancel,
                      joinMeeting: joinMeeting,
                      directMessage: directMessage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cancel(String id) {
    print('upcoming_screen.dart - cancel - id: $id');
  }

  void joinMeeting(String id) {
    navigate(MeetingScreen());
  }

  void directMessage(String id) {
    print('upcoming_screen.dart - directMessage - id: $id');
  }
}
