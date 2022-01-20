// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorDetail _$TutorDetailFromJson(Map<String, dynamic> json) => TutorDetail(
      id: json['id'] as String,
      userId: json['userId'] as String,
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
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool?,
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      price: json['price'] as int?,
    );

Map<String, dynamic> _$TutorDetailToJson(TutorDetail instance) =>
    <String, dynamic>{
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
      'User': instance.user,
      'isFavorite': instance.isFavorite,
      'avgRating': instance.avgRating,
      'price': instance.price,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
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
      feedbacks: (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => Feedbacks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
      'feedbacks': instance.feedbacks,
    };
