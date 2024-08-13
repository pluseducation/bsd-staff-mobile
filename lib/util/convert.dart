import 'package:intl/intl.dart';

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

String formatThaiDate(DateTime? date) {
  if (date == null) {
    return "";
  }

  final DateFormat thaiDateFormat = DateFormat.yMMMd('th_TH');
  return thaiDateFormat.format(date);
}
