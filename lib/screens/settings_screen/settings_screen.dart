import 'package:flutter/material.dart';
import 'package:lettutor/components/settings_screen/setting_item_button.dart';
import 'package:lettutor/components/settings_screen/user_profile_setting_button.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/extensions/local_storage_service.dart';
import 'package:lettutor/screens/auth_screen/sign_in_screen.dart';
import 'package:lettutor/screens/settings_screen/advanced_settings.dart';
import 'package:lettutor/screens/settings_screen/booking_history_screen.dart';
import 'package:lettutor/screens/settings_screen/session_history_screen.dart';
import 'package:lettutor/screens/settings_screen/tutor_register_screen.dart';
import 'package:lettutor/screens/settings_screen/user_profile_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final settings = [
    {
      'icon': Icons.feedback_outlined,
      'title': 'View Feedbacks',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(PaddingValue.extraLarge),
            child: Column(
              children: [
                UserProfileSettingButton(
                  userAvatar:
                      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg',
                  onTap: editProfile,
                ),
                SizedBox(
                  height: PaddingValue.large,
                ),
                // SettingItemButton(
                //   title: 'View Feedbacks',
                //   icon: Icons.feedback_outlined,
                //   onTap: viewFeedbacks,
                // ),
                SettingItemButton(
                  title: 'Booking History',
                  icon: Icons.show_chart_rounded,
                  onTap: viewBookingHistory,
                ),
                // SettingItemButton(
                //   title: 'Session History',
                //   icon: Icons.history_rounded,
                //   onTap: viewSessionHistory,
                // ),
                SettingItemButton(
                  title: 'Advanced Settings',
                  icon: Icons.settings_applications_outlined,
                  onTap: viewAdvancedSettings,
                ),
                SettingItemButton(
                  title: 'Become a tutor',
                  icon: Icons.speaker_outlined,
                  onTap: becomeTutor,
                ),

                SettingItemButton(
                  title: 'Sign out',
                  icon: Icons.logout,
                  onTap: signOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editProfile() {
    navigate(UserProfileScreen());
  }

  void viewFeedbacks() {
    print('settings_screen.dart - viewFeedbacks');
  }

  void viewBookingHistory() {
    navigate(BookingHistoryScreen());
  }

  void viewSessionHistory() {
    navigate(SessionHistoryScreen());
  }

  void viewAdvancedSettings() {
    navigate(AdvancedSettingsScreen());
  }

  void becomeTutor() {
    navigate(TutorRegisterScreen());
  }

  void signOut() {
    Global.user = null;
    Global.accessToken = null;
    LocalStorageService.shared.setString(key: LocalStorageKey.TOKENS, value: '');
    pushReplacementWithoutAnimation(SignInScreen());
  }
}
