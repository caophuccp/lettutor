import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/lmr_list_view.dart';
import 'package:lettutor/components/tutor_card_view.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/models/tutors/tutor.dart';
import 'package:lettutor/screens/home_screen/vm/home_screen_vm.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final vm = HomeScreenVM();

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
    super.build(context);

    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<HomeScreenVM>(builder: (_, __, ___) {
        final error = vm.errorMessage;
        if (error != null) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            vm.removeError();
            showSnackBarError(error);
          });
        }
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: PaddingValue.extraLarge,
                    vertical: PaddingValue.medium,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Recommended Tutors',
                        style: TextStyles.h6Bold,
                      ),
                      Icon(
                        Icons.arrow_right_rounded,
                        size: 30,
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

  Widget _buildListView() {
    final tutors = vm.tutors;
    if (tutors == null) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if (tutors.isEmpty) {
      return Center(
        child: Text(
          'No Tutors',
          style: TextStyles.subtitle2SemiBold,
        ),
      );
    }
    return LMRListView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) {
              final tutor = tutors[index];
              return TutorCardView(
                onTap: () {
                  showTutorProfile(tutor);
                },
                margin: EdgeInsets.fromLTRB(
                  PaddingValue.extraLarge,
                  PaddingValue.extraLarge,
                  PaddingValue.extraLarge,
                  0,
                ),
                tutorName: tutor.name ?? '',
                tutorAvatar: tutor.avatar ?? '',
                introduction: tutor.bio ?? '',
                rating: tutor.rating,
                specialities: (tutor.specialties ?? '').split(','),
              );
            },
            childCount: tutors.length,
          ),
        ),
      ],
      hasMore: vm.hasMore,
      onRefresh: refresh,
      onLoadMore: loadMore,
    );
  }

  Future<void> refresh() async {
    await vm.refresh();
  }

  Future<void> loadMore() async {
    await vm.loadMore();
  }

  void showTutorProfile(Tutor tutor) {
    navigate(
      TutorProfileScreen(
        tutorId: tutor.userId,
        tutor: tutor,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
