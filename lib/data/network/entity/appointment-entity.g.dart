// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentEntity _$AppointmentEntityFromJson(Map<String, dynamic> json) =>
    AppointmentEntity(
      name: json['name'] as String?,
      patientId: (json['patientId'] as num?)?.toInt(),
      round: (json['round'] as num?)?.toInt(),
      other: json['other'] as String?,
      surname: json['surname'] as String?,
      guardianName: json['guardianName'] as String?,
      guardianSurname: json['guardianSurname'] as String?,
      guardianPhoneNo: json['guardianPhoneNo'] as String?,
      phoneNo: json['phoneNo'] as String?,
      appointmentId: (json['appointmentId'] as num?)?.toInt(),
      appointmentAt: json['appointmentAt'] as String?,
      appointmentType: json['appointmentType'] as String?,
      note: json['note'] as String?,
      appointmentWithName: json['appointmentWithName'] as String?,
      appointmentWithSurname: json['appointmentWithSurname'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$AppointmentEntityToJson(AppointmentEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'patientId': instance.patientId,
      'round': instance.round,
      'other': instance.other,
      'surname': instance.surname,
      'guardianName': instance.guardianName,
      'guardianSurname': instance.guardianSurname,
      'guardianPhoneNo': instance.guardianPhoneNo,
      'phoneNo': instance.phoneNo,
      'appointmentId': instance.appointmentId,
      'appointmentAt': instance.appointmentAt,
      'appointmentType': instance.appointmentType,
      'note': instance.note,
      'appointmentWithName': instance.appointmentWithName,
      'appointmentWithSurname': instance.appointmentWithSurname,
      'reason': instance.reason,
    };
