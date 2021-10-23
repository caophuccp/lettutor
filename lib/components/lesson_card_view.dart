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
  }) : super(key: key);
  final tutorNameTest = 'April Corpuz';
  final tutorEmailTest = 'aprilcorpuz@email.com';
  final tutorAvatarTest =
      'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg';

  final EdgeInsetsGeometry? margin;
  final bool showTutorReview;
  final bool isCancellable;
  final bool countdown;
  final void Function()? onCancel;
  final void Function()? joinMeeting;
  final void Function()? directMessage;

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
            tutorAvatar: tutorAvatarTest,
            tutorName: tutorNameTest,
          ),
          Text(
            'Lesson Time: 07:00-07:25',
            style: TextStyles.subtitle1SemiBold,
          ),
          TextExpander(
            title: 'Request for lesson',
            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          ),
          if (showTutorReview)
            TextExpander(
              title: 'Review from tutor',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            ),
          Wrap(
            runSpacing: SpacingValue.medium,
            children: [
              if (directMessage != null)
                BarButton(
                  child: Text('Direct Message'),
                  onPressed: directMessage,
                  height: 40,
                ),
              if (joinMeeting != null)
                BarButton(
                  child: Text(countdown ? 'Start in 5 seconds' : 'Join Meeting'),
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
