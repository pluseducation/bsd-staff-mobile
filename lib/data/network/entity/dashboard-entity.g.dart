// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatYearEntity _$StatYearEntityFromJson(Map<String, dynamic> json) =>
    StatYearEntity(
      year: (json['year'] as num).toInt(),
      total: (json['total'] as num).toInt(),
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
      newPatientToday: (json['newPatientToday'] as num).toInt(),
      newPatientWeek: (json['newPatientWeek'] as num).toInt(),
      dayOfWeek: json['dayOfWeek'] as String?,
      monday: (json['monday'] as num).toInt(),
      tuesday: (json['tuesday'] as num).toInt(),
      wednesday: (json['wednesday'] as num).toInt(),
      thursday: (json['thursday'] as num).toInt(),
      friday: (json['friday'] as num).toInt(),
      saturday: (json['saturday'] as num).toInt(),
      sunday: (json['sunday'] as num).toInt(),
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
      newPatientToday: (json['newPatientToday'] as num).toInt(),
      newPatientMonth: (json['newPatientMonth'] as num).toInt(),
      dayOfMonth: (json['dayOfMonth'] as num).toInt(),
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
      date: (json['date'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$StatPatientMonthTotalEntityToJson(
        StatPatientMonthTotalEntity instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total': instance.total,
    };

ReferEntity _$ReferEntityFromJson(Map<String, dynamic> json) => ReferEntity(
      sender: (json['sender'] as num).toInt(),
      receiver: (json['receiver'] as num).toInt(),
    );

Map<String, dynamic> _$ReferEntityToJson(ReferEntity instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'receiver': instance.receiver,
    };

LevelEntity _$LevelEntityFromJson(Map<String, dynamic> json) => LevelEntity(
      screening: json['screening'] == null
          ? null
          : LevelTypeEntity.fromJson(json['screening'] as Map<String, dynamic>),
      treatment: json['treatment'] == null
          ? null
          : LevelTypeEntity.fromJson(json['treatment'] as Map<String, dynamic>),
      fiscalYear: (json['fiscalYear'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LevelEntityToJson(LevelEntity instance) =>
    <String, dynamic>{
      'screening': instance.screening,
      'treatment': instance.treatment,
      'fiscalYear': instance.fiscalYear,
    };

LevelTypeEntity _$LevelTypeEntityFromJson(Map<String, dynamic> json) =>
    LevelTypeEntity(
      URGENCY:
          LevelDataEntity.fromJson(json['URGENCY'] as Map<String, dynamic>),
      EMERGENCY:
          LevelDataEntity.fromJson(json['EMERGENCY'] as Map<String, dynamic>),
      SEMI_URGENCY: LevelDataEntity.fromJson(
          json['SEMI_URGENCY'] as Map<String, dynamic>),
      NORMAL: LevelDataEntity.fromJson(json['NORMAL'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LevelTypeEntityToJson(LevelTypeEntity instance) =>
    <String, dynamic>{
      'URGENCY': instance.URGENCY,
      'EMERGENCY': instance.EMERGENCY,
      'SEMI_URGENCY': instance.SEMI_URGENCY,
      'NORMAL': instance.NORMAL,
    };

LevelDataEntity _$LevelDataEntityFromJson(Map<String, dynamic> json) =>
    LevelDataEntity(
      percentage: (json['percentage'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$LevelDataEntityToJson(LevelDataEntity instance) =>
    <String, dynamic>{
      'percentage': instance.percentage,
      'count': instance.count,
    };
