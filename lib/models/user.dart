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
  List<LearnTopic>? learnTopics;
  List<TestPreparation>? testPreparations;
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
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    List<String>? roles,
    String? language,
    String? birthday,
    bool? isActivated,
    WalletInfo? walletInfo,
    String? level,
    List<LearnTopic>? learnTopics,
    List<TestPreparation>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles?.toList(),
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      isActivated: isActivated ?? this.isActivated,
      walletInfo: walletInfo ?? this.walletInfo?.copyWith(),
      level: level ?? this.level,
      learnTopics:
          learnTopics ?? this.learnTopics?.map((e) => e.copyWith()).toList(),
      testPreparations: testPreparations ??
          this.testPreparations?.map((e) => e.copyWith()).toList(),
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      timezone: timezone ?? this.timezone,
    );
  }
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

  WalletInfo copyWith({
    String? id,
    String? userId,
    String? amount,
    bool? isBlocked,
    String? createdAt,
    String? updatedAt,
    int? bonus,
  }) {
    return WalletInfo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bonus: bonus ?? this.bonus,
    );
  }
}

@JsonSerializable()
class LearnTopic {
  int id;
  String key;
  String name;

  LearnTopic({
    required this.id,
    required this.key,
    required this.name,
  });

  factory LearnTopic.fromJson(Map<String, dynamic> json) =>
      _$LearnTopicFromJson(json);

  LearnTopic copyWith({
    int? id,
    String? key,
    String? name,
  }) {
    return LearnTopic(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
    );
  }

  static List<LearnTopic> allValues = [
    LearnTopic(id: 3, name: 'Business English', key: 'business-english'),
    LearnTopic(id: 4, name: 'English for Kids', key: 'english-for-kids'),
    LearnTopic(
        id: 5, name: 'Conversational English', key: 'conversational-english')
  ];
}

@JsonSerializable()
class TestPreparation {
  int id;
  String key;
  String name;

  TestPreparation({
    required this.id,
    required this.key,
    required this.name,
  });

  factory TestPreparation.fromJson(Map<String, dynamic> json) =>
      _$TestPreparationFromJson(json);

  TestPreparation copyWith({
    int? id,
    String? key,
    String? name,
  }) {
    return TestPreparation(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
    );
  }

  static List<TestPreparation> allValues = [
    TestPreparation(id: 1, name: 'STARTERS', key: 'starters'),
    TestPreparation(id: 2, name: 'MOVERS', key: 'movers'),
    TestPreparation(id: 3, name: 'FLYERS', key: 'flyers'),
    TestPreparation(id: 4, name: 'KET', key: 'ket'),
  ];
}
