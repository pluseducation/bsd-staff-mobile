// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refer-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SenderEntity _$SenderEntityFromJson(Map<String, dynamic> json) => SenderEntity(
      content: (json['content'] as List<dynamic>)
          .map((e) => SenderContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
    );

Map<String, dynamic> _$SenderEntityToJson(SenderEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

SenderContentEntity _$SenderContentEntityFromJson(Map<String, dynamic> json) =>
    SenderContentEntity(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      level: json['level'] as String?,
      workflow: json['workflow'] as String?,
      cycle: json['cycle'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      referTo: json['referTo'] as String?,
      nationalId: json['nationalId'] as String?,
      surname: json['surname'] as String?,
      referFrom: json['referFrom'] as String?,
      referReason: json['referReason'] as String?,
      responseReason: json['responseReason'] as String?,
      responseDate: json['responseDate'] == null
          ? null
          : DateTime.parse(json['responseDate'] as String),
      referDate: json['referDate'] == null
          ? null
          : DateTime.parse(json['referDate'] as String),
      referStatus: json['referStatus'] as String?,
      monitoringRoundType: json['monitoringRoundType'] as String?,
      referToId: (json['referToId'] as num?)?.toInt(),
      referFromId: (json['referFromId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SenderContentEntityToJson(
        SenderContentEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'level': instance.level,
      'workflow': instance.workflow,
      'cycle': instance.cycle,
      'createdAt': instance.createdAt?.toIso8601String(),
      'referTo': instance.referTo,
      'nationalId': instance.nationalId,
      'surname': instance.surname,
      'referFrom': instance.referFrom,
      'referReason': instance.referReason,
      'responseReason': instance.responseReason,
      'responseDate': instance.responseDate?.toIso8601String(),
      'referDate': instance.referDate?.toIso8601String(),
      'referStatus': instance.referStatus,
      'monitoringRoundType': instance.monitoringRoundType,
      'referToId': instance.referToId,
      'referFromId': instance.referFromId,
    };

ReceiverEntity _$ReceiverEntityFromJson(Map<String, dynamic> json) =>
    ReceiverEntity(
      content: (json['content'] as List<dynamic>)
          .map((e) => ReceiverContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
    );

Map<String, dynamic> _$ReceiverEntityToJson(ReceiverEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

ReceiverContentEntity _$ReceiverContentEntityFromJson(
        Map<String, dynamic> json) =>
    ReceiverContentEntity(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      level: json['level'] as String?,
      workflow: json['workflow'] as String?,
      cycle: json['cycle'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      referTo: json['referTo'] as String?,
      nationalId: json['nationalId'] as String?,
      surname: json['surname'] as String?,
      referFrom: json['referFrom'] as String?,
      referReason: json['referReason'] as String?,
      responseReason: json['responseReason'] as String?,
      responseDate: json['responseDate'] == null
          ? null
          : DateTime.parse(json['responseDate'] as String),
      referDate: json['referDate'] == null
          ? null
          : DateTime.parse(json['referDate'] as String),
      referStatus: json['referStatus'] as String?,
      monitoringRoundType: json['monitoringRoundType'] as String?,
      referToId: (json['referToId'] as num?)?.toInt(),
      referFromId: (json['referFromId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReceiverContentEntityToJson(
        ReceiverContentEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'level': instance.level,
      'workflow': instance.workflow,
      'cycle': instance.cycle,
      'createdAt': instance.createdAt?.toIso8601String(),
      'referTo': instance.referTo,
      'nationalId': instance.nationalId,
      'surname': instance.surname,
      'referFrom': instance.referFrom,
      'referReason': instance.referReason,
      'responseReason': instance.responseReason,
      'responseDate': instance.responseDate?.toIso8601String(),
      'referDate': instance.referDate?.toIso8601String(),
      'referStatus': instance.referStatus,
      'monitoringRoundType': instance.monitoringRoundType,
      'referToId': instance.referToId,
      'referFromId': instance.referFromId,
    };
