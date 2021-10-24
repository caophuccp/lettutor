import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class DocumentCardView extends StatelessWidget {
  DocumentCardView({
    Key? key,
    this.margin,
    this.onTap,
    required this.imageUrl,
    required this.title,
    required this.level,
    required this.description,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;

  final String imageUrl;
  final String title;
  final String level;
  final String description;
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
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(CornerRadiusValue.medium),
                      child: CachedNetworkImage(
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        imageUrl: imageUrl,
                        placeholder: (_, __) => Icon(
                          Icons.menu_book_rounded,
                          size: 50,
                        ),
                        errorWidget: (_, __, ___) => Icon(
                          Icons.menu_book_rounded,
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SpacingValue.medium,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyles.subtitle1SemiBold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: SpacingValue.small,
                        ),
                        Text(
                          level,
                          style: TextStyles.captionRegular,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: SpacingValue.medium,
                ),
                Text(
                  description,
                  style: TextStyles.subtitle2Regular,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
