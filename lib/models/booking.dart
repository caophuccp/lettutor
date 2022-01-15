import 'dart:convert';

List<Booking> bookingsFromJson(String str) => List<Booking>.from(json.decode(str).map((x) => Booking.fromMap(x)));

String bookingsToJson(List<Booking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Booking {
  String id;
  DateTime startTime;
  DateTime endTime;
  String request;
  String tutorId;

  Booking({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.request,
    required this.tutorId,
  });

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
    id: json['id'],
    startTime: DateTime.parse(json['startTime']),
    endTime: DateTime.parse(json['endTime']),
    request: json['request'],
    tutorId: json['tutorId'],
  );

  Map<String, dynamic> toMap() => { 
    'id': id,
    'startTime': startTime.toIso8601String(),
    'endTime': endTime.toIso8601String(),
    'request': request,
    'tutorId': tutorId,
  };
}
