import 'package:flutter/material.dart';
import 'package:lettutor/components/avatar.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorInfoHeader extends StatelessWidget {
  const TutorInfoHeader({
    Key? key,
    required this.tutorAvatar,
    required this.tutorName,
    required this.rating,
  }) : super(key: key);

  final String tutorAvatar;
  final String tutorName;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserAvatar(
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
                  if (rating != null)
                    Row(
                      children: [
                        Text(
                          rating!.toStringAsFixed(1),
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
              SizedBox(
                height: SpacingValue.medium,
              ),
              Text(
                'Viet Nam',
                style: TextStyles.subtitle1Regular,
              )
            ],
          ),
        ),
      ],
    );
  }
}
