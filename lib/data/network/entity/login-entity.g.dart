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

ProfilesOfficerEntity _$ProfilesOfficerEntityFromJson(
        Map<String, dynamic> json) =>
    ProfilesOfficerEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      subDivisionName: json['subDivisionName'] as String?,
      roleName: json['roleName'] as String?,
      roleScopes: (json['roleScopes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProfilesOfficerEntityToJson(
        ProfilesOfficerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'subDivisionName': instance.subDivisionName,
      'roleName': instance.roleName,
      'roleScopes': instance.roleScopes,
    };
