import 'package:flutter/material.dart';

import 'language_settings_button.dart';

class AuthScreenAppBar extends StatelessWidget {
  const AuthScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/lettutor_logo.png',
            width: 170,
            height: 40,
            fit: BoxFit.contain,
          ),
          LanguageSettingsButton(),
        ],
      ),
    );
  }
}