import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/api/api.dart';
import 'package:lettutor/models/tokens.dart';
import 'package:lettutor/models/user.dart';

class AuthAPIs {
  AuthAPIs._();

  static Future<String?> register(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
      "source": null,
    };
    try {
      final url = API.baseAPI + '/auth/register';
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

  static Future<APIResponse<User>> login(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
    };
    try {
      final url = API.baseAPI + '/auth/login';
      final uri = Uri.parse(url);
      final bodyString = json.encode(body);
      final response = await http.post(
        uri,
        headers: API.headers,
        body: bodyString,
      );
      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      final message = jsonObject['message'] as String?;
      if (message == null) {
        return APIResponse(statusCode: response.statusCode, message: message);
      } else {
        final user = User.fromJson(jsonObject['user']);
        final tokens = Tokens.fromJson(jsonObject['tokens']);
        return APIResponse(statusCode: response.statusCode, result: user, tokens: tokens);
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
