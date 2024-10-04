// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config-server-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigServerEntity _$ConfigServerEntityFromJson(Map<String, dynamic> json) =>
    ConfigServerEntity(
      iosVersion: json['iosVersion'] as String?,
      iosUpdateUrl: json['iosUpdateUrl'] as String?,
      iosIsDeploy: json['iosIsDeploy'] as String?,
      androidVersion: json['androidVersion'] as String?,
      androidUpdateUrl: json['androidUpdateUrl'] as String?,
      androidIsDeploy: json['androidIsDeploy'] as String?,
    );

Map<String, dynamic> _$ConfigServerEntityToJson(ConfigServerEntity instance) =>
    <String, dynamic>{
      'iosVersion': instance.iosVersion,
      'iosUpdateUrl': instance.iosUpdateUrl,
      'iosIsDeploy': instance.iosIsDeploy,
      'androidVersion': instance.androidVersion,
      'androidUpdateUrl': instance.androidUpdateUrl,
      'androidIsDeploy': instance.androidIsDeploy,
    };
