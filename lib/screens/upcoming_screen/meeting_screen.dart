import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lettutor/components/avatar.dart';
import 'package:lettutor/components/circle_icon_button.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:lettutor/extensions/duration_extensions.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final tutorAvatar =
      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg';
  final tutorName = 'April Corpuz';
  final startTime = DateTime.now().add(Duration(seconds: 5));
  bool started = false;
  String waitingTime = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    calcWaitingtime();
    _timer = Timer.periodic(Duration(seconds: 1), timerBlock);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void timerBlock(Timer timer) {
    calcWaitingtime();
  }

  void calcWaitingtime() {
    final duration = startTime.difference(DateTime.now());
    if (duration.inSeconds < 1) {
      started = true;
      _timer.cancel();
      _timer.cancel();
    } else {
      waitingTime = duration.toDDHHmmss();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            started
                ? Expanded(
                    child: Center(
                      child: UserAvatar(
                        imageUrl: tutorAvatar,
                        size: 150,
                      ),
                    ),
                  )
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: SpacingValue.extraLarge,
                        ),
                        UserAvatar(imageUrl: tutorAvatar),
                        SizedBox(
                          height: SpacingValue.medium,
                        ),
                        Text(
                          tutorName,
                          style: TextStyles.subtitle1SemiBold,
                        ),
                        Spacer(),
                        Text(
                          'Starts in $waitingTime',
                          style: TextStyles.subtitle1Regular,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleIconButton(
                  icon: Icons.mic,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onPressed: () {},
                ),
                CircleIconButton(
                  icon: Icons.call_end,
                  backgroundColor: Colors.red,
                  iconColor: Colors.white,
                  onPressed: end,
                ),
                CircleIconButton(
                  icon: Icons.camera_alt_outlined,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void dismiss() {
    Navigator.of(context).pop();
  }

  void end() {
    dismiss();
  }
}
