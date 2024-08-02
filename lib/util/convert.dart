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
    final double? value = double.parse(object.toString());
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
