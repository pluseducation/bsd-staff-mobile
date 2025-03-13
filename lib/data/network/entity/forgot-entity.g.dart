// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotEntity _$ForgotEntityFromJson(Map<String, dynamic> json) => ForgotEntity(
      reqAuthenToken: json['reqAuthenToken'] as String?,
      phoneNo: json['phoneNo'] as String?,
    );

Map<String, dynamic> _$ForgotEntityToJson(ForgotEntity instance) =>
    <String, dynamic>{
      'reqAuthenToken': instance.reqAuthenToken,
      'phoneNo': instance.phoneNo,
    };
