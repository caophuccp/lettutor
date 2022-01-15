class Validator {
  static String? emailValidator(String email) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String text) {
   if (text.length < 6) {
      return 'password must be at least 6 characters';
    } else {
      return null;
    }
  }
}
