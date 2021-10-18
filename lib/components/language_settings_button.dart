import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/language_settings_action_sheet.dart';
import 'package:lettutor/styles/consts.dart';

class LanguageSettingsButton extends StatefulWidget {
  const LanguageSettingsButton({
    Key? key,
    this.onLanguageChanged
  }) : super(key: key);

  final void Function(Language)? onLanguageChanged;
  @override
  _LanguageSettingsButtonState createState() => _LanguageSettingsButtonState();
}

class _LanguageSettingsButtonState extends State<LanguageSettingsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(CornerRadiusValue.medium),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/vietnam.png',
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void onTap() {
    showCupertinoModalPopup(
        context: context, builder: (context) => LanguageSettingsActionSheet());
  }
}
