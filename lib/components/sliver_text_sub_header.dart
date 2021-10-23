import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';

class SliverTextSubHeader extends StatelessWidget {
  const SliverTextSubHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 40,
        maxHeight: 40,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(left: PaddingValue.large),
            alignment: Alignment.centerLeft,
            child: Text(title, style: TextStyles.subtitle1SemiBold,),
            color: Colors.grey.withAlpha(76),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  // 2
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  // 3
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
