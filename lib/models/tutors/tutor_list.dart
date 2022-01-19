import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/tutors/favorite_tutor.dart';
import 'package:lettutor/models/tutors/tutor.dart';

part 'tutor_list.g.dart';

@JsonSerializable()
class TutorList {
  Tutors? tutors;
  List<FavoriteTutor>? favoriteTutor;

  TutorList({this.tutors, this.favoriteTutor});

  factory TutorList.fromJson(Map<String, dynamic> json) =>
      _$TutorListFromJson(json);
}

@JsonSerializable()
class Tutors {
  int count;
  List<Tutor> rows;

  Tutors({
    required this.count,
    required this.rows,
  });

  factory Tutors.fromJson(Map<String, dynamic> json) => _$TutorsFromJson(json);
}
