import 'package:flutter/material.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_expanded.dart';
import 'package:lettutor/styles/consts.dart';

class TutorInfoView extends StatelessWidget {
  TutorInfoView({
    Key? key,
  }) : super(key: key);

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
    return Wrap(
      runSpacing: SpacingValue.large,
      children: [
        TutorInfoExpanded(
          title: 'Introduction',
          content: introductionTest,
        ),
        TutorInfoExpanded(
          title: 'Language',
          content: 'English',
        ),
        TutorInfoExpanded(
          title: 'Language',
          content: 'English',
        ),
        TutorInfoExpanded(
          title: 'Education',
          content: 'Bachelor from UOT',
        ),
        TutorInfoExpanded(
          title: 'Experience',
          content: '5 years of English teaching',
        ),
        TutorInfoExpanded(
          title: 'Intersts',
          content: 'Finace, gardening, traveling',
        ),
        TutorInfoExpanded(
          title: 'Profession',
          content: 'Teaching Assistant at ILA Vietnam',
        ),
        TutorInfoExpanded(
          title: 'Specialties',
          content: '- ' +
              specialitiesTest.reduce(
                  (value, element) => value + '\n- ' + element),
        ),
      ],
    );
  }
}
