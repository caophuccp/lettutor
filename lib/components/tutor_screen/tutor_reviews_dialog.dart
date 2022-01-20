import 'package:flutter/material.dart';
import 'package:lettutor/components/dialog_title.dart';
import 'package:lettutor/components/tutor_review_card.dart';
import 'package:lettutor/models/tutors/tutor.dart';
import 'package:lettutor/styles/consts.dart';

class TutorReviewsDialog extends StatelessWidget {
  const TutorReviewsDialog({
    Key? key,
    required this.feedbacks,
  }) : super(key: key);

  final List<Feedbacks> feedbacks;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          DialogTitle(title: 'Ratings and Comment'),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(PaddingValue.large),
              itemBuilder: (context, index) {
                final feedback = feedbacks[index];
                return TutorReviewCard(
                  tutorName: feedback.firstInfo?.name ?? '',
                  tutorAvatar: feedback.firstInfo?.avatar ?? '',
                  rating: feedback.rating,
                  reviewContent: feedback.content,
                );
              },
              itemCount: feedbacks.length,
              separatorBuilder: (_, index) => SizedBox(
                height: PaddingValue.large,
              ),
            ),
          )
        ],
      ),
    );
  }
}
