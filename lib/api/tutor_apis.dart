import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/api/api.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/tutors/tutor_list.dart';
import 'package:lettutor/models/user.dart';

class TutorAPIs {
  TutorAPIs._();

  static Future<APIResponse<TutorList>> getTutors({
    required int limit,
    required page,
  }) async {
    try {
      final url = API.baseAPI + '/tutor/more?perPage=$limit&page=$page';
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
        final result = TutorList.fromJson(jsonObject);
        return APIResponse(statusCode: response.statusCode, result: result);
      }
    } catch (_, __) {
      rethrow;
    }
  }

  static Future<APIResponse<TutorList>> search({
    required String searchQuery,
  }) async {
    final body = {"search": "keegan"};
    try {
      final url = API.baseAPI + '/tutor/search';
      final uri = Uri.parse(url);
      final bodyString = json.encode(body);
      final response = await http.post(
        uri,
        headers: API.headers,
        body: bodyString,
      );
      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      final message = jsonObject['message'] as String?;
      if (message != null) {
        return APIResponse(statusCode: response.statusCode, message: message);
      } else {
        final result = TutorList.fromJson(jsonObject);
        return APIResponse(statusCode: response.statusCode, result: result);
      }
    } catch (_, __) {
      rethrow;
    }
  }
}
