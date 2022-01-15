import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  WalletInfo? walletInfo;
  // List<Null>? courses;
  // Null requireNote;
  String? level;
  List<LearnTopics>? learnTopics;
  // List<Null>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;

  User({
    required this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.walletInfo,
    // this.courses,
    // this.requireNote,
    this.level,
    this.learnTopics,
    // this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class WalletInfo {
  String id;
  String userId;
  String? amount;
  bool? isBlocked;
  String createdAt;
  String? updatedAt;
  int? bonus;

  WalletInfo({
    required this.id,
    required this.userId,
    this.amount,
    this.isBlocked,
    required this.createdAt,
    this.updatedAt,
    this.bonus,
  });

  factory WalletInfo.fromJson(Map<String, dynamic> json) =>
      _$WalletInfoFromJson(json);
}

@JsonSerializable()
class LearnTopics {
  int id;
  String key;
  String name;

  LearnTopics({
    required this.id,
    required this.key,
    required this.name,
  });

  factory LearnTopics.fromJson(Map<String, dynamic> json) =>
      _$LearnTopicsFromJson(json);
}
