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

String convertToString(dynamic object) {
  try {
    final String? value = object as String?;
    return value ?? "";
  } catch (e) {
    rethrow;
  }
}

// ----

DateTime convertToDatetime(String? object) {
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

// ---เวลา
String convertToThaiTimes(DateTime? dateTime) {
  if (dateTime == null) {
    return "";
  }
  final DateFormat formatter = DateFormat('HH:mm', 'th_TH');
  return formatter.format(dateTime);
}

// ---

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

String formatheader(DateTime dateTime) {
  final DateFormat formatter = DateFormat('MMMM yyyy', 'th_TH');
  String formattedDate = formatter.format(dateTime);

  final int year = dateTime.year + 543;
  // ignore: join_return_with_assignment
  formattedDate =
      formattedDate.replaceFirst(dateTime.year.toString(), year.toString());

  return formattedDate;
}

String formatPhoneNumber(String phoneNumber) {
  if (phoneNumber.length < 10) {
    return phoneNumber;
  }
  return 'xxx-xxx-x${phoneNumber.substring(phoneNumber.length - 3)}';
}
