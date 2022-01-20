import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lettutor/components/lesson_card_view.dart';
import 'package:lettutor/components/lesson_date_session.dart';
import 'package:lettutor/components/lmr_list_view.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/extensions/datetime_extension.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/screens/settings_screen/vm/booking_history_screen_vm.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:provider/provider.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  _BookingHistoryScreenState createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  final vm = BookingHistoryScreenVM();

  @override
  void initState() {
    super.initState();

    vm.fetchData();
  }

  @override
  void dispose() {
    vm.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<BookingHistoryScreenVM>(builder: (_, __, ___) {
        final error = vm.errorMessage;
        if (error != null) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            vm.removeError();
            showSnackBarError(error);
          });
        }
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      NavigationBackButton(
                        title: '',
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Booking History',
                          style: TextStyles.subtitle1SemiBold,
                        ),
                      ),
                    ],
                  ),
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

  void cancel(String id) {
    print('booking_history_screen.dart - cancel - id: $id');
  }

  Widget _buildListView() {
    final items = vm.bookedGroups;
    if (vm.bookedList == null) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (items == null || items.isEmpty) {
      return Center(
        child: Text('No data'),
      );
    }

    return LMRListView(
      slivers: List.generate(items.length, (index) {
        final item = items[index];

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
            delegate: SliverChildBuilderDelegate((_, index) {
              final data = item.booking[index];

              return LessonCardView(
                margin: EdgeInsets.only(top: PaddingValue.large),
                showTutorReview: true,
                countdown: false,
                isCancellable: false,
                mark: data.scoreByTutor,
                onCancel: () {
                  cancel(data.id);
                },
                lessionTime:
                    '${data.scheduleDetailInfo.startPeriod} - ${data.scheduleDetailInfo.endPeriod}',
                request: data.studentRequest ?? '',
                review: data.tutorReview ?? '',
                startTime: DateTime.fromMillisecondsSinceEpoch(
                    data.scheduleDetailInfo.startPeriodTimestamp),
                tutorAvatar:
                    data.scheduleDetailInfo.scheduleInfo?.tutorInfo?.avatar ??
                        '',
                tutorName:
                    data.scheduleDetailInfo.scheduleInfo?.tutorInfo?.name ?? '',
              );
            }, childCount: item.booking.length),
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
}
