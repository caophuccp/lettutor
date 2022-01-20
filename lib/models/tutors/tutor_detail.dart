import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/tutors/tutor.dart';

part 'tutor_detail.g.dart';

@JsonSerializable()
class TutorDetail {
  String id;
  String userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  bool? isActivated;
  bool? isNative;
  String? createdAt;
  String? updatedAt;

  @JsonKey(name: 'User')
  User? user;
  bool? isFavorite;
  double? avgRating;
  int? price;

  TutorDetail({
    required this.id,
    required this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.isActivated,
    this.isNative,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.isFavorite,
    this.avgRating,
    this.price,
  });

  factory TutorDetail.fromJson(Map<String, dynamic> json) =>
      _$TutorDetailFromJson(json);
}

@JsonSerializable()
class User {
  final String id;
  String? level;
  String? email;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  int? timezone;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  List<Feedbacks>? feedbacks;

  User({
    required this.id,
    this.level,
    this.email,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.timezone,
    this.isPhoneAuthActivated,
    this.createdAt,
    this.updatedAt,
    this.feedbacks,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
