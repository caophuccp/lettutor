
import 'package:flutter/material.dart';
import 'package:lettutor/components/lesson_date_session.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class SessionHistoryScreen extends StatefulWidget {
  const SessionHistoryScreen({Key? key}) : super(key: key);

  @override
  _SessionHistoryScreenState createState() => _SessionHistoryScreenState();
}

class _SessionHistoryScreenState extends State<SessionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40,
              padding:
                  EdgeInsets.symmetric(horizontal: PaddingValue.extraLarge),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  NavigationBackButton(
                    title: '',
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Session History',
                      style: TextStyles.subtitle1SemiBold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LessonDateSession(date: 'Sat 23 Oct 21',),
                    LessonDateSession(date: 'Thu 21 Oct 21',),
                    LessonDateSession(date: 'Wed 20 Oct 21',),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  CustomScrollView(
//                 slivers: [
//                   SliverTextSubHeader(
//                     title: 'Sat 23 Oct 21',
//                   ),
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (_, index) => LessonCardView(),
//                       childCount: 3,
//                     ),
//                   ),
//                   SliverTextSubHeader(
//                     title: 'Fir 22 Oct 21',
//                   ),
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (_, index) => LessonCardView(),
//                       childCount: 3,
//                     ),
//                   ),
//                   SliverTextSubHeader(
//                     title: 'Thu 21 Oct 21',
//                   ),
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (_, index) => LessonCardView(),
//                       childCount: 3,
//                     ),
//                   ),
//                   SliverTextSubHeader(
//                     title: 'Wed 20 Oct 21',
//                   ),
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (_, index) => LessonCardView(),
//                       childCount: 3,
//                     ),
//                   ),
//                   SliverFillRemaining(
//                     child: Container(),
//                   ),
//                 ],
//               ),