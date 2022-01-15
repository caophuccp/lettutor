import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class AppDate {
  final DateTime date;

  const AppDate({required this.date});

  factory AppDate.now() {
    return AppDate(date: DateTime.now());
  }

  factory AppDate.fromString(String string) {
    final date = DateTime.parse(string).toLocal();
    return AppDate(date: date);
  }

  int get millisecondsSinceNow {
    return DateTime.now().difference(date).inMilliseconds;
  }

  String string(String format) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(date).toString();
  }

  String relativeTime() {
    final elapsed =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    int seconds = elapsed ~/ 1000;
    if (seconds == 0) {
      return 'Vừa mới';
    }
    String prefix = seconds < 0 ? 'Sau' : '';
    String suffix = seconds < 0 ? 'nữa' : 'trước';
    String result;

    seconds = seconds < 0 ? -seconds : seconds;
    final double minutes = seconds / 60;
    final double hours = minutes / 60;
    final double days = hours / 24;
    final double months = days / 30;
    final double years = days / 365;

    if (seconds < 60) {
      result = '${seconds.round()} giây';
    } else if (minutes < 60) {
      result = '${minutes.round()} phút';
    } else if (hours < 24) {
      result = '${hours.round()} giờ';
    } else if (days < 7) {
      result = '${days.round()} ngày';
    } else if (days < 14) {
      result = '1 tuần';
    } else if (days < 21) {
      result = '2 tuần';
    } else if (days < 28) {
      result = '3 tuần';
    } else if (months < 12) {
      result = '${months.round()} tháng';
    } else {
      result = '${years.round()} năm';
    }
    return [prefix, result, suffix].where((e) => e.isNotEmpty).join(' ');
  }
}

class AppDateFormat {
  static const String ddMMyyykkmm = 'dd/MM/yyyy - kk:mm';
  static const String kkmmddMMyyy = 'kk:mm - dd/MM/yyyy';
}

class AppDateJsonConverter implements JsonConverter<AppDate, String> {
  const AppDateJsonConverter();

  @override
  AppDate fromJson(String json) => AppDate.fromString(json);

  @override
  String toJson(AppDate object) => object.date.toIso8601String();
}

class AppDateOptionalJsonConverter implements JsonConverter<AppDate?, String?> {
  const AppDateOptionalJsonConverter();

  @override
  AppDate? fromJson(String? json) {
    try {
      if (json?.isEmpty ?? true) {
        return null;
      }
      return AppDate.fromString(json!);
    } catch (e) {
      return null;
    }
  }

  @override
  String? toJson(AppDate? object) => object?.date.toIso8601String();
}
