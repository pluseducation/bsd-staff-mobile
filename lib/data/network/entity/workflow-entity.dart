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

@JsonSerializable()
class TreatmentEntity {
  String? treatmentDate;
  int? firstAgeUsage;
  String? firstDrugUsage;
  int? yearOfUsage;
  int? monthOfUsage;
  int? dayOfUsage;
  int? totalUsage;
  String? hadTreatment;
  int? hadTreatmentQty;
  List<TreatmentHistoryEntity>? inHistories;
  List<TreatmentHistoryEntity>? outHistories;
  List<AnswerEntity>? usageReasons;
  List<String>? currentDrugUsages;
  List<AnswerEntity>? joinReasons;
  List<DrugUsageBeforeEntity>? drugUsageBefores;
  String? hadDosing;
  String? otherDosing;
  String? otherPhysical;
  String? otherMental;
  List<AnswerEntity>? dosings;
  bool? harmReduction;
  List<String>? harmItems;
  List<AnswerEntity>? techniques;
  List<AnswerEntity>? programmes;
  List<PlanEntity>? plans;
  String? treatmentResult;
  List<int>? mentalIssueIds;
  String? mentalEvalLevel;
  String? latestTreatmentEvalDate;
  String? evaluationDate;
  String? evaluationResult;
  String? monitoringReportMentalTo;
  String? monitoringReportMentalReferName;
  String? monitoringReportSocialTo;
  String? monitoringReportSocialReferName;
  String? completedReason;
  String? incompletedReason;
  String? incompletedReasonOther;
  String? mentalTreatmentResult;
  String? physicalTreatmentResult;

  TreatmentEntity({
    this.treatmentDate,
    this.firstAgeUsage,
    this.firstDrugUsage,
    this.yearOfUsage,
    this.monthOfUsage,
    this.dayOfUsage,
    this.totalUsage,
    this.hadTreatment,
    this.hadTreatmentQty,
    this.inHistories,
    this.outHistories,
    this.usageReasons,
    this.currentDrugUsages,
    this.joinReasons,
    this.drugUsageBefores,
    this.hadDosing,
    this.otherDosing,
    this.otherPhysical,
    this.otherMental,
    this.dosings,
    this.harmReduction,
    this.harmItems,
    this.techniques,
    this.programmes,
    this.plans,
    this.treatmentResult,
    this.mentalIssueIds,
    this.mentalEvalLevel,
    this.latestTreatmentEvalDate,
    this.evaluationDate,
    this.evaluationResult,
    this.monitoringReportMentalTo,
    this.monitoringReportMentalReferName,
    this.monitoringReportSocialTo,
    this.monitoringReportSocialReferName,
    this.completedReason,
    this.incompletedReason,
    this.incompletedReasonOther,
    this.mentalTreatmentResult,
    this.physicalTreatmentResult,
  });

  factory TreatmentEntity.fromJson(Map<String, dynamic> json) =>
      _$TreatmentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentEntityToJson(this);
}

@JsonSerializable()
class DrugUsageBeforeEntity {
  int? order;
  String? drug;
  String? drugApproach;
  int? gramPerDay;
  String? drugUnit;
  int? qtyAmountUsage;
  String? drugFrequencyUsage;
  bool? main;
  int? firstYearUsage;

  DrugUsageBeforeEntity({
    this.order,
    this.drug,
    this.drugApproach,
    this.gramPerDay,
    this.drugUnit,
    this.qtyAmountUsage,
    this.drugFrequencyUsage,
    this.main,
    this.firstYearUsage,
  });

  factory DrugUsageBeforeEntity.fromJson(Map<String, dynamic> json) =>
      _$DrugUsageBeforeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DrugUsageBeforeEntityToJson(this);
}

@JsonSerializable()
class TreatmentHistoryEntity {
  int? no;
  String? subDivisionName;
  int? times;
  String? lastestUsedDate;

  TreatmentHistoryEntity({
    this.no,
    this.subDivisionName,
    this.times,
    this.lastestUsedDate,
  });

  factory TreatmentHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$TreatmentHistoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentHistoryEntityToJson(this);
}

@JsonSerializable()
class PlanEntity {
  int? order;
  String? planType;
  String? endDate;
  String? other;
  String? subDistrict;
  String? subDivision;
  String? village;
  String? subMini;
  bool? changePlan;
  String? newPlanType;
  String? newTypeSub;
  List<PlanEvalResultEntity>? planEvalResults;

  PlanEntity({
    this.order,
    this.planType,
    this.endDate,
    this.other,
    this.subDistrict,
    this.subDivision,
    this.village,
    this.subMini,
    this.changePlan,
    this.newPlanType,
    this.newTypeSub,
    this.planEvalResults,
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
    this.order,
    this.evalDate,
    this.evalResult,
  });

  factory PlanEvalResultEntity.fromJson(Map<String, dynamic> json) =>
      _$PlanEvalResultEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlanEvalResultEntityToJson(this);
}

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
