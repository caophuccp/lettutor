import 'package:flutter/material.dart';
import 'package:lettutor/styles/text_styles.dart';

class NavigationBackButton extends StatefulWidget {
  const NavigationBackButton({
    Key? key,
  }) : super(key: key);

  @override
  _NavigationBackButtonState createState() => _NavigationBackButtonState();
}

class _NavigationBackButtonState extends State<NavigationBackButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: back,
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios, size: 16,),
          Text('Sign in', style: TextStyles.subtitle2SemiBold,),
        ],
      ),
    );
  }

  void back(){
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
