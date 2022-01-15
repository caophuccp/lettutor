import 'package:lettutor/models/tokens.dart';

class API {
  API._();

  static String baseAPI = 'https://sandbox.api.lettutor.com';

  static Map<String, String> get headers {
    return {
      "Content-Type": "application/json",
      // "Authorization": "Bearer " + (UserUtils.token ?? ''),
    };
  }
}

class APIResponse<T> {
  final int statusCode;
  final String? message;
  final Tokens? tokens;
  final T? result;

  APIResponse({
    required this.statusCode,
    this.tokens,
    this.message,
    this.result,
  });
}
