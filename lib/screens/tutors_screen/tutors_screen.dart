import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/speciality_view.dart';
import 'package:lettutor/components/tutor_card_view.dart';
import 'package:lettutor/data/local_data.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';

class TutorsScreen extends StatefulWidget {
  @override
  _TutorsScreenState createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
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
                itemCount: tutors.length,
                itemBuilder: (context, index) => TutorCardView(
                  onTap: (){viewTutorProfile(tutors[index]);},
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

  void viewTutorProfile(Tutor tutor) {
    navigate(TutorProfileScreen(tutor: tutor,));
  }
}
