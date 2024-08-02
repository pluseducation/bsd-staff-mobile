import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';

@freezed
class StatYear with _$StatYear {
  const factory StatYear({
    required int year,
    required int total,
    required double register,
    required double screening,
    required double treatment,
    required double monitoring,
    required double discharged,
  }) = _StatYear;
}

@freezed
class StatPatientWeek with _$StatPatientWeek {
  const factory StatPatientWeek({
    required int newPatientWeek,
    required List<double> dataWeek,
  }) = _StatPatientWeek;
}

@freezed
class StatPatientMonth with _$StatPatientMonth {
  const factory StatPatientMonth({
    required int newPatientMonth,
    required List<double> dataMonth,
  }) = _StatPatientMonth;
}

@freezed
class Refer with _$Refer {
  const factory Refer({
    required int sender,
    required int receiver,
  }) = _Refer;
}
