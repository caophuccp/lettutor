import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lettutor/components/expander.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class TextExpander extends StatefulWidget {
  const TextExpander({
    Key? key,
    this.isExpanded = false,
    this.titleStyle = TextStyles.subtitle1SemiBold,
    this.contentStyle = TextStyles.subtitle1Regular,
    required this.title,
    required this.content,
  }) : super(key: key);

  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final bool isExpanded;
  final String title;
  final String content;

  @override
  _TextExpanderState createState() => _TextExpanderState();
}

class _TextExpanderState extends State<TextExpander> {
  @override
  Widget build(BuildContext context) {
    return Expander(
      isExpanded: widget.isExpanded,
      collapsedHeader: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: widget.titleStyle,
            ),
          ),
          Icon(
            Icons.arrow_left_rounded,
          ),
        ],
      ),
      expandedHeader: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: widget.titleStyle,
            ),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
          ),
        ],
      ),
      content: Container(
        padding: EdgeInsets.only(left: PaddingValue.medium),
        child: Text(
          widget.content,
          style: widget.contentStyle,
        ),
      ),
    );
  }
}
