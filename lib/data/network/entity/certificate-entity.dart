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
  String? cycle;
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
    required this.cycle,
    required this.requestedDate,
    required this.approvedDate,
    required this.approvedName,
    required this.approvedSurname,
  });

  factory CertificateContentEntity.fromJson(Map<String, dynamic> json) =>
      _$CertificateContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateContentEntityToJson(this);
}
