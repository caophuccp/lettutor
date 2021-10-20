import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/tutor_screen/booking_date_picker.dart';
import 'package:lettutor/components/tutor_screen/booking_time_picker.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_view.dart';
import 'package:lettutor/components/tutor_screen/tutor_reviews_dialog.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_header.dart';
import 'package:lettutor/components/tutor_screen/tutor_interactions_view.dart';
import 'package:lettutor/screens/tutors_screen/tutor_schedule_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';

class TutorProfileScreen extends StatefulWidget {
  const TutorProfileScreen({Key? key}) : super(key: key);

  @override
  _TutorProfileScreenState createState() => _TutorProfileScreenState();
}

class _TutorProfileScreenState extends State<TutorProfileScreen> {
  final tutorNameTest = 'April Corpuz';
  final tutorAvatarTest =
      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg';
  final introductionTest =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  final specialitiesTest = [
    'English for kids',
    'English for Business',
    'Conversational'
  ];

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
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: PaddingValue.extraLarge),
                child: NavigationBackButton(),
              ),
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
                        tutorAvatar: tutorAvatarTest, tutorName: tutorNameTest),
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
                    TutorInteractionsView(reviewAction: showReview,),
                    TutorInfoView(),
                    SizedBox(
                      height: PaddingValue.large,
                    ),
                    Text(
                      'Ratings and Comment',
                      style: TextStyles.subtitle1SemiBold.copyWith(
                        color: Colors.blue,
                      ),
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

  void showSchedule(){
    navigate(TutorScheduleScreen());
  }

  void showReview() {
    showDialog(
      context: context,
      builder: (_) => TutorReviewsDialog(),
    );
  }

  void showError() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text("No enough money for booking.\nPlease try again"),
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
