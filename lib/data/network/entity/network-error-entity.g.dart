// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-error-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkErrorEntity _$NetworkErrorEntityFromJson(Map<String, dynamic> json) =>
    NetworkErrorEntity(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NetworkErrorEntityToJson(NetworkErrorEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
