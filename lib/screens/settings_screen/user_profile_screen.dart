import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/avatar.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/settings_screen/user_avatar_edit.dart';
import 'package:lettutor/components/settings_screen/user_info.dart';
import 'package:lettutor/components/settings_screen/user_info_combo_box.dart';
import 'package:lettutor/components/settings_screen/user_profile_header.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_expanded.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final tutorNameTest = 'April Corpuz';
  final tutorEmailTest = 'aprilcorpuz@email.com';
  final tutorAvatarTest =
      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg';
  final introductionTest =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  final specialitiesTest = [
    'English for kids',
    'English for Business',
    'Conversational',
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

  List<String> selectedItems = [];
  String selectedItem = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: hideKeyboard,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: PaddingValue.extraLarge,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: NavigationBackButton(),
                      ),
                      SizedBox(
                        height: SpacingValue.large,
                      ),
                      UserProfileHeader(
                        tutorAvatar: tutorAvatarTest,
                        tutorName: tutorNameTest,
                        tutorEmail: tutorEmailTest,
                      ),
                      SizedBox(
                        height: SpacingValue.large,
                      ),
                      UserInfoView(
                        title: 'Birthday',
                        child: TextButton(
                          onPressed: showDatePicker,
                          child: Text('20/12/2021'),
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SpacingValue.large,
                      ),
                      UserInfoView(
                        title: 'Phone Number',
                        child: TextField(
                          style: TextStyles.subtitle2SemiBold,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: InputBorder.none,
                            hintText: 'Phone number',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SpacingValue.large,
                      ),
                      UserInfoView(
                        title: 'Country',
                        child: UserInfoComboBox(
                          header: 'Country',
                          items: List.generate(20, (index) => 'Country $index'),
                          allowsMultipleSelection: false,
                        ),
                      ),
                      SizedBox(
                        height: SpacingValue.large,
                      ),
                      UserInfoView(
                        title: 'My Level',
                        child: UserInfoComboBox(
                          header: 'My Level',
                          items: ['Beginner', 'Intermediate', 'Avanced'],
                          allowsMultipleSelection: false,
                        ),
                      ),
                      SizedBox(
                        height: SpacingValue.large,
                      ),
                      UserInfoView(
                        title: 'Want to learn',
                        child: UserInfoComboBox(
                          header: 'Want to learn',
                          items: specialities,
                          selectedItems: selectedItems,
                          select: select,
                          unselect: unselect,
                          allowsMultipleSelection: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SpacingValue.large,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: PaddingValue.extraLarge),
                child: BarButton(
                  height: 40,
                  child: Text('Save Change'),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: SpacingValue.large,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void select(String item) {
    selectedItem = item;
    selectedItems.add(item);
    setState(() {});
  }

  void unselect(String item) {
    selectedItems.remove(item);
    setState(() {});
  }

  void showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 250,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {},
            initialDateTime: DateTime.now(),
            minimumYear: 2000,
            maximumYear: 2025,
          ),
        );
      },
    );
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
