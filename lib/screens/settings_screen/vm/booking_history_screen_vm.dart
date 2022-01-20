import 'package:flutter/material.dart';
import 'package:lettutor/api/schedule_apis.dart';
import 'package:lettutor/extensions/datetime_extension.dart';
import 'package:lettutor/models/schedule/upcoming_schedule.dart';

class BookingHistoryScreenVM extends ChangeNotifier {
  String? errorMessage;
  List<Booking>? bookedList;
  List<BookingDateGroup>? bookedGroups;

  final _batchSize = 9;
  int _page = 1;
  bool hasMore = false;

  int get dateTimeLte {
    return DateTime.now().subtract(Duration(minutes: 5)).millisecondsSinceEpoch;
  }

  void removeError() {
    errorMessage = null;
    notifyListeners();
  }

  void fetchData() async {
    try {
      final response = await ScheduleAPIs.getBookedList(
        perPage: _batchSize,
        page: _page,
        dateTimeLte: dateTimeLte,
        sortBy: 'desc',
      );

      if (response.result != null) {
        bookedList = response.result?.rows;
        hasMore = (response.result?.rows.length ?? 0) == _batchSize;
        groupByDate();
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

  Future<void> loadMore() async {
    _page += 1;
    try {
      final response = await ScheduleAPIs.getBookedList(
        perPage: _batchSize,
        page: _page,
        dateTimeLte: dateTimeLte,
        sortBy: 'desc',
      );
      if (response.result != null) {
        final rows = response.result?.rows;
        if (rows != null) {
          bookedList?.addAll(rows);
        }
        hasMore = (response.result?.rows.length ?? 0) == _batchSize;
        groupByDate();
      } else {
        errorMessage = response.message;
      }
    } catch (e, s) {
      print(e);
      print(s);
      errorMessage = e.toString();
    }

    notifyListeners();
  }

  Future<void> refresh() async {
    _page = 1;

    try {
      final response = await ScheduleAPIs.getBookedList(
        perPage: _batchSize,
        page: _page,
        dateTimeLte: dateTimeLte,
        sortBy: 'desc',
      );
      if (response.result != null) {
        bookedList = response.result?.rows;
        hasMore = (response.result?.rows.length ?? 0) == _batchSize;
        groupByDate();
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

  void uniqueSchedules() {
    final Set<String> ids = {};
    bookedList?.retainWhere((e) => ids.add(e.scheduleDetailId));
  }

  void groupByDate() {
    uniqueSchedules();
    final bks = bookedList;
    if (bks == null) {
      return;
    }

    List<BookingDateGroup> groups = [];
    List<Booking> bid = [];
    DateTime date = DateTime.now();

    for (final b in bks) {
      final startDate = DateTime.fromMillisecondsSinceEpoch(
        b.scheduleDetailInfo.startPeriodTimestamp,
      );

      if (date.isSameDate(startDate)) {
        bid.add(b);
      } else {
        if (bid.isNotEmpty) {
          groups.add(BookingDateGroup(date: date, booking: bid));
        }
        date = startDate;
        bid = [b];
      }
    }

    groups.add(BookingDateGroup(date: date, booking: bid));
    bookedGroups = groups;

    notifyListeners();
  }
}
