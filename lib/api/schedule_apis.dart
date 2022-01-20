import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/api/api.dart';
import 'package:lettutor/models/schedule/schedule.dart';
import 'package:lettutor/models/schedule/upcoming_schedule.dart';

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

  static Future<APIResponse<BookingData>> getBookedList({
    required int page,
    required int perPage,
    final int? dateTimeGte,
    final int? dateTimeLte,
    String sortBy = 'asc',
    final http.Client? client,
  }) async {
    try {
      String url = API.baseAPI +
          '/booking/list/student?page=$page&perPage=$perPage&orderBy=meeting';
      if (dateTimeGte != null) {
        url += '&dateTimeGte=$dateTimeGte';
      }

      if (dateTimeLte != null) {
        url += '&dateTimeLte=$dateTimeLte';
      }

      url += '&sortBy=$sortBy';

      final uri = Uri.parse(url);
      final http.Response response;

      if (client == null) {
        response = await http.get(
          uri,
          headers: API.headers,
        );
      } else {
        response = await client.post(
          uri,
          headers: API.headers,
        );
      }

      final jsonObject = json.decode(utf8.decode(response.bodyBytes));
      final message = jsonObject['message'] as String?;
      final data = jsonObject['data'];
      final result = data == null ? null : BookingData.fromJson(data);

      return APIResponse(
        statusCode: response.statusCode,
        message: message,
        result: result,
      );
    } catch (_, __) {
      rethrow;
    }
  }
}
