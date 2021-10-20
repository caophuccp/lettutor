import 'package:flutter/material.dart';
import 'package:lettutor/components/avatar.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorReviewCard extends StatelessWidget {
  TutorReviewCard({
    Key? key,
    required this.tutorName,
    required this.tutorAvatar,
    required this.rating,
    required this.reviewContent,
    this.margin,
  }) : super(key: key);

  final String tutorAvatar;
  final String tutorName;
  final double rating;
  final String reviewContent;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.zero,
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
      child: Container(
        padding: EdgeInsets.all(PaddingValue.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserAvatar(
                  size: 40,
                  imageUrl: tutorAvatar,
                ),
                SizedBox(
                  width: PaddingValue.medium,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              tutorName,
                              style: TextStyles.subtitle1SemiBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                rating.toStringAsFixed(1),
                                style: TextStyles.subtitle1SemiBold,
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Colors.yellow[600],
                                size: 20,
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: PaddingValue.small),
                        child: Text('15:55-22/10/2021', style: TextStyles.captionSemiBold,),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: PaddingValue.medium),
            Container(
              padding: EdgeInsets.only(top: PaddingValue.small),
              child: Text(
                reviewContent,
                style: TextStyles.subtitle1Regular,
              ),
            )
          ],
        ),
      ),
    );
  }
}
