import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/lesson_date_session.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  _BookingHistoryScreenState createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: 40,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  NavigationBackButton(
                    title: '',
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Booking History',
                      style: TextStyles.subtitle1SemiBold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LessonDateSession(
                      date: 'Sat 23 Oct 21',
                      showTutorReview: false,
                      isCancellable: true,
                      onCancel: cancel,
                    ),
                    LessonDateSession(
                      date: 'Thu 21 Oct 21',
                      showTutorReview: false,
                      isCancellable: true,
                      onCancel: cancel,
                    ),
                    LessonDateSession(
                      date: 'Wed 20 Oct 21',
                      showTutorReview: false,
                      isCancellable: true,
                      onCancel: cancel,
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
    print('booking_history_screen.dart - cancel - id: $id');
  }
}
