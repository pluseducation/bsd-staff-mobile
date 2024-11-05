import 'package:json_annotation/json_annotation.dart';

part 'workflow-entity.g.dart';

@JsonSerializable()
class RegisteringEntity {
  String? subDivisionName;
  String? subDivisionNo;
  String? subDivisionMoo;
  String? subDivisionSubDistrict;
  String? subDivisionDistrict;
  String? subDivisionProvince;
  String? subDivisionTel;
  dynamic subDivisionFax;
  String? name;
  String? surname;
  String? gender;
  String? nationality;
  String? religion;
  String? nationalId;
  String? generatedId;
  String? dateOfBirth;
  int? age;
  String? phoneNo;
  String? hometownProvince;
  bool? currentAddrAsRegistered;
  String? registeredHouseNo;
  String? registeredHouseMoo;
  String? registeredHouseRoad;
  String? registeredVillage;
  String? registeredSubDistrict;
  String? registeredDistrict;
  String? registeredProvince;
  String? currentHouseNo;
  String? currentHouseMoo;
  String? currentHouseRoad;
  String? currentVillage;
  String? currentSubDistrict;
  String? currentDistrict;
  String? currentProvince;
  bool? haveGuardian;
  String? guardianName;
  String? guardianSurname;
  String? guardianRelationShip;
  String? guardianPhoneNo;
  String? joinTreatmentBy;
  String? joinSentByCourt;

  RegisteringEntity({
    required this.subDivisionName,
    required this.subDivisionNo,
    required this.subDivisionMoo,
    required this.subDivisionSubDistrict,
    required this.subDivisionDistrict,
    required this.subDivisionProvince,
    required this.subDivisionTel,
    required this.subDivisionFax,
    required this.name,
    required this.surname,
    required this.gender,
    required this.nationality,
    required this.religion,
    required this.nationalId,
    required this.generatedId,
    required this.dateOfBirth,
    required this.age,
    required this.phoneNo,
    required this.hometownProvince,
    required this.currentAddrAsRegistered,
    required this.registeredHouseNo,
    required this.registeredHouseMoo,
    required this.registeredHouseRoad,
    required this.registeredVillage,
    required this.registeredSubDistrict,
    required this.registeredDistrict,
    required this.registeredProvince,
    required this.currentHouseNo,
    required this.currentHouseMoo,
    required this.currentHouseRoad,
    required this.currentVillage,
    required this.currentSubDistrict,
    required this.currentDistrict,
    required this.currentProvince,
    required this.haveGuardian,
    required this.guardianName,
    required this.guardianSurname,
    required this.guardianRelationShip,
    required this.guardianPhoneNo,
    required this.joinTreatmentBy,
    required this.joinSentByCourt,
  });

  factory RegisteringEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisteringEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegisteringEntityToJson(this);
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
// ---------------screening------------------

@JsonSerializable()
class ScreeningEntity {
  int? patientId;
  DateTime? startDate;
  DateTime? screeningDate;
  String? refFilePath;
  String? refFileName;
  int? maritalStatusId;
  int? educationId;
  int? occupationId;
  String? occupationOther;
  int? incomeId;
  int? parentRelationshipId;
  List<AnswerEntity>? livingWithLast30days;
  List<AnswerEntity>? mainDrugs;
  List<AnswerEntity>? secondaryDrugs;
  String? isToBeNumberOneMember;
  String? drugUsageApproach;
  String? frequencyOfUse;
  String? feelingAddicted;
  String? frequencyOfProblem;
  String? irresponsible;
  String? beNoticed;
  String? stopUsingButNotSuccess;
  int? drugEvalScore;
  String? levelOfAddicted;
  String? screeningResult;
  String? injectableDrug;
  String? last3MonthUsage;
  List<int>? mentalIssueIds;
  int? mentalEvalScore;
  String? mentalEvalLevel;
  String? hadMentalTreatment;
  int? mentalTreatmentId;
  String? hadChronicContagious;
  int? chronicContagiousId;
  String? hadCriminalCase;
  int? criminalCaseId;
  String? homeless;
  String? disabledPerson;
  String? disabledCertificateNo;
  List<FileElementdataEntityEntity>? files;
  List<NewFileEntity>? newFiles;
  List<int>? removeDocIds;

  ScreeningEntity({
    required this.patientId,
    required this.startDate,
    required this.screeningDate,
    required this.refFilePath,
    required this.refFileName,
    required this.maritalStatusId,
    required this.educationId,
    required this.occupationId,
    required this.occupationOther,
    required this.incomeId,
    required this.parentRelationshipId,
    required this.livingWithLast30days,
    required this.mainDrugs,
    required this.secondaryDrugs,
    required this.isToBeNumberOneMember,
    required this.drugUsageApproach,
    required this.frequencyOfUse,
    required this.feelingAddicted,
    required this.frequencyOfProblem,
    required this.irresponsible,
    required this.beNoticed,
    required this.stopUsingButNotSuccess,
    required this.drugEvalScore,
    required this.levelOfAddicted,
    required this.screeningResult,
    required this.injectableDrug,
    required this.last3MonthUsage,
    required this.mentalIssueIds,
    required this.mentalEvalScore,
    required this.mentalEvalLevel,
    required this.hadMentalTreatment,
    required this.mentalTreatmentId,
    required this.hadChronicContagious,
    required this.chronicContagiousId,
    required this.hadCriminalCase,
    required this.criminalCaseId,
    required this.homeless,
    required this.disabledPerson,
    required this.disabledCertificateNo,
    required this.files,
    required this.newFiles,
    required this.removeDocIds,
  });

  factory ScreeningEntity.fromJson(Map<String, dynamic> json) =>
      _$ScreeningEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ScreeningEntityToJson(this);
}

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
