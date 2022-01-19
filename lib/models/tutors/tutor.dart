import 'package:json_annotation/json_annotation.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor {
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
  int? price;
  bool? isOnline;

  Tutor({
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
    required this.feedbacks,
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
    required this.price,
    required this.isOnline,
  });

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
}

@JsonSerializable()
class Feedbacks {
  String id;
  String? bookingId;
  String? firstId;
  String? secondId;
  int? rating;
  String? content;
  String? createdAt;
  String? updatedAt;
  FirstInfo? firstInfo;

  Feedbacks({
    required this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  factory Feedbacks.fromJson(Map<String, dynamic> json) =>
      _$FeedbacksFromJson(json);
}

@JsonSerializable()
class FirstInfo {
  String? level;
  String? email;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  int? timezone;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;

  FirstInfo({
    this.level,
    this.email,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.timezone,
    this.isPhoneAuthActivated,
    this.createdAt,
    this.updatedAt,
  });

  factory FirstInfo.fromJson(Map<String, dynamic> json) =>
      _$FirstInfoFromJson(json);
}
