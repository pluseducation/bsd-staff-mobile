import 'package:json_annotation/json_annotation.dart';
part 'patient-entity.g.dart';

@JsonSerializable()
class PatientAllEntity {
  List<PatientEntity> content;
  int totalPages;
  int totalElements;

  PatientAllEntity({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });

  factory PatientAllEntity.fromJson(Map<String, dynamic> json) =>
      _$PatientAllEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAllEntityToJson(this);
}

@JsonSerializable()
class PatientEntity {
  String name;
  String? status;
  int patientId;
  String surname;
  String? cycle;
  String nationalId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? generatedId;

  PatientEntity({
    required this.name,
    required this.status,
    required this.patientId,
    required this.surname,
    required this.cycle,
    required this.nationalId,
    required this.createdAt,
    required this.updatedAt,
    required this.generatedId,
  });

  factory PatientEntity.fromJson(Map<String, dynamic> json) =>
      _$PatientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PatientEntityToJson(this);
}
