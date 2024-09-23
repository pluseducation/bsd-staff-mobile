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

ProfileOfficerEntity _$ProfileOfficerEntityFromJson(
        Map<String, dynamic> json) =>
    ProfileOfficerEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      imageUrl: json['imageUrl'] as String?,
      subDivisionId: (json['subDivisionId'] as num?)?.toInt(),
      subDivisionName: json['subDivisionName'] as String?,
      subDivisionLevel: json['subDivisionLevel'] as String?,
      roleName: json['roleName'] as String?,
      roleScopes: (json['roleScopes'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$ProfileOfficerEntityToJson(
        ProfileOfficerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'imageUrl': instance.imageUrl,
      'subDivisionId': instance.subDivisionId,
      'subDivisionName': instance.subDivisionName,
      'subDivisionLevel': instance.subDivisionLevel,
      'roleName': instance.roleName,
      'roleScopes': instance.roleScopes,
    };
