import 'package:flutter/material.dart';
import 'package:lettutor/components/dialog_title.dart';
import 'package:lettutor/components/tutor_review_card.dart';
import 'package:lettutor/styles/consts.dart';

class TutorReviewsDialog extends StatelessWidget {
  const TutorReviewsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          DialogTitle(title: 'Ratings and Comment'),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(PaddingValue.large),
              itemBuilder: (context, index) => TutorReviewCard(
                tutorName: 'Yến Trần',
                tutorAvatar:
                    'https://dev.api.lettutor.com/avatar/3b994227-2695-44d4-b7ff-333b090a45d4avatar1632047402615.jpg',
                rating: 4.5,
                reviewContent:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
              ),
              itemCount: 2,
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
