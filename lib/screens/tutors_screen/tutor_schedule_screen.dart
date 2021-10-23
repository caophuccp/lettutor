import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/tutor_screen/booking_details_dialog.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:intl/intl.dart';

class TutorScheduleScreen extends StatefulWidget {
  const TutorScheduleScreen({Key? key}) : super(key: key);

  @override
  _TutorScheduleScreenState createState() => _TutorScheduleScreenState();
}

class _TutorScheduleScreenState extends State<TutorScheduleScreen> {
  final timeBlocks = List.generate(40, (index) => scheduleTime(index));
  @override
  Widget build(BuildContext context) {
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
                  BarButton(
                    child: Text('Today'),
                    width: 120,
                    height: 40,
                    onPressed: () {},
                  ),
                  IconButton(icon: Icon(Icons.chevron_left), onPressed: () {}),
                  IconButton(icon: Icon(Icons.chevron_right), onPressed: () {}),
                  Text(
                    'OCT, 2021',
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
                          timeBlocks
                              .map(
                                (e) => Container(
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
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            7,
                            (index) => Column(
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
                                        scheduleDate(index),
                                        style: TextStyles.captionSemiBold,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ] +
                                  timeBlocks
                                      .map(
                                        (e) => Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 110,
                                          child: randomBookingWidget(),
                                        ),
                                      )
                                      .toList(),
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
  }

  final dateFormat = DateFormat('EEE\nMM/yyyy');
  final random = Random();

  Widget randomBookingWidget() {
    final value = random.nextInt(3);
    if (value == 0) {
      return BarButton(
        width: 80,
        height: 30,
        cornerRadius: 15,
        onPressed: book,
        child: Text('Book'),
      );
    }

    if (value == 1) {
      return BarButton(
        width: 80,
        height: 30,
        cornerRadius: 15,
        child: Text('Book'),
      );
    }

    return Container(
      width: 10,
      height: 10,
    );
  }

  void book() {
    showDialog(
      context: context,
      builder: (context) => BookingDetailsDialog(),
    );
  }

  String scheduleDate(int index) {
    return dateFormat.format(DateTime.now().add(Duration(days: index)));
  }

  static String scheduleTime(int index) {
    final h = index ~/ 2;
    final m = (index % 2) * 30;
    final hs = h < 10 ? '0$h' : '$h';
    final ms = m < 10 ? '0$m' : '$m';
    return '$hs:$ms - $hs:${m + 25}';
  }
}
