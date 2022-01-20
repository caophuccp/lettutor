import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/lmr_list_view.dart';
import 'package:lettutor/components/speciality_view.dart';
import 'package:lettutor/components/tutor_card_view.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/models/tutors/tutor.dart';
import 'package:lettutor/screens/tutors_screen/tutor_profile_screen.dart';
import 'package:lettutor/screens/tutors_screen/vm/tutors_screen_vm.dart';
import 'package:lettutor/styles/consts.dart';
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
    'Business English',
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

  void _filter(int selectedSpecialityIndex) {
    setState(() {
      _selectedSpecialityIndex = selectedSpecialityIndex;
    });

    if (selectedSpecialityIndex > 0) {
      vm.filter([specialities[selectedSpecialityIndex]]);
    } else {
      vm.filter([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<TutorsScreenVM>(builder: (_, __, ___) {
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
                              _filter(index);
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
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
              rating: tutor.rating,
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
    navigate(TutorProfileScreen(
      tutorId: tutor.id,
      tutor: tutor,
    ));
  }
}
