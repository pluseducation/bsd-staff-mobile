// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      appointment: json['appointment'] as bool?,
      monitoring: json['monitoring'] as bool?,
      refer: json['refer'] as bool?,
      assistant: json['assistant'] as bool?,
      login: json['login'] as bool?,
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'appointment': instance.appointment,
      'monitoring': instance.monitoring,
      'refer': instance.refer,
      'assistant': instance.assistant,
      'login': instance.login,
    };

UpdateNotificationEntity _$UpdateNotificationEntityFromJson(
        Map<String, dynamic> json) =>
    UpdateNotificationEntity(
      appointment: json['appointment'] as bool?,
      monitoring: json['monitoring'] as bool?,
      refer: json['refer'] as bool?,
      assistant: json['assistant'] as bool?,
      login: json['login'] as bool?,
    );

Map<String, dynamic> _$UpdateNotificationEntityToJson(
        UpdateNotificationEntity instance) =>
    <String, dynamic>{
      'appointment': instance.appointment,
      'monitoring': instance.monitoring,
      'refer': instance.refer,
      'assistant': instance.assistant,
      'login': instance.login,
    };
