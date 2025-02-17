import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

int convertToInt(dynamic object) {
  try {
    final int? value = object as int?;
    return value ?? 0;
  } catch (e) {
    rethrow;
  }
}

double convertToDouble(dynamic object) {
  try {
    double? value;
    if (object == null) {
      value = 0;
    } else if (object is num) {
      value = object.toDouble();
    } else if (object is String) {
      value = double.tryParse(object);
    } else {
      value = 0;
    }

    return value ?? 0;
  } catch (e) {
    rethrow;
  }
}

bool convertToBool(dynamic object) {
  try {
    if (object == null) {
      return false;
    }

    final bool value = object as bool;
    return value;
  } catch (e) {
    rethrow;
  }
}

String convertToString(dynamic object, {String defaultValue = ""}) {
  try {
    if (object == null) {
      return defaultValue;
    } else if (object is String) {
      return object;
    } else if (object is int || object is double) {
      return object.toString();
    } else {
      return object.toString();
    }
  } catch (e) {
    rethrow;
  }
}

DateTime convertToDatetime(dynamic object) {
  try {
    if (object == null) {
      return DateTime.now();
    }
    tz.initializeTimeZones();
    final DateTime utcDateTime = DateTime.parse(object.toString()).toUtc();
    final tz.Location thailand = tz.getLocation('Asia/Bangkok');
    final tz.TZDateTime thailandDateTime =
        tz.TZDateTime.from(utcDateTime, thailand);
    return thailandDateTime;
  } catch (e) {
    rethrow;
  }
}

DateTime convertToDateOnly(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

// format
String formatDate(DateTime? date, {String defaultValue = ""}) {
  if (date == null) {
    return defaultValue;
  }

  final year = date.year;
  DateTime adjustedDate = date;
  if (year < 2500) {
    adjustedDate = DateTime(year + 543, date.month, date.day);
  }

  final DateFormat thaiDateFormat = DateFormat('d MMMM yyyy', 'th_TH');
  final value = thaiDateFormat.format(adjustedDate);
  return value;
}

String formatTime(DateTime? dateTime) {
  if (dateTime == null) {
    return "";
  }
  final DateFormat formatter = DateFormat('HH:mm', 'th_TH');
  return formatter.format(dateTime);
}

String formatTimegone(DateTime? date) {
  String value = "";
  final now = DateTime.now();
  final tmp = convertToDatetime(date);
  final diff = tmp.difference(now);
  final days = diff.inDays;
  final hours = diff.inHours;
  final minutes = diff.inMinutes;
  if (days > 0) {
    value = "อีก $days วัน";
  } else if (hours > 0) {
    value = "อีก $hours ชั่วโมง";
  } else if (minutes > 0) {
    value = "อีก $minutes นาที";
  } else if (days < 0) {
    value = "เมื่อ ${days.abs()} วันที่แล้ว";
  } else if (hours < 0) {
    value = "เมื่อ ${hours.abs()} ชั่วโมงที่แล้ว";
  } else if (minutes < 0) {
    value = "เมื่อ ${minutes.abs()} นาทีที่แล้ว";
  }
  return value;
}

// Thai only
String formatThaiFullDate(DateTime date) {
  final year = date.year;
  DateTime adjustedDate = date;
  if (year < 2500) {
    adjustedDate = DateTime(year + 543, date.month, date.day);
  }

  final DateFormat thaiDateFormat = DateFormat('d MMMM yyyy', 'th_TH');
  final String formattedDate = thaiDateFormat.format(adjustedDate);

  return formattedDate;
}

// delete
String convertToThaiDatetime(DateTime dateTime) {
  final DateFormat formatter = DateFormat.yMMMMd('th_TH');
  return formatter.format(dateTime);
}

String convertToThaiDatetimes(DateTime dateTime) {
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  String formattedDate = formatter.format(dateTime);

  final int year = dateTime.year + 543;
  // ignore: join_return_with_assignment
  formattedDate =
      formattedDate.replaceFirst(dateTime.year.toString(), year.toString());

  return formattedDate;
}

String convertToThaiTimes(DateTime? dateTime) {
  if (dateTime == null) {
    return "";
  }
  final DateFormat formatter = DateFormat('HH:mm', 'th_TH');
  return formatter.format(dateTime);
}

String convertThaiDate(DateTime? date) {
  if (date == null) {
    return "";
  }

// yMMMd
  final DateFormat thaiDateFormat = DateFormat.yMMMd('th_TH');
  return thaiDateFormat.format(date);
}

DateTime? parseDate(String? dateString) {
  if (dateString == null) {
    return null;
  }
  return DateTime.tryParse(dateString);
}

String formatThaiDateOfBirth(DateTime? date) {
  if (date == null) {
    return "";
  }

  final DateFormat dayMonthFormat = DateFormat('d MMM', 'th_TH');
  final int thaiYear = date.year + 543;
  final String dayMonth = dayMonthFormat.format(date);

  return '$dayMonth $thaiYear';
}

String convertDateY(DateTime? date) {
  if (date == null) {
    return "";
  }

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  return dateFormat.format(date);
}

String formatPhoneNumber(String phoneNumber) {
  if (phoneNumber.length < 10) {
    return phoneNumber;
  }
  return 'xxx-xxx-x${phoneNumber.substring(phoneNumber.length - 3)}';
}
