import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/tutor_card_view.dart';
import 'package:lettutor/data/local_data.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tutors = LocalData.instance.allTutors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: PaddingValue.extraLarge,
                vertical: PaddingValue.medium,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    'Recommended Tutors',
                    style: TextStyles.h6Bold,
                  ),
                  Icon(
                    Icons.arrow_right_rounded,
                    size: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: PaddingValue.extraLarge),
                itemCount: tutors.length,
                itemBuilder: (context, index) => TutorCardView(
                  onTap: showTutorProfile,
                  margin: EdgeInsets.fromLTRB(
                    PaddingValue.extraLarge,
                    PaddingValue.extraLarge,
                    PaddingValue.extraLarge,
                    0,
                  ),
                  tutorName: tutors[index].name,
                  tutorAvatar: tutors[index].avatar,
                  introduction: tutors[index].bio,
                  rating: 4.8,
                  specialities: tutors[index].specialties.split(','),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTutorProfile() {
    navigate(TutorProfileScreen());
  }
}
