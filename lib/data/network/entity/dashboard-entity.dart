import 'package:json_annotation/json_annotation.dart';
part 'dashboard-entity.g.dart';

@JsonSerializable()
class StatYearEntity {
  int year;
  int total;
  double register;
  double screening;
  double treatment;
  double monitoring;
  double discharged;

  StatYearEntity({
    required this.year,
    required this.total,
    required this.register,
    required this.screening,
    required this.treatment,
    required this.monitoring,
    required this.discharged,
  });

  factory StatYearEntity.fromJson(Map<String, dynamic> json) =>
      _$StatYearEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StatYearEntityToJson(this);
}

@JsonSerializable()
class StatPatientWeekEntity {
  int newPatientToday;
  int newPatientWeek;
  String? dayOfWeek;
  int monday;
  int tuesday;
  int wednesday;
  int thursday;
  int friday;
  int saturday;
  int sunday;

  StatPatientWeekEntity({
    required this.newPatientToday,
    required this.newPatientWeek,
    required this.dayOfWeek,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory StatPatientWeekEntity.fromJson(Map<String, dynamic> json) =>
      _$StatPatientWeekEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StatPatientWeekEntityToJson(this);
}

@JsonSerializable()
class StatPatientMonthEntity {
  int newPatientToday;
  int newPatientMonth;
  int dayOfMonth;
  List<StatPatientMonthTotalEntity> totals;

  StatPatientMonthEntity({
    required this.newPatientToday,
    required this.newPatientMonth,
    required this.dayOfMonth,
    required this.totals,
  });

  factory StatPatientMonthEntity.fromJson(Map<String, dynamic> json) =>
      _$StatPatientMonthEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StatPatientMonthEntityToJson(this);
}

@JsonSerializable()
class StatPatientMonthTotalEntity {
  int date;
  int total;

  StatPatientMonthTotalEntity({
    required this.date,
    required this.total,
  });

  factory StatPatientMonthTotalEntity.fromJson(Map<String, dynamic> json) =>
      _$StatPatientMonthTotalEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StatPatientMonthTotalEntityToJson(this);
}

@JsonSerializable()
class ReferEntity {
  int sender;
  int receiver;

  ReferEntity({
    required this.sender,
    required this.receiver,
  });

  factory ReferEntity.fromJson(Map<String, dynamic> json) =>
      _$ReferEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReferEntityToJson(this);
}
