// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterEntity _$RegisterEntityFromJson(Map<String, dynamic> json) =>
    RegisterEntity(
      username: json['username'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phone: json['phone'] as String?,
      nationalId: json['nationalId'] as String?,
      reqAuthenToken: json['reqAuthenToken'] as String?,
    );

Map<String, dynamic> _$RegisterEntityToJson(RegisterEntity instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
      'nationalId': instance.nationalId,
      'reqAuthenToken': instance.reqAuthenToken,
    };

RegisterFormEntity _$RegisterFormEntityFromJson(Map<String, dynamic> json) =>
    RegisterFormEntity(
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$RegisterFormEntityToJson(RegisterFormEntity instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };

OtpEntity _$OtpEntityFromJson(Map<String, dynamic> json) => OtpEntity(
      refno: json['refno'] as String?,
      status: json['status'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$OtpEntityToJson(OtpEntity instance) => <String, dynamic>{
      'refno': instance.refno,
      'status': instance.status,
      'token': instance.token,
    };

ConfirmOtpEntity _$ConfirmOtpEntityFromJson(Map<String, dynamic> json) =>
    ConfirmOtpEntity(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      reqAuthenToken: json['reqAuthenToken'] as String?,
      loggedTooLong: json['loggedTooLong'] as bool?,
      phoneNo: json['phoneNo'] as String?,
      nationalId: json['nationalId'] as String?,
      migrate: json['migrate'] as bool?,
    );

Map<String, dynamic> _$ConfirmOtpEntityToJson(ConfirmOtpEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'reqAuthenToken': instance.reqAuthenToken,
      'loggedTooLong': instance.loggedTooLong,
      'phoneNo': instance.phoneNo,
      'nationalId': instance.nationalId,
      'migrate': instance.migrate,
    };
