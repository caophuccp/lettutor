import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/tutor_screen/booking_date_picker.dart';
import 'package:lettutor/components/tutor_screen/booking_time_picker.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_view.dart';
import 'package:lettutor/components/tutor_screen/tutor_report_dialog.dart';
import 'package:lettutor/components/tutor_screen/tutor_reviews_dialog.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_header.dart';
import 'package:lettutor/components/tutor_screen/tutor_interactions_view.dart';
import 'package:lettutor/data/local_data.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/screens/tutors_screen/tutor_message_screen.dart';
import 'package:lettutor/screens/tutors_screen/tutor_schedule_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';

class TutorProfileScreen extends StatefulWidget {
  const TutorProfileScreen({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;

  @override
  _TutorProfileScreenState createState() => _TutorProfileScreenState();
}

class _TutorProfileScreenState extends State<TutorProfileScreen> {
  final tutors = LocalData.instance.allTutors;

  final specialities = [
    'All',
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavigationBackButton(),
              SizedBox(
                height: SpacingValue.large,
              ),
              Container(
                height: 200,
                color: Colors.red,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: PaddingValue.extraLarge,
                    vertical: PaddingValue.large),
                child: Wrap(
                  runSpacing: SpacingValue.large,
                  children: [
                    TutorInfoHeader(
                        tutorAvatar: widget.tutor.avatar, tutorName: widget.tutor.name),
                    BarButton(
                      onPressed: booking,
                      child: Text('Booking'),
                      height: 44,
                      cornerRadius: CornerRadiusValue.medium,
                    ),
                    BarButton(
                      onPressed: showSchedule,
                      child: Text('Schedule'),
                      height: 44,
                      cornerRadius: CornerRadiusValue.medium,
                    ),
                    TutorInteractionsView(
                      messageAction: directMessage,
                      reportAction: report,
                      reviewAction: showReview,
                      favoriteAction: toggleFavorite,
                    ),
                    TutorInfoView(tutor: widget.tutor,),
                    SizedBox(
                      height: PaddingValue.large,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void booking() {
    selectDate();
  }

  void selectDate() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BookingDatePicker(
          selectDate: selectTime,
        );
      },
    );
  }

  void selectTime(DateTime date) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BookingTimePicker(
          selectTime: (_) {
            showError();
          },
        );
      },
    );
  }

  void showSchedule() {
    navigate(TutorScheduleScreen());
  }

  void showReview() {
    showDialog(
      context: context,
      builder: (_) => TutorReviewsDialog(),
    );
  }

  void directMessage() {
    navigate(TutorMessageScreen());
  }

  void report() {
    showDialog(
      context: context,
      builder: (_) => TutorReportDialog(),
    );
  }

  void toggleFavorite() {
    print('tutor_profile_screen.dart - toggleFavorite');
  }

  void showError() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text("Not enough money for booking.\nPlease try again"),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            isDefaultAction: true,
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
