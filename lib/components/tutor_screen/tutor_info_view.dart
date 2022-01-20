import 'package:flutter/material.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_expanded.dart';
import 'package:lettutor/extensions/string_extension.dart';
import 'package:lettutor/styles/consts.dart';

class TutorInfoView extends StatelessWidget {
  TutorInfoView({
    Key? key,
    required this.bio,
    required this.languages,
    required this.education,
    required this.experience,
    required this.interests,
    required this.profession,
    required this.specialties,
  }) : super(key: key);

  final String? bio;
  final String? languages;
  final String? education;
  final String? experience;
  final String? interests;
  final String? profession;
  final String? specialties;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: SpacingValue.large,
      children: [
        TutorInfoExpanded(
          title: 'Introduction',
          content: bio ?? '',
        ),
        TutorInfoExpanded(
          title: 'Language',
          content: languages?.toUpperCase() ?? '',
        ),
        TutorInfoExpanded(
          title: 'Education',
          content: education ?? '',
        ),
        TutorInfoExpanded(
          title: 'Experience',
          content: experience ?? '',
        ),
        TutorInfoExpanded(
          title: 'Intersts',
          content: '- ' + (interests?.replaceAll(', ', '\n- ') ?? ''),
        ),
        TutorInfoExpanded(
          title: 'Profession',
          content: profession ?? '',
        ),
        TutorInfoExpanded(
          title: 'Specialties',
          // content: '- ' + (tutor.specialties?.replaceAll(',', '\n- ') ?? ''),
          content: '- ' +
              (specialties
                      ?.split(',')
                      .map((e) => e.toCapitalized())
                      .join('\n- ') ??
                  ''),
        ),
      ],
    );
  }
}
