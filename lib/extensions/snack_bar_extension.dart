import 'package:flutter/material.dart';

extension ShowSnackBar on State {
  Future<SnackBarClosedReason> showSnackBarError(String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Color(0xFFF44336),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return showSnackBar.closed;
  }

  Future<SnackBarClosedReason> showSnackBarInfo(String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Color(0xFF03A9F4),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return showSnackBar.closed;
  }
}

class SnackBarUtils {
  SnackBarUtils._();
  
  static Future<SnackBarClosedReason> showSnackBarError(
    BuildContext context,
    String message,
  ) async {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Color(0xFFF44336),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return showSnackBar.closed;
  }

  static Future<SnackBarClosedReason> showSnackBarInfo(
    BuildContext context,
    String message,
  ) async {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Color(0xFF03A9F4),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
    
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return showSnackBar.closed;
  }
}
