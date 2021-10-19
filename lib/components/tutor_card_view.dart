import 'package:flutter/material.dart';
import 'package:lettutor/components/speciality_view.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

import 'avatar.dart';

class TutorCardView extends StatelessWidget {
  TutorCardView({
    Key? key,
    required this.tutorName,
    required this.tutorAvatar,
    required this.introduction,
    required this.rating,
    required this.specialities,
    this.favoriteTutor = false,
    this.margin,
  }) : super(key: key);

  final String tutorAvatar;
  final String tutorName;
  final String introduction;
  final double rating;
  final bool favoriteTutor;
  final List<String> specialities;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(PaddingValue.large),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
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
                        if (favoriteTutor)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: PaddingValue.medium,
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 16,
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
                      height: 40,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: PaddingValue.medium,
                          children: specialities
                              .map((e) => SpecialityView(
                                    speciality: e,
                                    onTap: null,
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: PaddingValue.medium),
          Container(
            child: Text(
              introduction,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.subtitle2Regular,
            ),
          )
        ],
      ),
    );
  }
}
