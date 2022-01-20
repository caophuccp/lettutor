import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/components/bar_button.dart';
import 'package:lettutor/components/navigation_back_button.dart';
import 'package:lettutor/components/tutor_screen/booking_date_picker.dart';
import 'package:lettutor/components/tutor_screen/booking_time_picker.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_view.dart';
import 'package:lettutor/components/tutor_screen/tutor_report_dialog.dart';
import 'package:lettutor/components/tutor_screen/tutor_reviews_dialog.dart';
import 'package:lettutor/components/tutor_screen/tutor_info_header.dart';
import 'package:lettutor/components/tutor_screen/tutor_interactions_view.dart';
import 'package:lettutor/config/global.dart';
import 'package:lettutor/extensions/snack_bar_extension.dart';
import 'package:lettutor/models/tutors/tutor.dart';
import 'package:lettutor/screens/tutors_screen/tutor_message_screen.dart';
import 'package:lettutor/screens/tutors_screen/tutor_schedule_screen.dart';
import 'package:lettutor/screens/tutors_screen/vm/tutor_profile_screen_vm.dart';
import 'package:lettutor/styles/consts.dart';
import 'package:lettutor/extensions/navigate_extensions.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class TutorProfileScreen extends StatefulWidget {
  const TutorProfileScreen({
    Key? key,
    required this.tutorId,
    this.tutor,
  }) : super(key: key);

  final String tutorId;
  final Tutor? tutor;

  @override
  _TutorProfileScreenState createState() => _TutorProfileScreenState();
}

class _TutorProfileScreenState extends State<TutorProfileScreen> {
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

  final vm = TutorProfileScreenVM();
  VideoPlayerController? _videoPlayerController;
  String? tutorVideoURl;

  @override
  void initState() {
    super.initState();

    vm.fetchData(widget.tutorId);
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    vm.dispose();

    super.dispose();
  }

  String get tutorAvatar {
    return vm.tutor?.user?.avatar ?? widget.tutor?.avatar ?? '';
  }

  String get tutorName {
    return vm.tutor?.user?.name ?? widget.tutor?.name ?? '';
  }

  String get tutorBio {
    return vm.tutor?.bio ?? widget.tutor?.bio ?? '';
  }

  String get tutorEducation {
    return vm.tutor?.education ?? widget.tutor?.education ?? '';
  }

  String get tutorExperience {
    return vm.tutor?.experience ?? widget.tutor?.experience ?? '';
  }

  String get tutorInterests {
    return vm.tutor?.interests ?? widget.tutor?.interests ?? '';
  }

  String get tutorLanguages {
    return vm.tutor?.languages ?? widget.tutor?.languages ?? '';
  }

  String get tutorProfession {
    return vm.tutor?.profession ?? widget.tutor?.profession ?? '';
  }

  String get tutorSpecialties {
    return vm.tutor?.specialties ?? widget.tutor?.specialties ?? '';
  }

  double? get tutorRating {
    return vm.tutor?.avgRating ?? widget.tutor?.rating;
  }

  Widget _tutorVideoWidget() {
    final videoURL = vm.tutor?.video ?? widget.tutor?.video;
    if (videoURL != null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
          videoURL,
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
          ),
        ),
      );
    }

    return Container(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<TutorProfileScreenVM>(builder: (_, __, ___) {
        final error = vm.errorMessage;
        if (error != null) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            vm.removeError();
            showSnackBarError(error);
          });
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                NavigationBackButton(),
                SizedBox(
                  height: SpacingValue.large,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 300,
                            minHeight: 0,
                          ),
                          child: _tutorVideoWidget(),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: PaddingValue.extraLarge,
                              vertical: PaddingValue.large),
                          child: Wrap(
                            runSpacing: SpacingValue.large,
                            children: [
                              TutorInfoHeader(
                                tutorAvatar: tutorAvatar,
                                tutorName: tutorName,
                                rating: tutorRating,
                              ),
                              BarButton(
                                onPressed: showSchedule,
                                child: Text('Schedule'),
                                height: 44,
                                cornerRadius: CornerRadiusValue.medium,
                              ),
                              TutorInteractionsView(
                                messageAction: directMessage,
                                reportAction: report,
                                reviewAction: showReview,
                                favoriteAction: toggleFavorite,
                                isFavorite: vm.tutor?.isFavorite ??
                                    widget.tutor?.isFavorite ??
                                    false,
                              ),
                              TutorInfoView(
                                bio: tutorBio,
                                education: tutorEducation,
                                experience: tutorExperience,
                                interests: tutorInterests,
                                languages: tutorLanguages,
                                profession: tutorProfession,
                                specialties: tutorSpecialties,
                              ),
                              SizedBox(
                                height: PaddingValue.large,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void booking() {
    selectDate();
  }

  void selectDate() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BookingDatePicker(
          selectDate: selectTime,
        );
      },
    );
  }

  void selectTime(DateTime date) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BookingTimePicker(
          selectTime: (_) {
            showError();
          },
        );
      },
    );
  }

  void showSchedule() {
    navigate(TutorScheduleScreen(
      tutorId: widget.tutorId,
      price: vm.tutor?.price ?? widget.tutor?.price ?? -1,
    ));
  }

  void showReview() {
    showDialog(
      context: context,
      builder: (_) => TutorReviewsDialog(
        feedbacks: vm.tutor?.user?.feedbacks ?? widget.tutor?.feedbacks ?? [],
      ),
    );
  }

  void directMessage() {
    navigate(TutorMessageScreen());
  }

  void report() {
    showDialog(
      context: context,
      builder: (_) => TutorReportDialog(),
    );
  }

  void toggleFavorite() {
    vm.toggleFavorite(widget.tutorId);
  }

  void showError() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text("Not enough money for booking.\nPlease try again"),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            isDefaultAction: true,
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
