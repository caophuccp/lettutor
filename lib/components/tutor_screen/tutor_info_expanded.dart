import 'package:flutter/material.dart';
import 'package:lettutor/components/expanded_session.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TutorInfoExpanded extends StatefulWidget {
  TutorInfoExpanded({
    Key? key,
    this.isExpanded = true,
    required this.title,
    required this.content,
  }) : super(key: key);

  final bool isExpanded;
  final String title;
  final String content;

  @override
  _TutorInfoExpandedState createState() =>
      _TutorInfoExpandedState(isExpanded: this.isExpanded);
}

class _TutorInfoExpandedState extends State<TutorInfoExpanded> {
  _TutorInfoExpandedState({
    this.isExpanded = false,
  }) : super();

  bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyles.subtitle1SemiBold,
              ),
              Icon(
                isExpanded
                    ? Icons.arrow_drop_down_rounded
                    : Icons.arrow_left_rounded,
              )
            ],
          ),
          ExpandedSection(
            expand: isExpanded,
            child: Container(
              padding: EdgeInsetsDirectional.only(start: PaddingValue.large, top: PaddingValue.small),
              child: Text(
                widget.content,
                style: TextStyles.subtitle2Regular,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}