import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/api/api.dart';
import 'package:lettutor/models/schedule/schedule.dart';

class ScheduleAPIs {
  ScheduleAPIs._();

  static Future<APIResponse<List<Schedule>>> getScheduleByTutorId({
    required String tutorId,
    final http.Client? client,
  }) async {
    final body = {"tutorId": tutorId};
    try {
      final url = API.baseAPI + '/schedule';
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
      final data = jsonObject['data'];
      if (data != null && data is List) {
        final result = List.generate(
          data.length,
          (index) => Schedule.fromJson(data[index]),
        );
        return APIResponse(
          statusCode: response.statusCode,
          result: result,
          message: message,
        );
      }
      return APIResponse(
        statusCode: response.statusCode,
        message: message,
      );
    } catch (_, __) {
      rethrow;
    }
  }

  static Future<APIResponse<void>> book({
    required List<String> scheduleDetailIds,
    required String note,
    final http.Client? client,
  }) async {
    final body = {
      "scheduleDetailIds": scheduleDetailIds,
      "note": note,
    };
    try {
      final url = API.baseAPI + '/booking';
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
      return APIResponse(
        statusCode: response.statusCode,
        message: message,
      );
    } catch (_, __) {
      rethrow;
    }
  }
}
