import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/tutors/favorite_tutor.dart';

part 'upcoming_schedule.g.dart';

class BookingDateGroup {
  final List<Booking> booking;
  final DateTime date;

  const BookingDateGroup({required this.booking, required this.date});
}

@JsonSerializable()
class BookingData {
  final int count;
  final List<Booking> rows;

  BookingData({required this.count, required this.rows});

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);
}

@JsonSerializable()
class Booking {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String id;
  String userId;
  String scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  double? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;
  bool? isDeleted;
  ScheduleDetailInfo scheduleDetailInfo;
  bool? showRecordUrl;
  // List<Null>? studentMaterials;

  Booking({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    required this.id,
    required this.userId,
    required this.scheduleDetailId,
    this.tutorMeetingLink,
    required this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.isDeleted,
    required this.scheduleDetailInfo,
    this.showRecordUrl,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}

@JsonSerializable()
class ScheduleDetailInfo {
  int startPeriodTimestamp;
  int? endPeriodTimestamp;
  String id;
  String? scheduleId;
  String startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  ScheduleInfo? scheduleInfo;

  ScheduleDetailInfo({
    required this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    required this.id,
    this.scheduleId,
    required this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.scheduleInfo,
  });

  factory ScheduleDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailInfoFromJson(json);
}

@JsonSerializable()
class ScheduleInfo {
  String? date;
  int startTimestamp;
  int? endTimestamp;
  String id;
  String tutorId;
  String startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  TutorInfo? tutorInfo;

  ScheduleInfo({
    this.date,
    required this.startTimestamp,
    this.endTimestamp,
    required this.id,
    required this.tutorId,
    required this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
    this.tutorInfo,
  });

  factory ScheduleInfo.fromJson(Map<String, dynamic> json) =>
      _$ScheduleInfoFromJson(json);
}
