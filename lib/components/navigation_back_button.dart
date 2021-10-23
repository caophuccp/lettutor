import 'package:flutter/material.dart';
import 'package:lettutor/styles/text_styles.dart';

class NavigationBackButton extends StatefulWidget {
  const NavigationBackButton({
    Key? key,
    this.title = 'Back',
  }) : super(key: key);

  final String title;

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
          Container(
            padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
            color: Colors.transparent,
            child: Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
          ),
          Text(
            widget.title,
            style: TextStyles.subtitle2SemiBold,
          ),
        ],
      ),
    );
  }

  void back() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
