import 'package:lettutor/config/global.dart';

class API {
  API._();

  static String baseAPI = 'https://sandbox.api.lettutor.com';

  static Map<String, String> get headers {
    if (Global.accessToken == null) {
      return {
        "Content-Type": "application/json",
      };
    }

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + (Global.accessToken?.token ?? ''),
    };
  }
}

class APIResponse<T> {
  final int statusCode;
  final String? message;
  final T? result;

  APIResponse({
    required this.statusCode,
    this.message,
    this.result,
  });
}
