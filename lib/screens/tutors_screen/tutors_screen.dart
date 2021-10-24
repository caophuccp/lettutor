import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/speciality_view.dart';
import 'package:lettutor/components/tutor_card_view.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';

class TutorsScreen extends StatefulWidget {
  @override
  _TutorsScreenState createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
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
  int _selectedSpecialityIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: PaddingValue.large),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 4,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: PaddingValue.extraLarge,
                    ),
                    child: CupertinoSearchTextField(),
                  ),
                  Container(
                    height: 52,
                    padding: EdgeInsets.only(top: PaddingValue.large),
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: PaddingValue.extraLarge,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: specialities.length,
                      itemBuilder: (context, index) => SpecialityView(
                        speciality: specialities.elementAt(index),
                        isActive: index == _selectedSpecialityIndex,
                        onTap: () {
                          setState(() {
                            _selectedSpecialityIndex = index;
                          });
                        },
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: SpacingValue.medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: PaddingValue.extraLarge),
                itemCount: 10,
                itemBuilder: (context, index) => TutorCardView(
                  onTap: viewTutorProfile,
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

  void viewTutorProfile() {
    navigate(TutorProfileScreen());
  }
}
