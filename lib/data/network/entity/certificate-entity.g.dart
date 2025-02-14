// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateEntity _$CertificateEntityFromJson(Map<String, dynamic> json) =>
    CertificateEntity(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) =>
              CertificateContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CertificateEntityToJson(CertificateEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };

CertificateContentEntity _$CertificateContentEntityFromJson(
        Map<String, dynamic> json) =>
    CertificateContentEntity(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      surname: json['surname'] as String?,
      nationalId: json['nationalId'] as String?,
      requestedDate: json['requestedDate'] == null
          ? null
          : DateTime.parse(json['requestedDate'] as String),
      approvedDate: json['approvedDate'] == null
          ? null
          : DateTime.parse(json['approvedDate'] as String),
      approvedName: json['approvedName'] as String?,
      approvedSurname: json['approvedSurname'] as String?,
    );

Map<String, dynamic> _$CertificateContentEntityToJson(
        CertificateContentEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'id': instance.id,
      'nationalId': instance.nationalId,
      'surname': instance.surname,
      'requestedDate': instance.requestedDate?.toIso8601String(),
      'approvedDate': instance.approvedDate?.toIso8601String(),
      'approvedName': instance.approvedName,
      'approvedSurname': instance.approvedSurname,
    };
