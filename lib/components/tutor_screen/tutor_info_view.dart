import 'package:flutter/material.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_expanded.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/styles/consts.dart';

class TutorInfoView extends StatelessWidget {
  TutorInfoView({
    Key? key,
    required this.tutor,
  }) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: SpacingValue.large,
      children: [
        TutorInfoExpanded(
          title: 'Introduction',
          content: tutor.bio,
        ),
        TutorInfoExpanded(
          title: 'Language',
          content: tutor.languages,
        ),
        TutorInfoExpanded(
          title: 'Education',
          content: tutor.education,
        ),
        TutorInfoExpanded(
          title: 'Experience',
          content: tutor.experience,
        ),
        TutorInfoExpanded(
          title: 'Intersts',
          content: '- ' + tutor.interests.replaceAll(', ', '\n- '),
        ),
        TutorInfoExpanded(
          title: 'Profession',
          content: tutor.profession,
        ),
        TutorInfoExpanded(
          title: 'Specialties',
          content: '- ' + tutor.specialties.replaceAll(',', '\n- '),
        ),
      ],
    );
  }
}
