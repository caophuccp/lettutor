import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/api/schedule_apis.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/models/schedule/schedule.dart';

class TutorScheduleScreenVM extends ChangeNotifier {
  String? errorMessage;
  http.Client? client;
  List<Schedule>? schedules;
  List<Schedule>? filteredSchedules;

  DateTime startDate = DateTime.now();

  void removeError() {
    errorMessage = null;
    notifyListeners();
  }

  void fetchData(String tutorId) async {
    try {
      final response = await ScheduleAPIs.getScheduleByTutorId(
        tutorId: tutorId,
      );

      final result = response.result;
      if (result != null) {
        schedules = result;
        filter();
      } else {
        errorMessage = response.message;
        print(errorMessage);
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    client?.close();
    super.dispose();
  }

  void filter() {
    final startTime = DateTime(startDate.year, startDate.month, startDate.day);
    final startTimestamp = startTime.millisecondsSinceEpoch;
    final endTimestamp =
        startTime.add(Duration(days: 7)).millisecondsSinceEpoch;
    filteredSchedules = schedules
        ?.where((e) =>
            (e.startTimestamp > startTimestamp) &&
            (e.startTimestamp < endTimestamp))
        .toList();
    notifyListeners();
  }

  void prevWeek() {
    startDate = startDate.subtract(Duration(days: 7));
    filter();
  }

  void nextWeek() {
    startDate = startDate.add(Duration(days: 7));
    filter();
  }

  Future<bool> book(Schedule schedule, String note) async {
    bool result = false;
    final scheduleDetailId = schedule.scheduleDetails?.last.id;
    if (scheduleDetailId == null) {
      errorMessage = 'scheduleDetailId null';
      notifyListeners();
      return false;
    }
    try {
      final response = await ScheduleAPIs.book(
        scheduleDetailIds: [scheduleDetailId],
        note: note,
      );

      final message = response.message;
      if ('Book successful' == message) {
        result = true;
        schedule.isBooked = true;
        Global.reloadUserInfo();
      } else {
        errorMessage = message;
        print(errorMessage);
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    }
    notifyListeners();

    return result;
  }
}
