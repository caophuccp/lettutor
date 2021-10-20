import 'package:flutter/material.dart';

class TutorScheduleScreen extends StatefulWidget {
  const TutorScheduleScreen({ Key? key }) : super(key: key);

  @override
  _TutorScheduleScreenState createState() => _TutorScheduleScreenState();
}

class _TutorScheduleScreenState extends State<TutorScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Schedule'),),
    );
  }
}