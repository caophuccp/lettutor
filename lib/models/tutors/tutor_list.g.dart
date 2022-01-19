// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorList _$TutorListFromJson(Map<String, dynamic> json) => TutorList(
      tutors: json['tutors'] == null
          ? null
          : Tutors.fromJson(json['tutors'] as Map<String, dynamic>),
      favoriteTutor: (json['favoriteTutor'] as List<dynamic>?)
          ?.map((e) => FavoriteTutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorListToJson(TutorList instance) => <String, dynamic>{
      'tutors': instance.tutors,
      'favoriteTutor': instance.favoriteTutor,
    };

Tutors _$TutorsFromJson(Map<String, dynamic> json) => Tutors(
      count: json['count'] as int,
      rows: (json['rows'] as List<dynamic>)
          .map((e) => Tutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorsToJson(Tutors instance) => <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };
