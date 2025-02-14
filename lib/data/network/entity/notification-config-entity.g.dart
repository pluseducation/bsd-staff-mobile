// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification-config-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationConfigEntity _$NotificationConfigEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationConfigEntity(
      appointment: json['appointment'] as bool?,
      monitoring: json['monitoring'] as bool?,
      refer: json['refer'] as bool?,
      assistant: json['assistant'] as bool?,
      login: json['login'] as bool?,
    );

Map<String, dynamic> _$NotificationConfigEntityToJson(
        NotificationConfigEntity instance) =>
    <String, dynamic>{
      'appointment': instance.appointment,
      'monitoring': instance.monitoring,
      'refer': instance.refer,
      'assistant': instance.assistant,
      'login': instance.login,
    };
