// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteringEntity _$RegisteringEntityFromJson(Map<String, dynamic> json) =>
    RegisteringEntity(
      patientId: (json['patientId'] as num?)?.toInt(),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      nationalId: json['nationalId'] as String?,
      phoneNo: json['phoneNo'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      nationality: json['nationality'] as String?,
      religion: json['religion'] as String?,
      hometownProvince: json['hometownProvince'] as String?,
      registeredHouseNo: json['registeredHouseNo'] as String?,
      registeredHouseMoo: json['registeredHouseMoo'] as String?,
      registeredVillage: json['registeredVillage'] as String?,
      registeredHouseRoad: json['registeredHouseRoad'] as String?,
      registeredProvince: json['registeredProvince'] as String?,
      registeredDistrict: json['registeredDistrict'] as String?,
      registeredSubDistrict: json['registeredSubDistrict'] as String?,
      registeredPostalCode: json['registeredPostalCode'] as String?,
      currentHouseNo: json['currentHouseNo'] as String?,
      currentHouseMoo: json['currentHouseMoo'] as String?,
      currentVillage: json['currentVillage'] as String?,
      currentHouseRoad: json['currentHouseRoad'] as String?,
      currentProvince: json['currentProvince'] as String?,
      currentDistrict: json['currentDistrict'] as String?,
      currentSubDistrict: json['currentSubDistrict'] as String?,
      currentPostalCode: json['currentPostalCode'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      education: json['education'] as String?,
      occupation: json['occupation'] as String?,
      income: json['income'] as String?,
      guardianName: json['guardianName'] as String?,
      guardianSurname: json['guardianSurname'] as String?,
      guardianRelationship: json['guardianRelationship'] as String?,
      guardianPhoneNo: json['guardianPhoneNo'] as String?,
      livingWith: json['livingWith'] as String?,
      joinTreatmentBy: json['joinTreatmentBy'] as String?,
      joinSentByCourt: json['joinSentByCourt'] as String?,
    );

Map<String, dynamic> _$RegisteringEntityToJson(RegisteringEntity instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'name': instance.name,
      'surname': instance.surname,
      'nationalId': instance.nationalId,
      'phoneNo': instance.phoneNo,
      'dateOfBirth': instance.dateOfBirth,
      'age': instance.age,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'religion': instance.religion,
      'hometownProvince': instance.hometownProvince,
      'registeredHouseNo': instance.registeredHouseNo,
      'registeredHouseMoo': instance.registeredHouseMoo,
      'registeredVillage': instance.registeredVillage,
      'registeredHouseRoad': instance.registeredHouseRoad,
      'registeredProvince': instance.registeredProvince,
      'registeredDistrict': instance.registeredDistrict,
      'registeredSubDistrict': instance.registeredSubDistrict,
      'registeredPostalCode': instance.registeredPostalCode,
      'currentHouseNo': instance.currentHouseNo,
      'currentHouseMoo': instance.currentHouseMoo,
      'currentVillage': instance.currentVillage,
      'currentHouseRoad': instance.currentHouseRoad,
      'currentProvince': instance.currentProvince,
      'currentDistrict': instance.currentDistrict,
      'currentSubDistrict': instance.currentSubDistrict,
      'currentPostalCode': instance.currentPostalCode,
      'maritalStatus': instance.maritalStatus,
      'education': instance.education,
      'occupation': instance.occupation,
      'income': instance.income,
      'guardianName': instance.guardianName,
      'guardianSurname': instance.guardianSurname,
      'guardianRelationship': instance.guardianRelationship,
      'guardianPhoneNo': instance.guardianPhoneNo,
      'livingWith': instance.livingWith,
      'joinTreatmentBy': instance.joinTreatmentBy,
      'joinSentByCourt': instance.joinSentByCourt,
    };

ScreeningEntity _$ScreeningEntityFromJson(Map<String, dynamic> json) =>
    ScreeningEntity(
      screeningDate: json['screeningDate'] as String?,
      level: json['level'] as String?,
      drugEvalResult: json['drugEvalResult'] as String?,
      isToBeNumberOneMember: json['isToBeNumberOneMember'] as String?,
      toBeNumberOneDate: json['toBeNumberOneDate'] as String?,
      drugUsageApproach: json['drugUsageApproach'] as String?,
      injectableDrug: json['injectableDrug'] as String?,
      mainDrug: json['mainDrug'] as String?,
      secondaryDrug: json['secondaryDrug'] as String?,
      hadMentalTreatment: json['hadMentalTreatment'] as String?,
      mentalTreatment: json['mentalTreatment'] as String?,
      mentalTreatmentOther: json['mentalTreatmentOther'] as String?,
      hadChronicContagious: json['hadChronicContagious'] as String?,
      chronicContagious: json['chronicContagious'] as String?,
      chronicContagiousOther: json['chronicContagiousOther'] as String?,
      hadCriminalCase: json['hadCriminalCase'] as String?,
      criminalCase: json['criminalCase'] as String?,
      criminalCaseOther: json['criminalCaseOther'] as String?,
      homeless: json['homeless'] as String?,
      disabledPerson: json['disabledPerson'] as String?,
      disabledCertificateNo: json['disabledCertificateNo'] as String?,
    );

Map<String, dynamic> _$ScreeningEntityToJson(ScreeningEntity instance) =>
    <String, dynamic>{
      'screeningDate': instance.screeningDate,
      'level': instance.level,
      'drugEvalResult': instance.drugEvalResult,
      'isToBeNumberOneMember': instance.isToBeNumberOneMember,
      'toBeNumberOneDate': instance.toBeNumberOneDate,
      'drugUsageApproach': instance.drugUsageApproach,
      'injectableDrug': instance.injectableDrug,
      'mainDrug': instance.mainDrug,
      'secondaryDrug': instance.secondaryDrug,
      'hadMentalTreatment': instance.hadMentalTreatment,
      'mentalTreatment': instance.mentalTreatment,
      'mentalTreatmentOther': instance.mentalTreatmentOther,
      'hadChronicContagious': instance.hadChronicContagious,
      'chronicContagious': instance.chronicContagious,
      'chronicContagiousOther': instance.chronicContagiousOther,
      'hadCriminalCase': instance.hadCriminalCase,
      'criminalCase': instance.criminalCase,
      'criminalCaseOther': instance.criminalCaseOther,
      'homeless': instance.homeless,
      'disabledPerson': instance.disabledPerson,
      'disabledCertificateNo': instance.disabledCertificateNo,
    };

MonitoringEntity _$MonitoringEntityFromJson(Map<String, dynamic> json) =>
    MonitoringEntity(
      status: json['status'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      round: (json['round'] as num?)?.toInt(),
      roundType: json['roundType'] as String?,
      roundId: (json['roundId'] as num?)?.toInt(),
      subdivision: json['subdivision'] as String?,
      subdivisionId: (json['subdivisionId'] as num?)?.toInt(),
      latestResult: json['latestResult'] as String?,
      finalRound: (json['finalRound'] as num?)?.toInt(),
      treatmentType: json['treatmentType'] as String?,
    );

Map<String, dynamic> _$MonitoringEntityToJson(MonitoringEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'round': instance.round,
      'roundType': instance.roundType,
      'roundId': instance.roundId,
      'subdivision': instance.subdivision,
      'subdivisionId': instance.subdivisionId,
      'latestResult': instance.latestResult,
      'finalRound': instance.finalRound,
      'treatmentType': instance.treatmentType,
    };

TreatmentEntity _$TreatmentEntityFromJson(Map<String, dynamic> json) =>
    TreatmentEntity(
      treatmentDate: json['treatmentDate'] as String?,
      firstAgeUsage: (json['firstAgeUsage'] as num?)?.toInt(),
      firstDrugUsage: json['firstDrugUsage'] as String?,
      yearOfUsage: (json['yearOfUsage'] as num?)?.toInt(),
      monthOfUsage: (json['monthOfUsage'] as num?)?.toInt(),
      dayOfUsage: (json['dayOfUsage'] as num?)?.toInt(),
      totalUsage: (json['totalUsage'] as num?)?.toInt(),
      hadTreatment: json['hadTreatment'] as String?,
      hadTreatmentQty: (json['hadTreatmentQty'] as num?)?.toInt(),
      inHistories: (json['inHistories'] as List<dynamic>?)
          ?.map(
              (e) => TreatmentHistoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      outHistories: (json['outHistories'] as List<dynamic>?)
          ?.map(
              (e) => TreatmentHistoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageReasons: (json['usageReasons'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentDrugUsages: (json['currentDrugUsages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      joinReasons: (json['joinReasons'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      drugUsageBefores: (json['drugUsageBefores'] as List<dynamic>?)
          ?.map(
              (e) => DrugUsageBeforeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      hadDosing: json['hadDosing'] as String?,
      otherDosing: json['otherDosing'] as String?,
      otherPhysical: json['otherPhysical'] as String?,
      otherMental: json['otherMental'] as String?,
      dosings: (json['dosings'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      harmReduction: json['harmReduction'] as bool?,
      harmItems: (json['harmItems'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      techniques: (json['techniques'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      programmes: (json['programmes'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      plans: (json['plans'] as List<dynamic>?)
          ?.map((e) => PlanEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      treatmentResult: json['treatmentResult'] as String?,
      mentalIssueIds: (json['mentalIssueIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      mentalEvalLevel: json['mentalEvalLevel'] as String?,
      latestTreatmentEvalDate: json['latestTreatmentEvalDate'] as String?,
      evaluationDate: json['evaluationDate'] as String?,
      evaluationResult: json['evaluationResult'] as String?,
      monitoringReportMentalTo: json['monitoringReportMentalTo'] as String?,
      monitoringReportMentalReferName:
          json['monitoringReportMentalReferName'] as String?,
      monitoringReportSocialTo: json['monitoringReportSocialTo'] as String?,
      monitoringReportSocialReferName:
          json['monitoringReportSocialReferName'] as String?,
      completedReason: json['completedReason'] as String?,
      incompletedReason: json['incompletedReason'] as String?,
      incompletedReasonOther: json['incompletedReasonOther'] as String?,
      mentalTreatmentResult: json['mentalTreatmentResult'] as String?,
      physicalTreatmentResult: json['physicalTreatmentResult'] as String?,
    );

Map<String, dynamic> _$TreatmentEntityToJson(TreatmentEntity instance) =>
    <String, dynamic>{
      'treatmentDate': instance.treatmentDate,
      'firstAgeUsage': instance.firstAgeUsage,
      'firstDrugUsage': instance.firstDrugUsage,
      'yearOfUsage': instance.yearOfUsage,
      'monthOfUsage': instance.monthOfUsage,
      'dayOfUsage': instance.dayOfUsage,
      'totalUsage': instance.totalUsage,
      'hadTreatment': instance.hadTreatment,
      'hadTreatmentQty': instance.hadTreatmentQty,
      'inHistories': instance.inHistories,
      'outHistories': instance.outHistories,
      'usageReasons': instance.usageReasons,
      'currentDrugUsages': instance.currentDrugUsages,
      'joinReasons': instance.joinReasons,
      'drugUsageBefores': instance.drugUsageBefores,
      'hadDosing': instance.hadDosing,
      'otherDosing': instance.otherDosing,
      'otherPhysical': instance.otherPhysical,
      'otherMental': instance.otherMental,
      'dosings': instance.dosings,
      'harmReduction': instance.harmReduction,
      'harmItems': instance.harmItems,
      'techniques': instance.techniques,
      'programmes': instance.programmes,
      'plans': instance.plans,
      'treatmentResult': instance.treatmentResult,
      'mentalIssueIds': instance.mentalIssueIds,
      'mentalEvalLevel': instance.mentalEvalLevel,
      'latestTreatmentEvalDate': instance.latestTreatmentEvalDate,
      'evaluationDate': instance.evaluationDate,
      'evaluationResult': instance.evaluationResult,
      'monitoringReportMentalTo': instance.monitoringReportMentalTo,
      'monitoringReportMentalReferName':
          instance.monitoringReportMentalReferName,
      'monitoringReportSocialTo': instance.monitoringReportSocialTo,
      'monitoringReportSocialReferName':
          instance.monitoringReportSocialReferName,
      'completedReason': instance.completedReason,
      'incompletedReason': instance.incompletedReason,
      'incompletedReasonOther': instance.incompletedReasonOther,
      'mentalTreatmentResult': instance.mentalTreatmentResult,
      'physicalTreatmentResult': instance.physicalTreatmentResult,
    };

DrugUsageBeforeEntity _$DrugUsageBeforeEntityFromJson(
        Map<String, dynamic> json) =>
    DrugUsageBeforeEntity(
      order: (json['order'] as num?)?.toInt(),
      drug: json['drug'] as String?,
      drugApproach: json['drugApproach'] as String?,
      gramPerDay: (json['gramPerDay'] as num?)?.toInt(),
      drugUnit: json['drugUnit'] as String?,
      qtyAmountUsage: (json['qtyAmountUsage'] as num?)?.toInt(),
      drugFrequencyUsage: json['drugFrequencyUsage'] as String?,
      main: json['main'] as bool?,
      firstYearUsage: (json['firstYearUsage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DrugUsageBeforeEntityToJson(
        DrugUsageBeforeEntity instance) =>
    <String, dynamic>{
      'order': instance.order,
      'drug': instance.drug,
      'drugApproach': instance.drugApproach,
      'gramPerDay': instance.gramPerDay,
      'drugUnit': instance.drugUnit,
      'qtyAmountUsage': instance.qtyAmountUsage,
      'drugFrequencyUsage': instance.drugFrequencyUsage,
      'main': instance.main,
      'firstYearUsage': instance.firstYearUsage,
    };

TreatmentHistoryEntity _$TreatmentHistoryEntityFromJson(
        Map<String, dynamic> json) =>
    TreatmentHistoryEntity(
      no: (json['no'] as num?)?.toInt(),
      subDivisionName: json['subDivisionName'] as String?,
      times: (json['times'] as num?)?.toInt(),
      lastestUsedDate: json['lastestUsedDate'] as String?,
    );

Map<String, dynamic> _$TreatmentHistoryEntityToJson(
        TreatmentHistoryEntity instance) =>
    <String, dynamic>{
      'no': instance.no,
      'subDivisionName': instance.subDivisionName,
      'times': instance.times,
      'lastestUsedDate': instance.lastestUsedDate,
    };

PlanEntity _$PlanEntityFromJson(Map<String, dynamic> json) => PlanEntity(
      order: (json['order'] as num?)?.toInt(),
      planType: json['planType'] as String?,
      endDate: json['endDate'] as String?,
      other: json['other'] as String?,
      subDistrict: json['subDistrict'] as String?,
      subDivision: json['subDivision'] as String?,
      village: json['village'] as String?,
      subMini: json['subMini'] as String?,
      changePlan: json['changePlan'] as bool?,
      newPlanType: json['newPlanType'] as String?,
      newTypeSub: json['newTypeSub'] as String?,
      planEvalResults: (json['planEvalResults'] as List<dynamic>?)
          ?.map((e) => PlanEvalResultEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanEntityToJson(PlanEntity instance) =>
    <String, dynamic>{
      'order': instance.order,
      'planType': instance.planType,
      'endDate': instance.endDate,
      'other': instance.other,
      'subDistrict': instance.subDistrict,
      'subDivision': instance.subDivision,
      'village': instance.village,
      'subMini': instance.subMini,
      'changePlan': instance.changePlan,
      'newPlanType': instance.newPlanType,
      'newTypeSub': instance.newTypeSub,
      'planEvalResults': instance.planEvalResults,
    };

PlanEvalResultEntity _$PlanEvalResultEntityFromJson(
        Map<String, dynamic> json) =>
    PlanEvalResultEntity(
      order: (json['order'] as num?)?.toInt(),
      evalDate: json['evalDate'] == null
          ? null
          : DateTime.parse(json['evalDate'] as String),
      evalResult: (json['evalResult'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PlanEvalResultEntityToJson(
        PlanEvalResultEntity instance) =>
    <String, dynamic>{
      'order': instance.order,
      'evalDate': instance.evalDate?.toIso8601String(),
      'evalResult': instance.evalResult,
    };

AnswerEntity _$AnswerEntityFromJson(Map<String, dynamic> json) => AnswerEntity(
      answer: json['answer'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$AnswerEntityToJson(AnswerEntity instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'other': instance.other,
    };
