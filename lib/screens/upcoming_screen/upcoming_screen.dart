import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/lesson_date_session.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:lettutor/screens/upcoming_screen/meeting_screen.dart';

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
