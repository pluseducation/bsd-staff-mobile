// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      reqAuthenToken: json['reqAuthenToken'] as String?,
      loggedTooLong: json['loggedTooLong'] as bool?,
      phoneNo: json['phoneNo'] as String?,
    );

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'reqAuthenToken': instance.reqAuthenToken,
      'loggedTooLong': instance.loggedTooLong,
      'phoneNo': instance.phoneNo,
    };
