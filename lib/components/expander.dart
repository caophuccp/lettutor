import 'package:flutter/material.dart';

import 'package:lettutor/components/expanded_session.dart';

class Expander extends StatefulWidget {
  Expander({
    Key? key,
    this.isExpanded = true,
    required this.expandedHeader,
    required this.collapsedHeader,
    required this.content,
  }) : super(key: key);

  final bool isExpanded;
  final Widget expandedHeader;
  final Widget collapsedHeader;
  final Widget content;

  @override
  _ExpanderState createState() =>
      _ExpanderState(isExpanded: this.isExpanded);
}

class _ExpanderState extends State<Expander> {
  _ExpanderState({
    this.isExpanded = false,
  }) : super();

  bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: isExpanded ? widget.expandedHeader : widget.collapsedHeader,
          onTap: toggle,
        ),
        ExpandedSection(
          expand: isExpanded,
          child: widget.content,
        ),
      ],
    );
  }

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}