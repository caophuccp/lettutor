import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/tutor_card_view.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                itemCount: 10,
                itemBuilder: (context, index) => TutorCardView(
                  margin: EdgeInsets.fromLTRB(
                    PaddingValue.extraLarge,
                    PaddingValue.extraLarge,
                    PaddingValue.extraLarge,
                    0,
                  ),
                  tutorName: tutorNameTest,
                  tutorAvatar: tutorAvatarTest,
                  introduction: introductionTest,
                  rating: 4.8,
                  specialities: specialitiesTest,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
