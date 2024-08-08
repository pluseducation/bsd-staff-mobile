// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NationalityEntity _$NationalityEntityFromJson(Map<String, dynamic> json) =>
    NationalityEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NationalityEntityToJson(NationalityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ReligionsEntity _$ReligionsEntityFromJson(Map<String, dynamic> json) =>
    ReligionsEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ReligionsEntityToJson(ReligionsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

RelationshipsEntity _$RelationshipsEntityFromJson(Map<String, dynamic> json) =>
    RelationshipsEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RelationshipsEntityToJson(
        RelationshipsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
