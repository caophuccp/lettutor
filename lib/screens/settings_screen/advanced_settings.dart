import 'package:flutter/material.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/settings_screen/user_info.dart';
import 'package:lettutor/components/settings_screen/user_info_combo_box.dart';
import 'package:lettutor/styles/consts.dart';

class AdvancedSettingsScreen extends StatefulWidget {
  const AdvancedSettingsScreen({Key? key}) : super(key: key);

  @override
  _AdvancedSettingsScreenState createState() => _AdvancedSettingsScreenState();
}

class _AdvancedSettingsScreenState extends State<AdvancedSettingsScreen> {
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NavigationBackButton(
              title: 'Settings',
            ),
            SizedBox(
              height: SpacingValue.extraLarge,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: PaddingValue.extraLarge),
              child: UserInfoView(
                title: 'Language',
                child: UserInfoComboBox(
                  items: ['Vietnamese', 'English'],
                  header: 'English',
                  select: changeLanguage,
                  selectedItem: language,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeLanguage(String newLanguage) {
    setState(() {
      language = newLanguage;
    });
  }
}
