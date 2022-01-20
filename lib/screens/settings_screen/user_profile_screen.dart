import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/settings_screen/user_info.dart';
import 'package:lettutor/components/settings_screen/user_info_combo_box.dart';
import 'package:lettutor/components/settings_screen/user_profile_header.dart';
import 'package:lettutor/extensions/datetime_extension.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/screens/settings_screen/vm/user_profile_screen_vm.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final vm = UserProfileScreenVM();
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textFieldController.addListener(() {
      setState(() {});
    });
    textFieldController.text = vm.user.phone ?? '';
  }

  @override
  void dispose() {
    textFieldController.dispose();
    vm.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<UserProfileScreenVM>(builder: (_, __, ___) {
        final error = vm.errorMessage;
        if (error != null) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            vm.removeError();
            showSnackBarError(error);
          });
        }
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: hideKeyboard,
              child: Column(
                children: [
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: NavigationBackButton(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: PaddingValue.extraLarge,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SpacingValue.large,
                          ),
                          UserProfileHeader(
                            tutorAvatar: vm.user.avatar ?? '',
                            tutorName: vm.user.name ?? '',
                            tutorEmail: vm.user.email ?? '',
                          ),
                          SizedBox(
                            height: SpacingValue.large,
                          ),
                          UserInfoView(
                            title: 'Birthday',
                            child: TextButton(
                              onPressed: showDatePicker,
                              child: Text(vm.user.birthday ?? ''),
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
                              enabled: false,
                              controller: textFieldController,
                              style: TextStyles.subtitle2SemiBold,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 8, 16, 8),
                                border: InputBorder.none,
                                hintText: 'Phone number',
                                errorText: vm.phoneValidate(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SpacingValue.large,
                          ),
                          // UserInfoView(
                          //   title: 'Country',
                          //   child: UserInfoComboBox(
                          //     header: 'Country',
                          //     items: List.generate(
                          //         20, (index) => 'Country $index'),
                          //     allowsMultipleSelection: false,
                          //   ),
                          // ),
                          SizedBox(
                            height: SpacingValue.large,
                          ),
                          UserInfoView(
                            title: 'My Level',
                            child: UserInfoComboBox(
                              header: 'My Level',
                              selectedItem: vm.user.level,
                              select: (value) {
                                setState(() {
                                  vm.user.level = value;
                                });
                              },
                              items: [
                                'BEGINNER',
                                'HIGHER_BEGINNER',
                                'PRE_INTERMEDIATE',
                                'INTERMEDIATE',
                                'UPPER_INTERMEDIATE',
                                'ADVANCED',
                                'PROFICIENCY',
                              ],
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
                              items: LearnTopic.allValues
                                  .map((e) => e.name)
                                  .toList(),
                              selectedItems: vm.user.learnTopics
                                      ?.map((e) => e.name)
                                      .toList() ??
                                  [],
                              select: (value) {
                                setState(() {
                                  final learnTopic = LearnTopic.allValues
                                      .firstWhere((e) => e.name == value);
                                  if (vm.user.learnTopics == null) {
                                    vm.user.learnTopics = [learnTopic];
                                  } else {
                                    vm.user.learnTopics?.add(learnTopic);
                                  }
                                });
                              },
                              unselect: (value) {
                                setState(() {
                                  vm.user.learnTopics
                                      ?.removeWhere((e) => e.name == value);
                                });
                              },
                              allowsMultipleSelection: true,
                            ),
                          ),
                          SizedBox(
                            height: SpacingValue.large,
                          ),
                          UserInfoView(
                            title: 'Test Preparation',
                            child: UserInfoComboBox(
                              header: 'Test Preparation',
                              items: TestPreparation.allValues
                                  .map((e) => e.name)
                                  .toList(),
                              selectedItems: vm.user.testPreparations
                                      ?.map((e) => e.name)
                                      .toList() ??
                                  [],
                              select: (value) {
                                setState(() {
                                  final testPreparation = TestPreparation
                                      .allValues
                                      .firstWhere((e) => e.name == value);
                                  if (vm.user.testPreparations == null) {
                                    vm.user.testPreparations = [
                                      testPreparation
                                    ];
                                  } else {
                                    vm.user.testPreparations
                                        ?.add(testPreparation);
                                  }
                                });
                              },
                              unselect: (value) {
                                setState(() {
                                  vm.user.testPreparations
                                      ?.removeWhere((e) => e.name == value);
                                });
                              },
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
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingValue.extraLarge),
                    child: BarButton(
                      height: 40,
                      child: Text('Save Change'),
                      onPressed: vm.isUpdating ? null : update,
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
      }),
    );
  }

  void update() async {
    final success = await vm.update();
    if (success) {
      showSnackBarInfo('Update successful');
      Navigator.of(context).pop();
    }
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
            onDateTimeChanged: (picked) {
              setState(() {
                vm.user.birthday = picked.string('yyyy-MM-dd');
              });
            },
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
