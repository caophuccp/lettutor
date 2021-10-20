import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorInteractionsView extends StatelessWidget {
  const TutorInteractionsView({
    Key? key,
    this.messageAction,
    this.reportAction,
    this.reviewAction,
    this.favoriteAction
  }) : super(key: key);

  final void Function()? messageAction;
  final void Function()? reportAction;
  final void Function()? reviewAction;
  final void Function()? favoriteAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TutorInteractionButton(
          icon: Icons.chat_outlined,
          title: 'Message',
          color: Colors.blue,
          onTap: messageAction,
        ),

        TutorInteractionButton(
          icon: Icons.report_outlined,
          title: 'Report',
          color: Colors.red,
          onTap: reportAction,
        ),

        TutorInteractionButton(
          icon: Icons.rate_review_outlined,
          title: 'Review',
          color: Colors.orange.shade300,
          onTap: reviewAction,
        ),
        TutorInteractionButton(
          icon: Icons.favorite_border_rounded,
          title: 'Favorite',
          color: Colors.grey,
          onTap: favoriteAction,
        ),
      ],
    );
  }
}

class TutorInteractionButton extends StatelessWidget {
  const TutorInteractionButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    this.onTap
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            height: SpacingValue.small,
          ),
          Text(
            title,
            style: TextStyles.captionSemiBold.copyWith(
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
