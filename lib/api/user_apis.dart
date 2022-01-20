import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/api/api.dart';
import 'package:lettutor/models/user.dart';

class UserAPIs {
  UserAPIs._();

  static Future<APIResponse<User>> getUserInfo() async {
    try {
      final url = API.baseAPI + '/user/info';
      final uri = Uri.parse(url);
      final response = await http.get(
        uri,
        headers: API.headers,
      );
      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      final message = jsonObject['message'] as String?;
      if (message != null) {
        return APIResponse(statusCode: response.statusCode, message: message);
      } else {
        final user = User.fromJson(jsonObject['user']);
        return APIResponse(statusCode: response.statusCode, result: user);
      }
    } catch (_, __) {
      rethrow;
    }
  }

  static Future<String?> forgotPassword(String email) async {
    final body = {
      "email": email,
    };
    try {
      final url = API.baseAPI + '/user/forgotPassword';
      final uri = Uri.parse(url);
      final bodyString = json.encode(body);
      final response = await http.post(
        uri,
        headers: API.headers,
        body: bodyString,
      );
      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      return jsonObject['message'] as String?;
    } catch (_, __) {
      rethrow;
    }
  }
}
