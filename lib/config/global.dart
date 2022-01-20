import 'package:lettutor/api/auth_apis.dart';
import 'package:lettutor/api/user_apis.dart';
import 'package:lettutor/models/tokens.dart';
import 'package:lettutor/models/user.dart';

class Global {
  Global._();

  static User? user;
  static Token? accessToken;

  static void reloadUserInfo() async {
    try {
      final response = await UserAPIs.getUserInfo();
      print(response.message);
      if (response.result != null) {
        user = response.result;
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
