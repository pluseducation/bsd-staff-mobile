import 'package:json_annotation/json_annotation.dart';

part 'workflow-entity.g.dart';

@JsonSerializable()
class RegisteringEntity {
  int? patientId;
  String? name;
  String? surname;
  String? nationalId;
  String? phoneNo;
  String? dateOfBirth;
  int? age;
  String? gender;
  String? nationality;
  String? religion;
  String? hometownProvince;
  String? registeredHouseNo;
  String? registeredHouseMoo;
  String? registeredVillage;
  String? registeredHouseRoad;
  String? registeredProvince;
  String? registeredDistrict;
  String? registeredSubDistrict;
  String? registeredPostalCode;
  String? currentHouseNo;
  String? currentHouseMoo;
  String? currentVillage;
  String? currentHouseRoad;
  String? currentProvince;
  String? currentDistrict;
  String? currentSubDistrict;
  String? currentPostalCode;
  String? maritalStatus;
  String? education;
  String? occupation;
  String? income;
  String? guardianName;
  String? guardianSurname;
  String? guardianRelationship;
  String? guardianPhoneNo;
  String? livingWith;
  String? joinTreatmentBy;
  String? joinSentByCourt;

  RegisteringEntity({
    this.patientId,
    this.name,
    this.surname,
    this.nationalId,
    this.phoneNo,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.nationality,
    this.religion,
    this.hometownProvince,
    this.registeredHouseNo,
    this.registeredHouseMoo,
    this.registeredVillage,
    this.registeredHouseRoad,
    this.registeredProvince,
    this.registeredDistrict,
    this.registeredSubDistrict,
    this.registeredPostalCode,
    this.currentHouseNo,
    this.currentHouseMoo,
    this.currentVillage,
    this.currentHouseRoad,
    this.currentProvince,
    this.currentDistrict,
    this.currentSubDistrict,
    this.currentPostalCode,
    this.maritalStatus,
    this.education,
    this.occupation,
    this.income,
    this.guardianName,
    this.guardianSurname,
    this.guardianRelationship,
    this.guardianPhoneNo,
    this.livingWith,
    this.joinTreatmentBy,
    this.joinSentByCourt,
  });

  factory RegisteringEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisteringEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegisteringEntityToJson(this);
}

@JsonSerializable()
class ScreeningEntity {
  String? screeningDate;
  String? level;
  String? drugEvalResult;
  String? isToBeNumberOneMember;
  String? toBeNumberOneDate;
  String? drugUsageApproach;
  String? injectableDrug;
  String? mainDrug;
  String? secondaryDrug;
  String? hadMentalTreatment;
  String? mentalTreatment;
  String? mentalTreatmentOther;
  String? hadChronicContagious;
  String? chronicContagious;
  String? chronicContagiousOther;
  String? hadCriminalCase;
  String? criminalCase;
  String? criminalCaseOther;
  String? homeless;
  String? disabledPerson;
  String? disabledCertificateNo;

  ScreeningEntity({
    this.screeningDate,
    this.level,
    this.drugEvalResult,
    this.isToBeNumberOneMember,
    this.toBeNumberOneDate,
    this.drugUsageApproach,
    this.injectableDrug,
    this.mainDrug,
    this.secondaryDrug,
    this.hadMentalTreatment,
    this.mentalTreatment,
    this.mentalTreatmentOther,
    this.hadChronicContagious,
    this.chronicContagious,
    this.chronicContagiousOther,
    this.hadCriminalCase,
    this.criminalCase,
    this.criminalCaseOther,
    this.homeless,
    this.disabledPerson,
    this.disabledCertificateNo,
  });

  factory ScreeningEntity.fromJson(Map<String, dynamic> json) =>
      _$ScreeningEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ScreeningEntityToJson(this);
}

@JsonSerializable()
class MonitoringEntity {
  String? status;
  DateTime? startDate;
  DateTime? endDate;
  int? round;
  String? roundType;
  int? roundId;
  String? subdivision;
  int? subdivisionId;
  String? latestResult;
  int? finalRound;
  String? treatmentType;

  MonitoringEntity({
    this.status,
    this.startDate,
    this.endDate,
    this.round,
    this.roundType,
    this.roundId,
    this.subdivision,
    this.subdivisionId,
    this.latestResult,
    this.finalRound,
    this.treatmentType,
  });

  factory MonitoringEntity.fromJson(Map<String, dynamic> json) =>
      _$MonitoringEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringEntityToJson(this);

  static List<MonitoringEntity> fromJsons(List data) =>
      List<MonitoringEntity>.from(
        data.map(
          (x) => MonitoringEntity.fromJson(x as Map<String, dynamic>),
        ),
      );
}

// delete
// ---------------treatments------------------
@JsonSerializable()
class TreatmentEntity {
  int? patientId;
  DateTime? startDate;
  DateTime? treatmentDate;
  String? refFilePath;
  String? refFileName;
  int? firstAgeUsage;
  int? firstDrugUsageId;
  int? yearOfUsage;
  int? monthOfUsage;
  int? dayOfUsage;
  double? totalUsage;
  String? hadTreatment;
  List<HistoryEntity>? histories;
  List<AnswerEntity>? usageReasons;
  List<AnswerEntity>? currentDrugUsages;
  List<AnswerEntity>? joinReasons;
  List<DrugUsageBeforeEntity>? drugUsageBefores;
  String? hadDosing;
  String? otherDosing;
  List<String>? dosings;
  List<AnswerEntity>? techniques;
  List<AnswerEntity>? programmes;
  List<PlanEntity>? plans;
  String? frequencyOfUse;
  String? feelingAddicted;
  String? frequencyOfProblem;
  String? irresponsible;
  String? beNoticed;
  String? stopUsingButNotSuccess;
  int? drugEvalScore;
  String? levelOfAddicted;
  String? treatmentResult;
  List<int>? mentalIssueIds;
  int? mentalScore;
  String? mentalEvalLevel;
  DateTime? latestTreatmentEvalDate;
  DateTime? evaluationDate;
  String? evaluationResult;
  String? monitoringReportMentalTo;
  int? monitoringReportMentalReferId;
  String? monitoringReportSocialTo;
  int? monitoringReportSocialReferId;
  String? incompletedReason;
  String? mentalTreatmentResult;
  String? physicalTreatmentResult;
  List<FileElementdataEntity>? files;
  List<NewFileEntity>? newFiles;
  List<int>? removeFiles;

  TreatmentEntity({
    required this.patientId,
    required this.startDate,
    required this.refFilePath,
    required this.refFileName,
    required this.firstAgeUsage,
    required this.firstDrugUsageId,
    required this.yearOfUsage,
    required this.monthOfUsage,
    required this.dayOfUsage,
    required this.totalUsage,
    required this.hadTreatment,
    required this.histories,
    required this.usageReasons,
    required this.currentDrugUsages,
    required this.joinReasons,
    required this.drugUsageBefores,
    required this.hadDosing,
    required this.otherDosing,
    required this.dosings,
    required this.techniques,
    required this.programmes,
    required this.plans,
    required this.frequencyOfUse,
    required this.feelingAddicted,
    required this.frequencyOfProblem,
    required this.irresponsible,
    required this.beNoticed,
    required this.stopUsingButNotSuccess,
    required this.drugEvalScore,
    required this.levelOfAddicted,
    required this.treatmentResult,
    required this.mentalIssueIds,
    required this.mentalScore,
    required this.mentalEvalLevel,
    required this.latestTreatmentEvalDate,
    required this.evaluationDate,
    required this.evaluationResult,
    required this.monitoringReportMentalTo,
    required this.monitoringReportMentalReferId,
    required this.monitoringReportSocialTo,
    required this.monitoringReportSocialReferId,
    required this.incompletedReason,
    required this.mentalTreatmentResult,
    required this.physicalTreatmentResult,
    required this.files,
    required this.newFiles,
    required this.removeFiles,
  });

  factory TreatmentEntity.fromJson(Map<String, dynamic> json) =>
      _$TreatmentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentEntityToJson(this);
}

@JsonSerializable()
class DrugUsageBeforeEntity {
  int? order;
  int? drugId;
  int? drugApproachId;
  int? gramPerDay;
  int? drugUnitId;
  int? qtyAmountUsage;
  int? drugFrequencyUsageId;
  bool? main;
  int? firstYearUsage;

  DrugUsageBeforeEntity({
    required this.order,
    required this.drugId,
    required this.drugApproachId,
    required this.gramPerDay,
    required this.drugUnitId,
    required this.qtyAmountUsage,
    required this.drugFrequencyUsageId,
    required this.main,
    required this.firstYearUsage,
  });

  factory DrugUsageBeforeEntity.fromJson(Map<String, dynamic> json) =>
      _$DrugUsageBeforeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DrugUsageBeforeEntityToJson(this);
}

@JsonSerializable()
class FileElementdataEntity {
  int? documentId;
  String? fileNameOrg;

  FileElementdataEntity({
    required this.documentId,
    required this.fileNameOrg,
  });
  factory FileElementdataEntity.fromJson(Map<String, dynamic> json) =>
      _$FileElementdataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FileElementdataEntityToJson(this);
}

@JsonSerializable()
class PlanEntity {
  int? order;
  String? planType;
  DateTime? endDate;
  String? other;
  int? subDistrictId;
  int? villageId;
  List<PlanEvalResultEntity>? planEvalResults;

  PlanEntity({
    required this.order,
    required this.planType,
    required this.endDate,
    required this.other,
    required this.subDistrictId,
    required this.villageId,
    required this.planEvalResults,
  });

  factory PlanEntity.fromJson(Map<String, dynamic> json) =>
      _$PlanEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlanEntityToJson(this);
}

@JsonSerializable()
class PlanEvalResultEntity {
  int? order;
  DateTime? evalDate;
  int? evalResult;

  PlanEvalResultEntity({
    required this.order,
    required this.evalDate,
    required this.evalResult,
  });
  factory PlanEvalResultEntity.fromJson(Map<String, dynamic> json) =>
      _$PlanEvalResultEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlanEvalResultEntityToJson(this);
}

@JsonSerializable()
class HistoryEntity {
  int? subDivisionId;
  int? times;
  DateTime? lastestUsedDate;

  HistoryEntity({
    required this.subDivisionId,
    required this.times,
    required this.lastestUsedDate,
  });
  factory HistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryEntityToJson(this);
}

// ProfileEntity
@JsonSerializable()
class ProfileEntity {
  String? name;
  String? middleName;
  String? surname;
  String? patientStatus;
  String? level;

  ProfileEntity({
    required this.name,
    required this.middleName,
    required this.surname,
    required this.patientStatus,
    required this.level,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);
}

//  -------- master -------

@JsonSerializable()
class AnswerEntity {
  String? answer;
  String? other;

  AnswerEntity({
    this.answer,
    this.other,
  });

  factory AnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerEntityToJson(this);
}

@JsonSerializable()
class FileElementdataEntityEntity {
  int? documentId;
  String? fileNameOrg;

  FileElementdataEntityEntity({
    this.documentId,
    this.fileNameOrg,
  });

  factory FileElementdataEntityEntity.fromJson(Map<String, dynamic> json) =>
      _$FileElementdataEntityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FileElementdataEntityEntityToJson(this);
}

@JsonSerializable()
class NewFileEntity {
  String? fileNameOrg;
  String? content;

  NewFileEntity({
    this.fileNameOrg,
    this.content,
  });

  factory NewFileEntity.fromJson(Map<String, dynamic> json) =>
      _$NewFileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewFileEntityToJson(this);
}
