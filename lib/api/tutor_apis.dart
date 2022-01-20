import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/api/api.dart';
import 'package:lettutor/models/tutors/tutor_detail.dart';
import 'package:lettutor/models/tutors/tutor_list.dart';

class TutorAPIs {
  TutorAPIs._();

  static Future<APIResponse<TutorList>> getTutors({
    required int limit,
    required int page,
    final http.Client? client,
  }) async {
    try {
      final url = API.baseAPI + '/tutor/more?perPage=$limit&page=$page';
      final uri = Uri.parse(url);
      final http.Response response;
      if (client == null) {
        response = await http.get(
          uri,
          headers: API.headers,
        );
      } else {
        response = await client.get(
          uri,
          headers: API.headers,
        );
      }
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

  static Future<APIResponse<Tutors>> search({
    required String searchQuery,
    final http.Client? client,
    final List<String>? specialties,
  }) async {
    final Map<String, dynamic> body = {
      "search": searchQuery,
    };

    if (specialties != null) {
      body["filters"] = {
        "specialties": specialties,
      };
    }
    try {
      final url = API.baseAPI + '/tutor/search';
      final uri = Uri.parse(url);
      final bodyString = json.encode(body);
      final http.Response response;

      if (client == null) {
        response = await http.post(
          uri,
          headers: API.headers,
          body: bodyString,
        );
      } else {
        response = await client.post(
          uri,
          headers: API.headers,
          body: bodyString,
        );
      }
      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      final message = jsonObject['message'] as String?;
      if (message != null) {
        return APIResponse(statusCode: response.statusCode, message: message);
      } else {
        final result = Tutors.fromJson(jsonObject);
        return APIResponse(statusCode: response.statusCode, result: result);
      }
    } catch (_, __) {
      rethrow;
    }
  }

  static Future<APIResponse<TutorDetail>> getTutorById({
    required String tutorId,
    final http.Client? client,
  }) async {
    try {
      final url = API.baseAPI + '/tutor/$tutorId';
      final uri = Uri.parse(url);
      final http.Response response;
      if (client == null) {
        response = await http.get(
          uri,
          headers: API.headers,
        );
      } else {
        response = await client.get(
          uri,
          headers: API.headers,
        );
      }

      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      final message = jsonObject['message'] as String?;
      if (message != null) {
        return APIResponse(statusCode: response.statusCode, message: message);
      } else {
        final result = TutorDetail.fromJson(jsonObject);
        return APIResponse(statusCode: response.statusCode, result: result);
      }
    } catch (_, __) {
      rethrow;
    }
  }

  static Future<APIResponse<int>> manageFavoriteTutor({
    required String tutorId,
    final http.Client? client,
  }) async {
    final body = {"tutorId": tutorId};
    try {
      final url = API.baseAPI + '/user/manageFavoriteTutor';
      final uri = Uri.parse(url);
      final bodyString = json.encode(body);
      final http.Response response;

      if (client == null) {
        response = await http.post(
          uri,
          headers: API.headers,
          body: bodyString,
        );
      } else {
        response = await client.post(
          uri,
          headers: API.headers,
          body: bodyString,
        );
      }

      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      final message = jsonObject['message'] as String?;
      final result = (jsonObject['result'] is int) ? jsonObject['result'] as int : null;
      return APIResponse(
        statusCode: response.statusCode,
        result: result,
        message: message,
      );
    } catch (_, __) {
      rethrow;
    }
  }
}
