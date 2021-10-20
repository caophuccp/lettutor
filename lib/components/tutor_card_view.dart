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
    this.onTap,
  }) : super(key: key);

  final String tutorAvatar;
  final String tutorName;
  final String introduction;
  final double rating;
  final bool favoriteTutor;
  final List<String> specialities;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

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
      child: Material(
        borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(CornerRadiusValue.medium),
          child: Container(
            padding: EdgeInsets.all(PaddingValue.large),
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
          ),
        ),
      ),
    );
  }
}
