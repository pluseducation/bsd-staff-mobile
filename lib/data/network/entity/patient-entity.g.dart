// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAllEntity _$PatientAllEntityFromJson(Map<String, dynamic> json) =>
    PatientAllEntity(
      content: (json['content'] as List<dynamic>)
          .map((e) => PatientEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
    );

Map<String, dynamic> _$PatientAllEntityToJson(PatientAllEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

PatientEntity _$PatientEntityFromJson(Map<String, dynamic> json) =>
    PatientEntity(
      name: json['name'] as String,
      status: json['status'] as String?,
      patientId: (json['patientId'] as num).toInt(),
      surname: json['surname'] as String,
      cycle: json['cycle'] as String?,
      nationalId: json['nationalId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      generatedId: json['generatedId'] as String?,
      drugEval: json['drugEval'] as String?,
      level: json['level'] as String?,
      treatmentType: json['treatmentType'] as String?,
      smiv: json['smiv'] as String?,
    );

Map<String, dynamic> _$PatientEntityToJson(PatientEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'patientId': instance.patientId,
      'surname': instance.surname,
      'cycle': instance.cycle,
      'nationalId': instance.nationalId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'generatedId': instance.generatedId,
      'drugEval': instance.drugEval,
      'level': instance.level,
      'treatmentType': instance.treatmentType,
      'smiv': instance.smiv,
    };

PatientHistoryEntity _$PatientHistoryEntityFromJson(
        Map<String, dynamic> json) =>
    PatientHistoryEntity(
      cycle: json['cycle'] as String?,
      no: (json['no'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      workflowType: json['workflowType'] as String?,
      subDivisionId: (json['subDivisionId'] as num?)?.toInt(),
      subDivisionName: json['subDivisionName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      treatmentDate: json['treatmentDate'] == null
          ? null
          : DateTime.parse(json['treatmentDate'] as String),
      monitoringRound: (json['monitoringRound'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PatientHistoryEntityToJson(
        PatientHistoryEntity instance) =>
    <String, dynamic>{
      'cycle': instance.cycle,
      'no': instance.no,
      'date': instance.date?.toIso8601String(),
      'workflowType': instance.workflowType,
      'subDivisionId': instance.subDivisionId,
      'subDivisionName': instance.subDivisionName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'treatmentDate': instance.treatmentDate?.toIso8601String(),
      'monitoringRound': instance.monitoringRound,
    };
