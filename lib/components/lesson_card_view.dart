import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/text_expander.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_header.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class LessonCardView extends StatelessWidget {
  const LessonCardView({
    Key? key,
    this.margin,
    this.showTutorReview = true,
    this.isCancellable = false,
    this.onCancel,
    this.joinMeeting,
    this.directMessage,
    this.countdown = false,
    this.review = '',
    this.mark,
    required this.tutorAvatar,
    required this.tutorName,
    required this.startTime,
    required this.lessionTime,
    required this.request,
  }) : super(key: key);

  final String tutorName;
  final String tutorAvatar;
  final DateTime startTime;
  final String lessionTime;
  final String request;
  final String review;
  final double? mark;

  final EdgeInsetsGeometry? margin;
  final bool showTutorReview;
  final bool isCancellable;
  final bool countdown;
  final void Function()? onCancel;
  final void Function()? joinMeeting;
  final void Function()? directMessage;

  String get joinMeetingButtonText {
    final now = DateTime.now();
    if (startTime.isAfter(now)) {
      final seconds = startTime.difference(now).inSeconds;
      return 'Start in $seconds seconds';
    }
    return 'Join Meeting';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        border: Border.all(
          color: Theme.of(context).cardTheme.shadowColor ?? Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).cardTheme.shadowColor ?? Colors.transparent,
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(PaddingValue.large),
      margin: margin,
      child: Wrap(
        runSpacing: SpacingValue.large,
        children: [
          TutorInfoHeader(
            tutorAvatar: tutorAvatar,
            tutorName: tutorName,
            rating: null,
          ),
          Text(
            'Lesson Time: $lessionTime',
            style: TextStyles.subtitle1SemiBold,
          ),
          if (request.isNotEmpty)
            TextExpander(
              title: 'Request for lesson',
              content: request,
              isExpanded: true,
            ),
          if (mark != null)
            TextExpander(
              title: 'Mark',
              content: mark!.toStringAsFixed(0),
              isExpanded: true,
            ),
          if (showTutorReview && review.isNotEmpty)
            TextExpander(
              title: 'Review from tutor',
              content: review,
              isExpanded: true,
            ),
          Wrap(
            runSpacing: SpacingValue.medium,
            children: [
              // if (directMessage != null)
              //   BarButton(
              //     child: Text('Direct Message'),
              //     onPressed: directMessage,
              //     height: 40,
              //   ),
              if (joinMeeting != null)
                BarButton(
                  child: Text(joinMeetingButtonText),
                  onPressed: joinMeeting,
                  height: 40,
                ),
              if (isCancellable)
                BarButton(
                  height: 40,
                  onPressed: onCancel,
                  child: Text('Cancel'),
                  style: BarButtonStyle.destructive,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
