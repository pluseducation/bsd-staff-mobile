// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) =>
              NotificationContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

NotificationContentEntity _$NotificationContentEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationContentEntity(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      msg: json['msg'] as String?,
      acknowledged: (json['acknowledged'] as num?)?.toInt(),
    )..title = json['title'] as String?;

Map<String, dynamic> _$NotificationContentEntityToJson(
        NotificationContentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'msg': instance.msg,
      'acknowledged': instance.acknowledged,
    };
