import 'package:flutter/material.dart';
import 'package:lettutor/api/schedule_apis.dart';
import 'package:lettutor/api/user_apis.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/models/schedule/upcoming_schedule.dart';
import 'package:lettutor/models/user.dart';

class UserProfileScreenVM extends ChangeNotifier {
  User user = Global.user!.copyWith();
  String? errorMessage;

  bool isUpdating = false;

  void removeError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<bool> update() async {
    bool result = false;
    isUpdating = true;
    notifyListeners();

    try {
      final message = await UserAPIs.update(user);
      if (message == null) {
        Global.reloadUserInfo();
        result = true;
      } else {
        errorMessage = message;
        print(errorMessage);
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    }

    isUpdating = false;
    notifyListeners();
    return result;
  }

  final phoneRegex = RegExp(r'(^(?:[\+0])?[0-9]{10,12}$)');
  String? phoneValidate() {
    final phone = user.phone;
    if (phone == null || phone.isEmpty) {
      return null;
    }
    if (!phoneRegex.hasMatch(phone)) {
      return 'Invalid phone number';
    }
    return null;
  }
}
