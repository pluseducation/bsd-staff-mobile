// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateEntity _$CertificateEntityFromJson(Map<String, dynamic> json) =>
    CertificateEntity(
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      first: json['first'] as bool?,
      last: json['last'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ContentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : SortEntity.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      pageable: json['pageable'] == null
          ? null
          : PageableEntity.fromJson(json['pageable'] as Map<String, dynamic>),
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$CertificateEntityToJson(CertificateEntity instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'first': instance.first,
      'last': instance.last,
      'size': instance.size,
      'content': instance.content,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'pageable': instance.pageable,
      'empty': instance.empty,
    };

ContentEntity _$ContentEntityFromJson(Map<String, dynamic> json) =>
    ContentEntity(
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

Map<String, dynamic> _$ContentEntityToJson(ContentEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'status': instance.status,
      'surname': instance.surname,
      'nationalId': instance.nationalId,
      'requestedDate': instance.requestedDate?.toIso8601String(),
      'approvedDate': instance.approvedDate?.toIso8601String(),
      'approvedName': instance.approvedName,
      'approvedSurname': instance.approvedSurname,
    };

PageableEntity _$PageableEntityFromJson(Map<String, dynamic> json) =>
    PageableEntity(
      offset: (json['offset'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : SortEntity.fromJson(json['sort'] as Map<String, dynamic>),
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableEntityToJson(PageableEntity instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'sort': instance.sort,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

SortEntity _$SortEntityFromJson(Map<String, dynamic> json) => SortEntity(
      empty: json['empty'] as bool?,
      sorted: json['sorted'] as bool?,
      unsorted: json['unsorted'] as bool?,
    );

Map<String, dynamic> _$SortEntityToJson(SortEntity instance) =>
    <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };
