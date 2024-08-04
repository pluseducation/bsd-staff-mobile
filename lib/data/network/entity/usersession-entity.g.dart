// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersession-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSessionEntity _$UserSessionEntityFromJson(Map<String, dynamic> json) =>
    UserSessionEntity(
      status: json['status'] as String?,
      webAgentId: json['webAgentId'] as String?,
      mobileDeviceId: json['mobileDeviceId'] as String?,
      loginAt: json['loginAt'] == null
          ? null
          : DateTime.parse(json['loginAt'] as String),
    );

Map<String, dynamic> _$UserSessionEntityToJson(UserSessionEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'webAgentId': instance.webAgentId,
      'mobileDeviceId': instance.mobileDeviceId,
      'loginAt': instance.loginAt?.toIso8601String(),
    };
