import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'certificate-entity.g.dart';

@JsonSerializable()
class CertificateEntity {
  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<ContentEntity>? content;
  int? number;
  SortEntity? sort;
  int? numberOfElements;
  PageableEntity? pageable;
  bool? empty;

  CertificateEntity({
    required this.totalPages,
    required this.totalElements,
    required this.first,
    required this.last,
    required this.size,
    required this.content,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.pageable,
    required this.empty,
  });
  factory CertificateEntity.fromJson(Map<String, dynamic> json) =>
      _$CertificateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateEntityToJson(this);
}

@JsonSerializable()
class ContentEntity {
  String? name;
  int? id;
  String? status;
  String? surname;
  String? nationalId;
  DateTime? requestedDate;
  DateTime? approvedDate;
  String? approvedName;
  String? approvedSurname;

  ContentEntity({
    required this.name,
    required this.id,
    required this.status,
    required this.surname,
    required this.nationalId,
    required this.requestedDate,
    required this.approvedDate,
    required this.approvedName,
    required this.approvedSurname,
  });

  factory ContentEntity.fromJson(Map<String, dynamic> json) =>
      _$ContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ContentEntityToJson(this);
}

@JsonSerializable()
class PageableEntity {
  int? offset;
  SortEntity? sort;
  int? pageNumber;
  int? pageSize;
  bool? paged;
  bool? unpaged;

  PageableEntity({
    required this.offset,
    required this.sort,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  factory PageableEntity.fromJson(Map<String, dynamic> json) =>
      _$PageableEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PageableEntityToJson(this);
}

@JsonSerializable()
class SortEntity {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  SortEntity({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });
  factory SortEntity.fromJson(Map<String, dynamic> json) =>
      _$SortEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SortEntityToJson(this);
}
