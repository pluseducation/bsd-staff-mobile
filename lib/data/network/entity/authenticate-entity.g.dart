// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateEntity _$AuthenticateEntityFromJson(Map<String, dynamic> json) =>
    AuthenticateEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthenticateEntityToJson(AuthenticateEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
