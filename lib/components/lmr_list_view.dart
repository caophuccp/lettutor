import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LMRListView extends StatefulWidget {
  const LMRListView({
    Key? key,
    required this.slivers,
    required this.hasMore,
    this.onLoadMore,
    this.onRefresh,
  }) : super(key: key);

  final List<Widget> slivers;
  final bool hasMore;
  final Future<void> Function()? onLoadMore;
  final Future<void> Function()? onRefresh;

  @override
  _LMRListViewState createState() => _LMRListViewState();
}

class _LMRListViewState extends State<LMRListView> {
  static const double _endReachedThreshold = 200;
  final ScrollController scrollController = ScrollController();
  bool _isLoadingMore = false;
  Timer? _scrollThrottle;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollThrottle?.cancel();
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        if (widget.onRefresh != null)
          CupertinoSliverRefreshControl(
            onRefresh: widget.onRefresh,
          ),
        ...widget.slivers,
        if (widget.hasMore)
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant LMRListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkLoadMore();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkLoadMore();
    });
  }

  void _onScroll() {
    checkLoadMore();
  }

  void checkLoadMore() {
    if (_scrollThrottle?.isActive ?? false) {
      return;
    }
    if (!scrollController.hasClients ||
        _isLoadingMore ||
        widget.onLoadMore == null ||
        !widget.hasMore) {
      return;
    }

    if (scrollController.position.extentAfter < _endReachedThreshold) {
      loadMore();
    }

    _scrollThrottle = Timer(const Duration(milliseconds: 250), () {});
  }

  void loadMore() {
    setState(() {
      _isLoadingMore = true;
    });
    widget.onLoadMore?.call().then((_) {
      setState(() {
        _isLoadingMore = false;
      });
    });
  }
}
