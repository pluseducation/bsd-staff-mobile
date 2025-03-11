// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-db-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDbEntity _$LoginDbEntityFromJson(Map<String, dynamic> json) =>
    LoginDbEntity(
      id: (json['login_id'] as num?)?.toInt(),
      username: json['username'] as String,
      pin: json['pin'] as String?,
    );

Map<String, dynamic> _$LoginDbEntityToJson(LoginDbEntity instance) =>
    <String, dynamic>{
      'login_id': instance.id,
      'username': instance.username,
      'pin': instance.pin,
    };
