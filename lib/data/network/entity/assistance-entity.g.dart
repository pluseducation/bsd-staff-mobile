// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistance-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssistanceAllEntity _$AssistanceAllEntityFromJson(Map<String, dynamic> json) =>
    AssistanceAllEntity(
      content: (json['content'] as List<dynamic>)
          .map((e) => AssistanceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
    );

Map<String, dynamic> _$AssistanceAllEntityToJson(
        AssistanceAllEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

AssistanceEntity _$AssistanceEntityFromJson(Map<String, dynamic> json) =>
    AssistanceEntity(
      assistanceId: (json['assistanceId'] as num?)?.toInt(),
      cycle: json['cycle'] as String?,
      nationalId: json['nationalId'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      workflowType: json['workflowType'] as String?,
      senderSubDivisionId: (json['senderSubDivisionId'] as num?)?.toInt(),
      senderSubDivisionName: json['senderSubDivisionName'] as String?,
      receiverSubDivisionId: (json['receiverSubDivisionId'] as num?)?.toInt(),
      receiverSubDivisionName: json['receiverSubDivisionName'] as String?,
      assistanceStatus: json['assistanceStatus'] as String?,
      patientId: (json['patientId'] as num?)?.toInt(),
      latestRoundId: (json['latestRoundId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AssistanceEntityToJson(AssistanceEntity instance) =>
    <String, dynamic>{
      'assistanceId': instance.assistanceId,
      'cycle': instance.cycle,
      'nationalId': instance.nationalId,
      'name': instance.name,
      'surname': instance.surname,
      'workflowType': instance.workflowType,
      'senderSubDivisionId': instance.senderSubDivisionId,
      'senderSubDivisionName': instance.senderSubDivisionName,
      'receiverSubDivisionId': instance.receiverSubDivisionId,
      'receiverSubDivisionName': instance.receiverSubDivisionName,
      'assistanceStatus': instance.assistanceStatus,
      'patientId': instance.patientId,
      'latestRoundId': instance.latestRoundId,
    };

AssistanceDetailEntity _$AssistanceDetailEntityFromJson(
        Map<String, dynamic> json) =>
    AssistanceDetailEntity(
      content: (json['content'] as List<dynamic>)
          .map((e) =>
              AssistanceDetailContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistanceDetailEntityToJson(
        AssistanceDetailEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

AssistanceDetailContentEntity _$AssistanceDetailContentEntityFromJson(
        Map<String, dynamic> json) =>
    AssistanceDetailContentEntity(
      id: (json['id'] as num?)?.toInt(),
      assistanceTypeId: (json['assistanceTypeId'] as num?)?.toInt(),
      assistanceTypeName: json['assistanceTypeName'] as String?,
      assistanceTypeOther: json['assistanceTypeOther'] as String?,
      subDivisionId: (json['subDivisionId'] as num?)?.toInt(),
      status: json['status'] as String?,
      remark: json['remark'] as String?,
      exceedReasonId: (json['exceedReasonId'] as num?)?.toInt(),
      assistanceDepartmentId: (json['assistanceDepartmentId'] as num?)?.toInt(),
      assistanceDepartmentName: json['assistanceDepartmentName'] as String?,
      assistanceSubDivisionId:
          (json['assistanceSubDivisionId'] as num?)?.toInt(),
      assistanceSubDivisionName: json['assistanceSubDivisionName'] as String?,
    );

Map<String, dynamic> _$AssistanceDetailContentEntityToJson(
        AssistanceDetailContentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assistanceTypeId': instance.assistanceTypeId,
      'assistanceTypeName': instance.assistanceTypeName,
      'assistanceTypeOther': instance.assistanceTypeOther,
      'subDivisionId': instance.subDivisionId,
      'status': instance.status,
      'remark': instance.remark,
      'exceedReasonId': instance.exceedReasonId,
      'assistanceDepartmentId': instance.assistanceDepartmentId,
      'assistanceDepartmentName': instance.assistanceDepartmentName,
      'assistanceSubDivisionId': instance.assistanceSubDivisionId,
      'assistanceSubDivisionName': instance.assistanceSubDivisionName,
    };
