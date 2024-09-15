import 'package:json_annotation/json_annotation.dart';

part 'appointments-entity.g.dart';

@JsonSerializable()
class AppointmentsEntity {
  String? name;
  int? patientId;
  int? round;
  String? other;
  String? surname;
  String? guardianName;
  String? guardianSurname;
  String? guardianPhoneNo;
  String? phoneNo;
  int? appointmentId;
  DateTime? appointmentAt;
  String? appointmentType;
  String? note;
  String? appointmentWithName;
  String? appointmentWithSurname;
  String? reason;

  AppointmentsEntity({
    required this.name,
    required this.patientId,
    required this.round,
    required this.other,
    required this.surname,
    required this.guardianName,
    required this.guardianSurname,
    required this.guardianPhoneNo,
    required this.phoneNo,
    required this.appointmentId,
    required this.appointmentAt,
    required this.appointmentType,
    required this.note,
    required this.appointmentWithName,
    required this.appointmentWithSurname,
    required this.reason,
  });
  factory AppointmentsEntity.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentsEntityToJson(this);
}
