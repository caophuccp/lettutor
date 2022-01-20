import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/tutor_screen/booking_details_dialog.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/models/schedule/schedule.dart';
import 'package:lettutor/screens/tutors_screen/vm/tutor_schedule_screen_vm.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TutorScheduleScreen extends StatefulWidget {
  const TutorScheduleScreen({
    Key? key,
    required this.tutorId,
    required this.price,
  }) : super(key: key);

  final String tutorId;
  final int price;

  @override
  _TutorScheduleScreenState createState() => _TutorScheduleScreenState();
}

class _TutorScheduleScreenState extends State<TutorScheduleScreen> {
  static List<DateTime> get getTimeBlocks {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day, 7, 0);
    return List.generate(
      30,
      (index) => startDate.add(
        Duration(
          minutes: 30 * index,
        ),
      ),
    );
  }

  final dateFormat = DateFormat('EEE\ndd/MM/yyyy');
  final timeFormat = DateFormat('HH:mm');
  final monthFormat = DateFormat('MMM, yyyy');

  final timeBlocks = getTimeBlocks;
  final vm = TutorScheduleScreenVM();

  @override
  void initState() {
    super.initState();

    vm.fetchData(widget.tutorId);
  }

  @override
  void dispose() {
    vm.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<TutorScheduleScreenVM>(builder: (_, __, ___) {
        final error = vm.errorMessage;
        if (error != null) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            vm.removeError();
            showSnackBarError(error);
          });
        }

        if (vm.schedules == null) {
          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  NavigationBackButton(),
                  Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                NavigationBackButton(),
                SizedBox(
                  height: SpacingValue.large,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: PaddingValue.extraLarge),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: nextWeek,
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: prevWeek,
                      ),
                      Text(
                        monthFormat.format(vm.startDate),
                        style: TextStyles.subtitle1SemiBold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SpacingValue.large,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(bottom: PaddingValue.extraLarge),
                    child: Row(
                      children: [
                        Column(
                          children: [
                                Container(
                                  height: 60,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ] +
                              List.generate(timeBlocks.length, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 110,
                                  child: Text(scheduleTime(index)),
                                );
                              }),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                7,
                                (column) => Column(
                                  children: [
                                        Container(
                                          height: 60,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            scheduleDate(column),
                                            style: TextStyles.captionSemiBold,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ] +
                                      List.generate(
                                        timeBlocks.length,
                                        (row) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 110,
                                            child: bookingWidget(row, column),
                                          );
                                        },
                                      ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget bookingWidget(int row, int column) {
    final time = timeBlocks[row];
    final date = vm.startDate.add(Duration(days: column));
    final start =
        DateTime(date.year, date.month, date.day, time.hour, time.minute)
            .subtract(Duration(seconds: 1));
    final end = start.add(Duration(minutes: 20));
    final sts = start.millisecondsSinceEpoch;
    final ets = end.millisecondsSinceEpoch;

    final schedules = vm.filteredSchedules
        ?.where((e) => e.startTimestamp >= sts && e.startTimestamp < ets)
        .toList();
    if (schedules == null || schedules.isEmpty) {
      return Container(
        width: 10,
        height: 10,
      );
    }

    final schedule = schedules.first;

    if (schedule.isBooked) {
      return Center(
        child: Text("Booked"),
      );
    }

    return BarButton(
      width: 80,
      height: 30,
      cornerRadius: 15,
      onPressed: schedule.endTimestamp < DateTime.now().millisecondsSinceEpoch
          ? null
          : () {
              book(schedule);
            },
      child: Text('Book'),
    );
  }

  void book(Schedule schedule) async {
    final String? note = await showDialog(
      context: context,
      builder: (context) => BookingDetailsDialog(
        schedule: schedule,
        price: widget.price,
      ),
    );
    if (note != null) {
      final success = await vm.book(schedule, note);
      if (success) {
        showSnackBarInfo('Booking success');
      }
    }
  }

  String scheduleDate(int index) {
    return dateFormat.format(vm.startDate.add(Duration(days: index)));
  }

  String scheduleTime(int index) {
    final start = timeBlocks[index];
    final end = start.add(Duration(minutes: 30));
    return timeFormat.format(start) + ' - ' + timeFormat.format(end);
  }

  void nextWeek() {
    vm.nextWeek();
  }

  void prevWeek() {
    vm.prevWeek();
  }
}
