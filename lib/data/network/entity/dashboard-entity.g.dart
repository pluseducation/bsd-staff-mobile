// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowCountEntity _$WorkflowCountEntityFromJson(Map<String, dynamic> json) =>
    WorkflowCountEntity(
      workflow: json['workflow'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$WorkflowCountEntityToJson(
        WorkflowCountEntity instance) =>
    <String, dynamic>{
      'workflow': instance.workflow,
      'count': instance.count,
    };

ReferCountEntity _$ReferCountEntityFromJson(Map<String, dynamic> json) =>
    ReferCountEntity(
      sender: (json['sender'] as num).toInt(),
      receiver: (json['receiver'] as num).toInt(),
    );

Map<String, dynamic> _$ReferCountEntityToJson(ReferCountEntity instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'receiver': instance.receiver,
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
