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
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
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
      patientId: json['patientId'] as int,
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
    };
