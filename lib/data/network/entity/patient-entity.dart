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
  String? drugEval;
  String? level;
  String? treatmentType;
  String? smiv;

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
    required this.drugEval,
    required this.level,
    required this.treatmentType,
    required this.smiv,
  });

  factory PatientEntity.fromJson(Map<String, dynamic> json) =>
      _$PatientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PatientEntityToJson(this);
}

@JsonSerializable()
class PatientHistoryEntity {
  String? cycle;
  int? no;
  DateTime? date;
  String? workflowType;
  int? subDivisionId;
  String? subDivisionName;
  DateTime? createdAt;
  DateTime? treatmentDate;
  int? monitoringRound;

  PatientHistoryEntity({
    required this.cycle,
    required this.no,
    required this.date,
    required this.workflowType,
    required this.subDivisionId,
    required this.subDivisionName,
    required this.createdAt,
    required this.treatmentDate,
    required this.monitoringRound,
  });

  factory PatientHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$PatientHistoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PatientHistoryEntityToJson(this);

  static List<PatientHistoryEntity> fromJsons(List data) =>
      List<PatientHistoryEntity>.from(
        data.map(
          (x) => PatientHistoryEntity.fromJson(x as Map<String, dynamic>),
        ),
      );
}
