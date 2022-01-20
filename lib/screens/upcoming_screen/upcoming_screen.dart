import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lettutor/components/lesson_card_view.dart';
import 'package:lettutor/components/lmr_list_view.dart';
import 'package:lettutor/extensions/datetime_extension.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/screens/upcoming_screen/meeting_screen.dart';
import 'package:lettutor/screens/upcoming_screen/vm/upcoming_screen_vm.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final vm = UpcomingScreenVM();
  Timer? _updater;

  @override
  void initState() {
    super.initState();

    vm.fetchData();

    countdown();
  }

  void countdown() {
    _updater = Timer(Duration(seconds: 1), () {
      setState(() {});

      countdown();
    });
  }

  @override
  void dispose() {
    _updater?.cancel();
    vm.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<UpcomingScreenVM>(builder: (_, __, ___) {
        final error = vm.errorMessage;
        if (error != null) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            vm.removeError();
            showSnackBarError(error);
          });
        }
        if (vm.bookedList == null) {
          return Scaffold(
            body: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    'Total lesson time is 12 hours 55 minutes',
                    style: TextStyles.subtitle1SemiBold
                        .copyWith(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                Expanded(
                  child: _buildListView(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildListView() {
    final items = vm.bookedGroups;
    if (items == null || items.isEmpty) {
      return Center(
        child: Text('No data'),
      );
    }

    return LMRListView(
      slivers: List.generate(items.length, (index) {
        final groupIndex = index;
        final item = items[groupIndex];

        return SliverStickyHeader(
          header: Container(
            height: 60.0,
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              item.date.string('EEE dd MMM yyyy'),
              style: TextStyles.subtitle1SemiBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                final data = item.booking[index];

                return LessonCardView(
                  margin: EdgeInsets.only(top: PaddingValue.large),
                  showTutorReview: false,
                  countdown: true,
                  isCancellable: true,
                  joinMeeting: () {
                    joinMeeting(data.id);
                  },
                  onCancel: () {
                    cancel(data.id);
                  },
                  directMessage: () {
                    directMessage(data.id);
                  },
                  lessionTime:
                      '${data.scheduleDetailInfo.startPeriod} - ${data.scheduleDetailInfo.endPeriod}',
                  request: data.studentRequest ?? '',
                  startTime: DateTime.fromMillisecondsSinceEpoch(
                      data.scheduleDetailInfo.startPeriodTimestamp),
                  tutorAvatar:
                      data.scheduleDetailInfo.scheduleInfo?.tutorInfo?.avatar ??
                          '',
                  tutorName:
                      data.scheduleDetailInfo.scheduleInfo?.tutorInfo?.name ??
                          '',
                );
              },
              childCount: item.booking.length,
            ),
          ),
        );
      }),
      hasMore: vm.hasMore,
      onLoadMore: loadMore,
      onRefresh: refresh,
    );
  }

  Future<void> loadMore() {
    return vm.loadMore();
  }

  Future<void> refresh() {
    return vm.refresh();
  }

  void cancel(String id) {
    print('upcoming_screen.dart - cancel - id: $id');
  }

  void joinMeeting(String id) {
    navigate(MeetingScreen());
  }

  void directMessage(String id) {
    print('upcoming_screen.dart - directMessage - id: $id');
  }
}
