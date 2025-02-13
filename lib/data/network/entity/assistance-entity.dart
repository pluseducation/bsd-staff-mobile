import 'package:json_annotation/json_annotation.dart';
part 'assistance-entity.g.dart';

@JsonSerializable()
class AssistanceAllEntity {
  List<AssistanceEntity> content;
  int totalPages;
  int totalElements;

  AssistanceAllEntity({
    required this.content,
    required this.totalPages,
    required this.totalElements,
  });

  factory AssistanceAllEntity.fromJson(Map<String, dynamic> json) =>
      _$AssistanceAllEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AssistanceAllEntityToJson(this);
}

@JsonSerializable()
class AssistanceEntity {
  int? assistanceId;
  String? cycle;
  String? nationalId;
  String? name;
  String? surname;
  String? workflowType;
  int? senderSubDivisionId;
  String? senderSubDivisionName;
  int? receiverSubDivisionId;
  String? receiverSubDivisionName;
  String? assistanceStatus;
  int? patientId;
  int? latestRoundId;

  AssistanceEntity({
    required this.assistanceId,
    required this.cycle,
    required this.nationalId,
    required this.name,
    required this.surname,
    required this.workflowType,
    required this.senderSubDivisionId,
    required this.senderSubDivisionName,
    required this.receiverSubDivisionId,
    required this.receiverSubDivisionName,
    required this.assistanceStatus,
    required this.patientId,
    required this.latestRoundId,
  });

  factory AssistanceEntity.fromJson(Map<String, dynamic> json) =>
      _$AssistanceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AssistanceEntityToJson(this);
}

//-------------------- lib

@JsonSerializable()
class AssistanceDetailContentEntity {
  int? id;
  int? assistanceTypeId;
  String? assistanceTypeName;
  String? assistanceTypeOther;
  int? subDivisionId;
  String? status;
  String? remark;
  int? exceedReasonId;
  int? assistanceDepartmentId;
  String? assistanceDepartmentName;
  int? assistanceSubDivisionId;
  String? assistanceSubDivisionName;

  AssistanceDetailContentEntity({
    required this.id,
    required this.assistanceTypeId,
    required this.assistanceTypeName,
    required this.assistanceTypeOther,
    required this.subDivisionId,
    required this.status,
    required this.remark,
    required this.exceedReasonId,
    required this.assistanceDepartmentId,
    required this.assistanceDepartmentName,
    required this.assistanceSubDivisionId,
    required this.assistanceSubDivisionName,
  });

  factory AssistanceDetailContentEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AssistanceDetailContentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AssistanceDetailContentEntityToJson(this);
}
