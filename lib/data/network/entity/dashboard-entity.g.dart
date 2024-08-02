// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatYearEntity _$StatYearEntityFromJson(Map<String, dynamic> json) =>
    StatYearEntity(
      year: json['year'] as int,
      total: json['total'] as int,
      register: (json['register'] as num).toDouble(),
      screening: (json['screening'] as num).toDouble(),
      treatment: (json['treatment'] as num).toDouble(),
      monitoring: (json['monitoring'] as num).toDouble(),
      discharged: (json['discharged'] as num).toDouble(),
    );

Map<String, dynamic> _$StatYearEntityToJson(StatYearEntity instance) =>
    <String, dynamic>{
      'year': instance.year,
      'total': instance.total,
      'register': instance.register,
      'screening': instance.screening,
      'treatment': instance.treatment,
      'monitoring': instance.monitoring,
      'discharged': instance.discharged,
    };

StatPatientWeekEntity _$StatPatientWeekEntityFromJson(
        Map<String, dynamic> json) =>
    StatPatientWeekEntity(
      newPatientToday: json['newPatientToday'] as int,
      newPatientWeek: json['newPatientWeek'] as int,
      dayOfWeek: json['dayOfWeek'] as String,
      monday: json['monday'] as int,
      tuesday: json['tuesday'] as int,
      wednesday: json['wednesday'] as int,
      thursday: json['thursday'] as int,
      friday: json['friday'] as int,
      saturday: json['saturday'] as int,
      sunday: json['sunday'] as int,
    );

Map<String, dynamic> _$StatPatientWeekEntityToJson(
        StatPatientWeekEntity instance) =>
    <String, dynamic>{
      'newPatientToday': instance.newPatientToday,
      'newPatientWeek': instance.newPatientWeek,
      'dayOfWeek': instance.dayOfWeek,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };

StatPatientMonthEntity _$StatPatientMonthEntityFromJson(
        Map<String, dynamic> json) =>
    StatPatientMonthEntity(
      newPatientToday: json['newPatientToday'] as int,
      newPatientMonth: json['newPatientMonth'] as int,
      dayOfMonth: json['dayOfMonth'] as int,
      totals: (json['totals'] as List<dynamic>)
          .map((e) =>
              StatPatientMonthTotalEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatPatientMonthEntityToJson(
        StatPatientMonthEntity instance) =>
    <String, dynamic>{
      'newPatientToday': instance.newPatientToday,
      'newPatientMonth': instance.newPatientMonth,
      'dayOfMonth': instance.dayOfMonth,
      'totals': instance.totals,
    };

StatPatientMonthTotalEntity _$StatPatientMonthTotalEntityFromJson(
        Map<String, dynamic> json) =>
    StatPatientMonthTotalEntity(
      date: json['date'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$StatPatientMonthTotalEntityToJson(
        StatPatientMonthTotalEntity instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total': instance.total,
    };

ReferEntity _$ReferEntityFromJson(Map<String, dynamic> json) => ReferEntity(
      sender: json['sender'] as int,
      receiver: json['receiver'] as int,
    );

Map<String, dynamic> _$ReferEntityToJson(ReferEntity instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'receiver': instance.receiver,
    };
