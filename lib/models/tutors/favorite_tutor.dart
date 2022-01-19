import 'package:json_annotation/json_annotation.dart';

part 'favorite_tutor.g.dart';

@JsonSerializable()
class FavoriteTutor {
  String id;
  String? firstId;
  String? secondId;
  String? createdAt;
  String? updatedAt;
  SecondInfo? secondInfo;

  FavoriteTutor({
    required this.id,
    this.firstId,
    this.secondId,
    this.createdAt,
    this.updatedAt,
    this.secondInfo,
  });

  factory FavoriteTutor.fromJson(Map<String, dynamic> json) =>
      _$FavoriteTutorFromJson(json);
}

@JsonSerializable()
class SecondInfo {
  String? id;
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
  TutorInfo? tutorInfo;

  SecondInfo({
    required this.id,
    required this.level,
    required this.email,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.timezone,
    required this.isPhoneAuthActivated,
    required this.createdAt,
    required this.updatedAt,
    required this.tutorInfo,
  });

  factory SecondInfo.fromJson(Map<String, dynamic> json) =>
      _$SecondInfoFromJson(json);
}

@JsonSerializable()
class TutorInfo {
  String? id;
  String? userId;
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

  TutorInfo({
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    required this.isActivated,
    required this.isNative,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TutorInfo.fromJson(Map<String, dynamic> json) =>
      _$TutorInfoFromJson(json);
}
