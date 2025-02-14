import 'package:json_annotation/json_annotation.dart';
part 'certificate-entity.g.dart';

@JsonSerializable()
class CertificateEntity {
  List<CertificateContentEntity>? content;
  int? totalPages;
  int? totalElements;

  CertificateEntity({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });
  factory CertificateEntity.fromJson(Map<String, dynamic> json) =>
      _$CertificateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateEntityToJson(this);
}

@JsonSerializable()
class CertificateContentEntity {
  String? status;
  String? name;
  int? id;
  String? nationalId;
  String? surname;
  DateTime? requestedDate;
  DateTime? approvedDate;
  String? approvedName;
  String? approvedSurname;

  CertificateContentEntity({
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

  factory CertificateContentEntity.fromJson(Map<String, dynamic> json) =>
      _$CertificateContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateContentEntityToJson(this);
}

// @JsonSerializable()
// class PageableEntity {
//   int? offset;
//   SortEntity? sort;
//   int? pageNumber;
//   int? pageSize;
//   bool? paged;
//   bool? unpaged;

//   PageableEntity({
//     required this.offset,
//     required this.sort,
//     required this.pageNumber,
//     required this.pageSize,
//     required this.paged,
//     required this.unpaged,
//   });

//   factory PageableEntity.fromJson(Map<String, dynamic> json) =>
//       _$PageableEntityFromJson(json);

//   Map<String, dynamic> toJson() => _$PageableEntityToJson(this);
// }

// @JsonSerializable()
// class SortEntity {
//   bool? empty;
//   bool? sorted;
//   bool? unsorted;

//   SortEntity({
//     required this.empty,
//     required this.sorted,
//     required this.unsorted,
//   });
//   factory SortEntity.fromJson(Map<String, dynamic> json) =>
//       _$SortEntityFromJson(json);

//   Map<String, dynamic> toJson() => _$SortEntityToJson(this);
// }
