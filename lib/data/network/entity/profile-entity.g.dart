// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      userId: (json['userId'] as num?)?.toInt(),
      username: json['username'] as String?,
      roleId: (json['roleId'] as num?)?.toInt(),
      subDivisionId: (json['subDivisionId'] as num?)?.toInt(),
      active: json['active'] as bool?,
      officerId: (json['officerId'] as num?)?.toInt(),
      nameTh: json['nameTh'] as String?,
      surnameTh: json['surnameTh'] as String?,
      nationalId: json['nationalId'] as String?,
      phoneNo: json['phoneNo'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'roleId': instance.roleId,
      'subDivisionId': instance.subDivisionId,
      'active': instance.active,
      'officerId': instance.officerId,
      'nameTh': instance.nameTh,
      'surnameTh': instance.surnameTh,
      'nationalId': instance.nationalId,
      'phoneNo': instance.phoneNo,
      'email': instance.email,
    };

ProfileUpdateEntity _$ProfileUpdateEntityFromJson(Map<String, dynamic> json) =>
    ProfileUpdateEntity(
      userId: (json['userId'] as num?)?.toInt(),
      username: json['username'] as String?,
      roleId: (json['roleId'] as num?)?.toInt(),
      subDivisionId: (json['subDivisionId'] as num?)?.toInt(),
      active: json['active'] as bool?,
      officerId: (json['officerId'] as num?)?.toInt(),
      nameTh: json['nameTh'] as String?,
      surnameTh: json['surnameTh'] as String?,
      nationalId: json['nationalId'] as String?,
      phoneNo: json['phoneNo'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileUpdateEntityToJson(
        ProfileUpdateEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'roleId': instance.roleId,
      'subDivisionId': instance.subDivisionId,
      'active': instance.active,
      'officerId': instance.officerId,
      'nameTh': instance.nameTh,
      'surnameTh': instance.surnameTh,
      'nationalId': instance.nationalId,
      'phoneNo': instance.phoneNo,
      'email': instance.email,
    };
