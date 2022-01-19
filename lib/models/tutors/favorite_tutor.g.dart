// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteTutor _$FavoriteTutorFromJson(Map<String, dynamic> json) =>
    FavoriteTutor(
      id: json['id'] as String,
      firstId: json['firstId'] as String?,
      secondId: json['secondId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      secondInfo: json['secondInfo'] == null
          ? null
          : SecondInfo.fromJson(json['secondInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteTutorToJson(FavoriteTutor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'secondInfo': instance.secondInfo,
    };

SecondInfo _$SecondInfoFromJson(Map<String, dynamic> json) => SecondInfo(
      id: json['id'] as String?,
      level: json['level'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      timezone: json['timezone'] as int?,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      tutorInfo: json['tutorInfo'] == null
          ? null
          : TutorInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SecondInfoToJson(SecondInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'email': instance.email,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'requestPassword': instance.requestPassword,
      'isActivated': instance.isActivated,
      'timezone': instance.timezone,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tutorInfo': instance.tutorInfo,
    };

TutorInfo _$TutorInfoFromJson(Map<String, dynamic> json) => TutorInfo(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      isActivated: json['isActivated'] as bool?,
      isNative: json['isNative'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TutorInfoToJson(TutorInfo instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'isActivated': instance.isActivated,
      'isNative': instance.isNative,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
