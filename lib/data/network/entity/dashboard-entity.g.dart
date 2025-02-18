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
