// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'officer-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficerEntity _$OfficerEntityFromJson(Map<String, dynamic> json) =>
    OfficerEntity(
      content: (json['content'] as List<dynamic>)
          .map((e) => OfficerContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
    );

Map<String, dynamic> _$OfficerEntityToJson(OfficerEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

OfficerContentEntity _$OfficerContentEntityFromJson(
        Map<String, dynamic> json) =>
    OfficerContentEntity(
      id: (json['id'] as num?)?.toInt(),
      nameTh: json['nameTh'] as String?,
      surnameTh: json['surnameTh'] as String?,
      username: json['username'] as String?,
      roleName: json['roleName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$OfficerContentEntityToJson(
        OfficerContentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameTh': instance.nameTh,
      'surnameTh': instance.surnameTh,
      'username': instance.username,
      'roleName': instance.roleName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'active': instance.active,
    };
