import 'package:flutter/material.dart';
import 'package:lettutor/components/expander.dart';
import 'package:lettutor/components/lesson_card_view.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class LessonDateSession extends StatelessWidget {
  const LessonDateSession({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Expander(
      isExpanded: false,
      expandedHeader: Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.centerLeft,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: PaddingValue.large),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  date,
                  style: TextStyles.subtitle1SemiBold,
                ),
              ),
              Icon(
                Icons.arrow_left_rounded,
              ),
            ],
          ),
          color: Colors.grey.withAlpha(76),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      collapsedHeader: Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.centerLeft,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: PaddingValue.large),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  date,
                  style: TextStyles.subtitle1SemiBold,
                ),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
              ),
            ],
          ),
          color: Colors.grey.withAlpha(76),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: PaddingValue.large),
        child: Column(
          children: List.generate(
            3,
            (index) => LessonCardView(
              margin: EdgeInsets.only(top: PaddingValue.large),
            ),
          ),
        ),
      ),
    );
  }
}
