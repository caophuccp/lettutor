// To parse this JSON data, do
//
//     final Tutor = TutorFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Tutor> tutorsFromJson(String str) => List<Tutor>.from(json.decode(str).map((x) => Tutor.fromMap(x)));

String tutorsToJson(List<Tutor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Tutor {
    Tutor({
        required this.level,
        required this.email,
        required this.google,
        required this.facebook,
        required this.apple,
        required this.avatar,
        required this.name,
        required this.country,
        required this.phone,
        required this.language,
        required this.birthday,
        required this.requestPassword,
        required this.isActivated,
        required this.isPhoneActivated,
        required this.requireNote,
        required this.timezone,
        required this.phoneAuth,
        required this.isPhoneAuthActivated,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.feedbacks,
        required this.schedules,
        required this.id,
        required this.userId,
        required this.video,
        required this.bio,
        required this.education,
        required this.experience,
        required this.profession,
        required this.accent,
        required this.targetStudent,
        required this.interests,
        required this.languages,
        required this.specialties,
        required this.resume,
        required this.isNative,
        required this.price,
    });

    String? level;
    String? email;
    String? google;
    String? facebook;
    dynamic apple;
    String avatar;
    String name;
    TutorCountry? country;
    String? phone;
    dynamic language;
    dynamic birthday;
    bool requestPassword;
    bool isActivated;
    bool? isPhoneActivated;
    dynamic requireNote;
    int timezone;
    dynamic phoneAuth;
    bool isPhoneAuthActivated;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    List<Feedback> feedbacks;
    List<Schedule> schedules;
    String id;
    String userId;
    String video;
    String bio;
    String education;
    String experience;
    String profession;
    dynamic accent;
    TargetStudent? targetStudent;
    String interests;
    String languages;
    String specialties;
    dynamic resume;
    bool? isNative;
    int price;

    factory Tutor.fromMap(Map<String, dynamic> json) => Tutor(
        level: json["level"] == null ? null : json["level"],
        email: json["email"],
        google: json["google"] == null ? null : json["google"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        apple: json["apple"],
        avatar: json["avatar"],
        name: json["name"],
        country: TutorCountryValues.map[json["country"]],
        phone: json["phone"] == null ? null : json["phone"],
        language: json["language"],
        birthday: json["birthday"],
        requestPassword: json["requestPassword"],
        isActivated: json["isActivated"],
        isPhoneActivated: json["isPhoneActivated"] == null ? null : json["isPhoneActivated"],
        requireNote: json["requireNote"],
        timezone: json["timezone"],
        phoneAuth: json["phoneAuth"],
        isPhoneAuthActivated: json["isPhoneAuthActivated"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        feedbacks: List<Feedback>.from(json["feedbacks"].map((x) => Feedback.fromMap(x))),
        schedules: List<Schedule>.from(json["schedules"].map((x) => Schedule.fromMap(x))),
        id: json["id"],
        userId: json["userId"],
        video: json["video"],
        bio: json["bio"],
        education: json["education"],
        experience: json["experience"],
        profession: json["profession"],
        accent: json["accent"],
        targetStudent: targetStudentValues.map[json["targetStudent"]],
        interests: json["interests"],
        languages: json["languages"],
        specialties: json["specialties"],
        resume: json["resume"],
        isNative: json["isNative"] == null ? null : json["isNative"],
        price: json["price"],
    );

    Map<String, dynamic> toMap() => {
        "level": level == null ? null : level,
        "email": email,
        "google": google == null ? null : google,
        "facebook": facebook == null ? null : facebook,
        "apple": apple,
        "avatar": avatar,
        "name": name,
        "country": TutorCountryValues.reverse[country],
        "phone": phone == null ? null : phone,
        "language": language,
        "birthday": birthday,
        "requestPassword": requestPassword,
        "isActivated": isActivated,
        "isPhoneActivated": isPhoneActivated == null ? null : isPhoneActivated,
        "requireNote": requireNote,
        "timezone": timezone,
        "phoneAuth": phoneAuth,
        "isPhoneAuthActivated": isPhoneAuthActivated,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "feedbacks": List<dynamic>.from(feedbacks.map((x) => x.toMap())),
        "schedules": List<dynamic>.from(schedules.map((x) => x.toMap())),
        "id": id,
        "userId": userId,
        "video": video,
        "bio": bio,
        "education": education,
        "experience": experience,
        "profession": profession,
        "accent": accent,
        "targetStudent": targetStudentValues.reverse[targetStudent],
        "interests": interests,
        "languages": languages,
        "specialties": specialties,
        "resume": resume,
        "isNative": isNative == null ? null : isNative,
        "price": price,
    };
}

enum TutorCountry { PH, VN, ZA }

final TutorCountryValues = EnumValues({
    "PH": TutorCountry.PH,
    "VN": TutorCountry.VN,
    "ZA": TutorCountry.ZA
});

class Feedback {
    Feedback({
        required this.id,
        required this.bookingId,
        required this.firstId,
        required this.secondId,
        required this.rating,
        required this.content,
        required this.createdAt,
        required this.updatedAt,
        required this.firstInfo,
    });

    String id;
    String? bookingId;
    String firstId;
    String secondId;
    int rating;
    String content;
    DateTime createdAt;
    DateTime updatedAt;
    FirstInfo firstInfo;

    factory Feedback.fromMap(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        bookingId: json["bookingId"] == null ? null : json["bookingId"],
        firstId: json["firstId"],
        secondId: json["secondId"],
        rating: json["rating"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        firstInfo: FirstInfo.fromMap(json["firstInfo"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "bookingId": bookingId == null ? null : bookingId,
        "firstId": firstId,
        "secondId": secondId,
        "rating": rating,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "firstInfo": firstInfo.toMap(),
    };
}

class FirstInfo {
    FirstInfo({
        this.level,
        required this.email,
        required this.google,
        required this.facebook,
        required this.apple,
        required this.avatar,
        required this.name,
        required this.country,
        required this.phone,
        required this.language,
        required this.birthday,
        required this.requestPassword,
        required this.isActivated,
        required this.isPhoneActivated,
        required this.requireNote,
        required this.timezone,
        required this.phoneAuth,
        required this.isPhoneAuthActivated,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
    });

    Level? level;
    String? email;
    String? google;
    String? facebook;
    dynamic apple;
    String avatar;
    String name;
    FirstInfoCountry? country;
    String? phone;
    String? language;
    DateTime birthday;
    bool requestPassword;
    bool isActivated;
    bool? isPhoneActivated;
    String? requireNote;
    int timezone;
    dynamic phoneAuth;
    bool isPhoneAuthActivated;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory FirstInfo.fromMap(Map<String, dynamic> json) => FirstInfo(
        level: json["level"] == null ? null : levelValues.map[json["level"]],
        email: json["email"],
        google: json["google"] == null ? null : json["google"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        apple: json["apple"],
        avatar: json["avatar"],
        name: json["name"],
        country: firstInfoCountryValues.map[json["country"]],
        phone: json["phone"],
        language: json["language"] == null ? null : json["language"],
        birthday: DateTime.parse(json["birthday"]),
        requestPassword: json["requestPassword"],
        isActivated: json["isActivated"],
        isPhoneActivated: json["isPhoneActivated"] == null ? null : json["isPhoneActivated"],
        requireNote: json["requireNote"] == null ? null : json["requireNote"],
        timezone: json["timezone"],
        phoneAuth: json["phoneAuth"],
        isPhoneAuthActivated: json["isPhoneAuthActivated"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
    );

    Map<String, dynamic> toMap() => {
        "level": level == null ? null : levelValues.reverse[level],
        "email": email,
        "google": google == null ? null : google,
        "facebook": facebook == null ? null : facebook,
        "apple": apple,
        "avatar": avatar,
        "name": name,
        "country": firstInfoCountryValues.reverse[country],
        "phone": phone,
        "language": language == null ? null : language,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "requestPassword": requestPassword,
        "isActivated": isActivated,
        "isPhoneActivated": isPhoneActivated == null ? null : isPhoneActivated,
        "requireNote": requireNote == null ? null : requireNote,
        "timezone": timezone,
        "phoneAuth": phoneAuth,
        "isPhoneAuthActivated": isPhoneAuthActivated,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
    };
}

enum FirstInfoCountry { VN, TW }

final firstInfoCountryValues = EnumValues({
    "TW": FirstInfoCountry.TW,
    "VN": FirstInfoCountry.VN
});

enum Level { INTERMEDIATE, BEGINNER, ADVANCED, HIGHER_BEGINNER }

final levelValues = EnumValues({
    "ADVANCED": Level.ADVANCED,
    "BEGINNER": Level.BEGINNER,
    "HIGHER_BEGINNER": Level.HIGHER_BEGINNER,
    "INTERMEDIATE": Level.INTERMEDIATE
});

class Schedule {
    Schedule({
        required this.date,
        required this.startTimestamp,
        required this.endTimestamp,
        required this.id,
        required this.tutorId,
        required this.startTime,
        required this.endTime,
        required this.createdAt,
        required this.updatedAt,
        required this.scheduleDetailInfo,
    });

    DateTime date;
    int startTimestamp;
    int endTimestamp;
    String id;
    String tutorId;
    String startTime;
    String endTime;
    DateTime createdAt;
    DateTime updatedAt;
    List<ScheduleDetailInfo> scheduleDetailInfo;

    factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        date: DateTime.parse(json["date"]),
        startTimestamp: json["startTimestamp"],
        endTimestamp: json["endTimestamp"],
        id: json["id"],
        tutorId: json["tutorId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        scheduleDetailInfo: List<ScheduleDetailInfo>.from(json["scheduleDetailInfo"].map((x) => ScheduleDetailInfo.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "startTimestamp": startTimestamp,
        "endTimestamp": endTimestamp,
        "id": id,
        "tutorId": tutorId,
        "startTime": startTime,
        "endTime": endTime,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "scheduleDetailInfo": List<dynamic>.from(scheduleDetailInfo.map((x) => x.toMap())),
    };
}

class ScheduleDetailInfo {
    ScheduleDetailInfo({
        required this.startPeriodTimestamp,
        required this.endPeriodTimestamp,
        required this.id,
        required this.scheduleId,
        required this.startPeriod,
        required this.endPeriod,
        required this.createdAt,
        required this.updatedAt,
        required this.bookingInfo,
    });

    int startPeriodTimestamp;
    int endPeriodTimestamp;
    String id;
    String scheduleId;
    String startPeriod;
    String endPeriod;
    DateTime createdAt;
    DateTime updatedAt;
    List<BookingInfo> bookingInfo;

    factory ScheduleDetailInfo.fromMap(Map<String, dynamic> json) => ScheduleDetailInfo(
        startPeriodTimestamp: json["startPeriodTimestamp"],
        endPeriodTimestamp: json["endPeriodTimestamp"],
        id: json["id"],
        scheduleId: json["scheduleId"],
        startPeriod: json["startPeriod"],
        endPeriod: json["endPeriod"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        bookingInfo: List<BookingInfo>.from(json["bookingInfo"].map((x) => BookingInfo.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "startPeriodTimestamp": startPeriodTimestamp,
        "endPeriodTimestamp": endPeriodTimestamp,
        "id": id,
        "scheduleId": scheduleId,
        "startPeriod": startPeriod,
        "endPeriod": endPeriod,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "bookingInfo": List<dynamic>.from(bookingInfo.map((x) => x.toMap())),
    };
}

class BookingInfo {
    BookingInfo({
        required this.createdAtTimeStamp,
        required this.updatedAtTimeStamp,
        required this.id,
        required this.userId,
        required this.scheduleDetailId,
        required this.tutorMeetingLink,
        required this.studentMeetingLin,
        required this.studentRequest,
        required this.tutorReview,
        required this.scoreByTutor,
        required this.createdAt,
        required this.updatedAt,
        required this.recordUrl,
        required this.isDeleted,
    });

    int createdAtTimeStamp;
    int updatedAtTimeStamp;
    String id;
    String userId;
    String scheduleDetailId;
    String tutorMeetingLink;
    String studentMeetingLin;
    String? studentRequest;
    dynamic tutorReview;
    dynamic scoreByTutor;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic recordUrl;
    bool isDeleted;

    factory BookingInfo.fromMap(Map<String, dynamic> json) => BookingInfo(
        createdAtTimeStamp: json["createdAtTimeStamp"],
        updatedAtTimeStamp: json["updatedAtTimeStamp"],
        id: json["id"],
        userId: json["userId"],
        scheduleDetailId: json["scheduleDetailId"],
        tutorMeetingLink: json["tutorMeetingLink"],
        studentMeetingLin: json["studentMeetingLin"],
        studentRequest: json["studentRequest"] == null ? null : json["studentRequest"],
        tutorReview: json["tutorReview"],
        scoreByTutor: json["scoreByTutor"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        recordUrl: json["recordUrl"],
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toMap() => {
        "createdAtTimeStamp": createdAtTimeStamp,
        "updatedAtTimeStamp": updatedAtTimeStamp,
        "id": id,
        "userId": userId,
        "scheduleDetailId": scheduleDetailId,
        "tutorMeetingLink": tutorMeetingLink,
        "studentMeetingLin": studentMeetingLin,
        "studentRequest": studentRequest == null ? null : studentRequest,
        "tutorReview": tutorReview,
        "scoreByTutor": scoreByTutor,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "recordUrl": recordUrl,
        "isDeleted": isDeleted,
    };
}

enum TargetStudent { BEGINNER, INTERMEDIATE }

final targetStudentValues = EnumValues({
    "Beginner": TargetStudent.BEGINNER,
    "Intermediate": TargetStudent.INTERMEDIATE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
