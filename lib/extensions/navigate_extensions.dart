import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension StateExtensions on State<StatefulWidget> {
  void navigateWithoutAnimation(Widget newScreen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => newScreen,
        transitionDuration: Duration.zero,
      ),
    );
  }

  void navigate(Widget newScreen) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => newScreen,
      ),
      // PageRouteBuilder(
      //   pageBuilder: (context, animation1, animation2) => newScreen,
      //   transitionDuration: Duration(milliseconds: 250),
      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //     const begin = Offset(1.0, 0.0);
      //     const end = Offset.zero;
      //     final tween = Tween(begin: begin, end: end);
      //     final offsetAnimation = animation.drive(tween);

      //     return SlideTransition(
      //       position: offsetAnimation,
      //       child: child,
      //     );
      //   },
      // ),
    );
  }

  void pushReplacementWithoutAnimation(Widget newScreen) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => newScreen,
        transitionDuration: Duration.zero,
      ),
    );
  }
}
