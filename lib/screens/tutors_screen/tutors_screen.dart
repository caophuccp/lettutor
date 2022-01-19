import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/lmr_list_view.dart';
import 'package:lettutor/components/speciality_view.dart';
import 'package:lettutor/components/tutor_card_view.dart';
import 'package:lettutor/models/tutors/tutor.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/screens/tutors_screen/vm/tutors_screen_vm.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:lettutor/styles/text_styles.dart';
import 'package:provider/provider.dart';

class TutorsScreen extends StatefulWidget {
  @override
  _TutorsScreenState createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  final specialities = [
    'All',
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOEFL',
    'TOEIC',
  ];
  int _selectedSpecialityIndex = 0;

  final vm = TutorsScreenVM();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    vm.fetchData();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    vm.dispose();

    super.dispose();
  }

  void _onSearchChanged(String query) {

    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      vm.search(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<TutorsScreenVM>(builder: (_, __, ___) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: PaddingValue.large),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: PaddingValue.extraLarge,
                        ),
                        child: CupertinoSearchTextField(
                          onChanged: _onSearchChanged,
                        ),
                      ),
                      Container(
                        height: 52,
                        padding: EdgeInsets.only(top: PaddingValue.large),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: PaddingValue.extraLarge,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: specialities.length,
                          itemBuilder: (context, index) => SpecialityView(
                            speciality: specialities.elementAt(index),
                            isActive: index == _selectedSpecialityIndex,
                            onTap: () {
                              setState(() {
                                _selectedSpecialityIndex = index;
                              });
                            },
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: SpacingValue.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (vm.isSearching)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                      ),
                      child: CupertinoActivityIndicator(),
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
      sliverList: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final tutor = tutors[index];
            return TutorCardView(
              onTap: () {
                viewTutorProfile(tutor);
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
              rating: 4.8,
              specialities: tutor.specialties?.split(',') ?? [],
            );
          },
          childCount: tutors.length,
        ),
      ),
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

  void viewTutorProfile(Tutor tutor) {
    // navigate(TutorProfileScreen(
    //   tutor: tutor,
    // ));
  }
}
