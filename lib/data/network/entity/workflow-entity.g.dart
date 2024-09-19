// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteringEntity _$RegisteringEntityFromJson(Map<String, dynamic> json) =>
    RegisteringEntity(
      patientId: (json['patientId'] as num?)?.toInt(),
      nationalId: json['nationalId'] as String?,
      name: json['name'] as String?,
      middleName: json['middleName'] as String?,
      surname: json['surname'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      nationalityId: (json['nationalityId'] as num?)?.toInt(),
      religionId: (json['religionId'] as num?)?.toInt(),
      phoneNo: json['phoneNo'] as String?,
      hometownProvinceId: (json['hometownProvinceId'] as num?)?.toInt(),
      registeredHouseNo: json['registeredHouseNo'] as String?,
      registeredHouseMoo: json['registeredHouseMoo'] as String?,
      registeredVillageId: (json['registeredVillageId'] as num?)?.toInt(),
      registeredHouseRoad: json['registeredHouseRoad'] as String?,
      registeredProvinceId: (json['registeredProvinceId'] as num?)?.toInt(),
      registeredDistrictId: (json['registeredDistrictId'] as num?)?.toInt(),
      registeredSubDistrictId:
          (json['registeredSubDistrictId'] as num?)?.toInt(),
      registeredPostalCode: json['registeredPostalCode'] as String?,
      currentAddrAsRegistered: json['currentAddrAsRegistered'] as bool?,
      mapLocation: json['mapLocation'] as String?,
      currentHouseNo: json['currentHouseNo'] as String?,
      currentHouseMoo: json['currentHouseMoo'] as String?,
      currentVillageId: (json['currentVillageId'] as num?)?.toInt(),
      currentHouseRoad: json['currentHouseRoad'] as String?,
      currentProvinceId: (json['currentProvinceId'] as num?)?.toInt(),
      currentDistrictId: (json['currentDistrictId'] as num?)?.toInt(),
      currentSubDistrictId: (json['currentSubDistrictId'] as num?)?.toInt(),
      currentPostalCode: json['currentPostalCode'] as String?,
      haveGuardian: json['haveGuardian'] as bool?,
      guardianName: json['guardianName'] as String?,
      guardianSurname: json['guardianSurname'] as String?,
      relationShipId: (json['relationShipId'] as num?)?.toInt(),
      guardianPhoneNo: json['guardianPhoneNo'] as String?,
      joinTreatmentBy: json['joinTreatmentBy'] as String?,
      joinSentByCourt: json['joinSentByCourt'] as String?,
    );

Map<String, dynamic> _$RegisteringEntityToJson(RegisteringEntity instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'nationalId': instance.nationalId,
      'name': instance.name,
      'middleName': instance.middleName,
      'surname': instance.surname,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'nationalityId': instance.nationalityId,
      'religionId': instance.religionId,
      'phoneNo': instance.phoneNo,
      'hometownProvinceId': instance.hometownProvinceId,
      'registeredHouseNo': instance.registeredHouseNo,
      'registeredHouseMoo': instance.registeredHouseMoo,
      'registeredVillageId': instance.registeredVillageId,
      'registeredHouseRoad': instance.registeredHouseRoad,
      'registeredProvinceId': instance.registeredProvinceId,
      'registeredDistrictId': instance.registeredDistrictId,
      'registeredSubDistrictId': instance.registeredSubDistrictId,
      'registeredPostalCode': instance.registeredPostalCode,
      'currentAddrAsRegistered': instance.currentAddrAsRegistered,
      'mapLocation': instance.mapLocation,
      'currentHouseNo': instance.currentHouseNo,
      'currentHouseMoo': instance.currentHouseMoo,
      'currentVillageId': instance.currentVillageId,
      'currentHouseRoad': instance.currentHouseRoad,
      'currentProvinceId': instance.currentProvinceId,
      'currentDistrictId': instance.currentDistrictId,
      'currentSubDistrictId': instance.currentSubDistrictId,
      'currentPostalCode': instance.currentPostalCode,
      'haveGuardian': instance.haveGuardian,
      'guardianName': instance.guardianName,
      'guardianSurname': instance.guardianSurname,
      'relationShipId': instance.relationShipId,
      'guardianPhoneNo': instance.guardianPhoneNo,
      'joinTreatmentBy': instance.joinTreatmentBy,
      'joinSentByCourt': instance.joinSentByCourt,
    };

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      name: json['name'] as String?,
      middleName: json['middleName'] as String?,
      surname: json['surname'] as String?,
      patientStatus: json['patientStatus'] as String?,
      level: json['level'] as String?,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'middleName': instance.middleName,
      'surname': instance.surname,
      'patientStatus': instance.patientStatus,
      'level': instance.level,
    };

ScreeningEntity _$ScreeningEntityFromJson(Map<String, dynamic> json) =>
    ScreeningEntity(
      patientId: (json['patientId'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      screeningDate: json['screeningDate'] == null
          ? null
          : DateTime.parse(json['screeningDate'] as String),
      refFilePath: json['refFilePath'] as String?,
      refFileName: json['refFileName'] as String?,
      maritalStatusId: (json['maritalStatusId'] as num?)?.toInt(),
      educationId: (json['educationId'] as num?)?.toInt(),
      occupationId: (json['occupationId'] as num?)?.toInt(),
      occupationOther: json['occupationOther'] as String?,
      incomeId: (json['incomeId'] as num?)?.toInt(),
      parentRelationshipId: (json['parentRelationshipId'] as num?)?.toInt(),
      livingWithLast30days: (json['livingWithLast30days'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainDrugs: (json['mainDrugs'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondaryDrugs: (json['secondaryDrugs'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isToBeNumberOneMember: json['isToBeNumberOneMember'] as String?,
      drugUsageApproach: json['drugUsageApproach'] as String?,
      frequencyOfUse: json['frequencyOfUse'] as String?,
      feelingAddicted: json['feelingAddicted'] as String?,
      frequencyOfProblem: json['frequencyOfProblem'] as String?,
      irresponsible: json['irresponsible'] as String?,
      beNoticed: json['beNoticed'] as String?,
      stopUsingButNotSuccess: json['stopUsingButNotSuccess'] as String?,
      drugEvalScore: (json['drugEvalScore'] as num?)?.toInt(),
      levelOfAddicted: json['levelOfAddicted'] as String?,
      screeningResult: json['screeningResult'] as String?,
      injectableDrug: json['injectableDrug'] as String?,
      last3MonthUsage: json['last3MonthUsage'] as String?,
      mentalIssueIds: (json['mentalIssueIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      mentalEvalScore: (json['mentalEvalScore'] as num?)?.toInt(),
      mentalEvalLevel: json['mentalEvalLevel'] as String?,
      hadMentalTreatment: json['hadMentalTreatment'] as String?,
      mentalTreatmentId: (json['mentalTreatmentId'] as num?)?.toInt(),
      hadChronicContagious: json['hadChronicContagious'] as String?,
      chronicContagiousId: (json['chronicContagiousId'] as num?)?.toInt(),
      hadCriminalCase: json['hadCriminalCase'] as String?,
      criminalCaseId: (json['criminalCaseId'] as num?)?.toInt(),
      homeless: json['homeless'] as String?,
      disabledPerson: json['disabledPerson'] as String?,
      disabledCertificateNo: json['disabledCertificateNo'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) =>
              FileElementdataEntityEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      newFiles: (json['newFiles'] as List<dynamic>?)
          ?.map((e) => NewFileEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      removeDocIds: (json['removeDocIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ScreeningEntityToJson(ScreeningEntity instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'startDate': instance.startDate?.toIso8601String(),
      'screeningDate': instance.screeningDate?.toIso8601String(),
      'refFilePath': instance.refFilePath,
      'refFileName': instance.refFileName,
      'maritalStatusId': instance.maritalStatusId,
      'educationId': instance.educationId,
      'occupationId': instance.occupationId,
      'occupationOther': instance.occupationOther,
      'incomeId': instance.incomeId,
      'parentRelationshipId': instance.parentRelationshipId,
      'livingWithLast30days': instance.livingWithLast30days,
      'mainDrugs': instance.mainDrugs,
      'secondaryDrugs': instance.secondaryDrugs,
      'isToBeNumberOneMember': instance.isToBeNumberOneMember,
      'drugUsageApproach': instance.drugUsageApproach,
      'frequencyOfUse': instance.frequencyOfUse,
      'feelingAddicted': instance.feelingAddicted,
      'frequencyOfProblem': instance.frequencyOfProblem,
      'irresponsible': instance.irresponsible,
      'beNoticed': instance.beNoticed,
      'stopUsingButNotSuccess': instance.stopUsingButNotSuccess,
      'drugEvalScore': instance.drugEvalScore,
      'levelOfAddicted': instance.levelOfAddicted,
      'screeningResult': instance.screeningResult,
      'injectableDrug': instance.injectableDrug,
      'last3MonthUsage': instance.last3MonthUsage,
      'mentalIssueIds': instance.mentalIssueIds,
      'mentalEvalScore': instance.mentalEvalScore,
      'mentalEvalLevel': instance.mentalEvalLevel,
      'hadMentalTreatment': instance.hadMentalTreatment,
      'mentalTreatmentId': instance.mentalTreatmentId,
      'hadChronicContagious': instance.hadChronicContagious,
      'chronicContagiousId': instance.chronicContagiousId,
      'hadCriminalCase': instance.hadCriminalCase,
      'criminalCaseId': instance.criminalCaseId,
      'homeless': instance.homeless,
      'disabledPerson': instance.disabledPerson,
      'disabledCertificateNo': instance.disabledCertificateNo,
      'files': instance.files,
      'newFiles': instance.newFiles,
      'removeDocIds': instance.removeDocIds,
    };

TreatmentEntity _$TreatmentEntityFromJson(Map<String, dynamic> json) =>
    TreatmentEntity(
      patientId: (json['patientId'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      refFilePath: json['refFilePath'] as String?,
      refFileName: json['refFileName'] as String?,
      firstAgeUsage: (json['firstAgeUsage'] as num?)?.toInt(),
      firstDrugUsageId: (json['firstDrugUsageId'] as num?)?.toInt(),
      yearOfUsage: (json['yearOfUsage'] as num?)?.toInt(),
      monthOfUsage: (json['monthOfUsage'] as num?)?.toInt(),
      dayOfUsage: (json['dayOfUsage'] as num?)?.toInt(),
      totalUsage: (json['totalUsage'] as num?)?.toDouble(),
      hadTreatment: json['hadTreatment'] as String?,
      histories: (json['histories'] as List<dynamic>?)
          ?.map((e) => HistoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageReasons: (json['usageReasons'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentDrugUsages: (json['currentDrugUsages'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
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
      dosings:
          (json['dosings'] as List<dynamic>?)?.map((e) => e as String).toList(),
      techniques: (json['techniques'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      programmes: (json['programmes'] as List<dynamic>?)
          ?.map((e) => AnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      plans: (json['plans'] as List<dynamic>?)
          ?.map((e) => PlanEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      frequencyOfUse: json['frequencyOfUse'] as String?,
      feelingAddicted: json['feelingAddicted'] as String?,
      frequencyOfProblem: json['frequencyOfProblem'] as String?,
      irresponsible: json['irresponsible'] as String?,
      beNoticed: json['beNoticed'] as String?,
      stopUsingButNotSuccess: json['stopUsingButNotSuccess'] as String?,
      drugEvalScore: (json['drugEvalScore'] as num?)?.toInt(),
      levelOfAddicted: json['levelOfAddicted'] as String?,
      treatmentResult: json['treatmentResult'] as String?,
      mentalIssueIds: (json['mentalIssueIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      mentalScore: (json['mentalScore'] as num?)?.toInt(),
      mentalEvalLevel: json['mentalEvalLevel'] as String?,
      latestTreatmentEvalDate: json['latestTreatmentEvalDate'] == null
          ? null
          : DateTime.parse(json['latestTreatmentEvalDate'] as String),
      evaluationDate: json['evaluationDate'] == null
          ? null
          : DateTime.parse(json['evaluationDate'] as String),
      evaluationResult: json['evaluationResult'] as String?,
      monitoringReportMentalTo: json['monitoringReportMentalTo'] as String?,
      monitoringReportMentalReferId:
          (json['monitoringReportMentalReferId'] as num?)?.toInt(),
      monitoringReportSocialTo: json['monitoringReportSocialTo'] as String?,
      monitoringReportSocialReferId:
          (json['monitoringReportSocialReferId'] as num?)?.toInt(),
      incompletedReason: json['incompletedReason'] as String?,
      mentalTreatmentResult: json['mentalTreatmentResult'] as String?,
      physicalTreatmentResult: json['physicalTreatmentResult'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map(
              (e) => FileElementdataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      newFiles: (json['newFiles'] as List<dynamic>?)
          ?.map((e) => NewFileEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      removeFiles: (json['removeFiles'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    )..treatmentDate = json['treatmentDate'] == null
        ? null
        : DateTime.parse(json['treatmentDate'] as String);

Map<String, dynamic> _$TreatmentEntityToJson(TreatmentEntity instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'startDate': instance.startDate?.toIso8601String(),
      'treatmentDate': instance.treatmentDate?.toIso8601String(),
      'refFilePath': instance.refFilePath,
      'refFileName': instance.refFileName,
      'firstAgeUsage': instance.firstAgeUsage,
      'firstDrugUsageId': instance.firstDrugUsageId,
      'yearOfUsage': instance.yearOfUsage,
      'monthOfUsage': instance.monthOfUsage,
      'dayOfUsage': instance.dayOfUsage,
      'totalUsage': instance.totalUsage,
      'hadTreatment': instance.hadTreatment,
      'histories': instance.histories,
      'usageReasons': instance.usageReasons,
      'currentDrugUsages': instance.currentDrugUsages,
      'joinReasons': instance.joinReasons,
      'drugUsageBefores': instance.drugUsageBefores,
      'hadDosing': instance.hadDosing,
      'otherDosing': instance.otherDosing,
      'dosings': instance.dosings,
      'techniques': instance.techniques,
      'programmes': instance.programmes,
      'plans': instance.plans,
      'frequencyOfUse': instance.frequencyOfUse,
      'feelingAddicted': instance.feelingAddicted,
      'frequencyOfProblem': instance.frequencyOfProblem,
      'irresponsible': instance.irresponsible,
      'beNoticed': instance.beNoticed,
      'stopUsingButNotSuccess': instance.stopUsingButNotSuccess,
      'drugEvalScore': instance.drugEvalScore,
      'levelOfAddicted': instance.levelOfAddicted,
      'treatmentResult': instance.treatmentResult,
      'mentalIssueIds': instance.mentalIssueIds,
      'mentalScore': instance.mentalScore,
      'mentalEvalLevel': instance.mentalEvalLevel,
      'latestTreatmentEvalDate':
          instance.latestTreatmentEvalDate?.toIso8601String(),
      'evaluationDate': instance.evaluationDate?.toIso8601String(),
      'evaluationResult': instance.evaluationResult,
      'monitoringReportMentalTo': instance.monitoringReportMentalTo,
      'monitoringReportMentalReferId': instance.monitoringReportMentalReferId,
      'monitoringReportSocialTo': instance.monitoringReportSocialTo,
      'monitoringReportSocialReferId': instance.monitoringReportSocialReferId,
      'incompletedReason': instance.incompletedReason,
      'mentalTreatmentResult': instance.mentalTreatmentResult,
      'physicalTreatmentResult': instance.physicalTreatmentResult,
      'files': instance.files,
      'newFiles': instance.newFiles,
      'removeFiles': instance.removeFiles,
    };

DrugUsageBeforeEntity _$DrugUsageBeforeEntityFromJson(
        Map<String, dynamic> json) =>
    DrugUsageBeforeEntity(
      order: (json['order'] as num?)?.toInt(),
      drugId: (json['drugId'] as num?)?.toInt(),
      drugApproachId: (json['drugApproachId'] as num?)?.toInt(),
      gramPerDay: (json['gramPerDay'] as num?)?.toInt(),
      drugUnitId: (json['drugUnitId'] as num?)?.toInt(),
      qtyAmountUsage: (json['qtyAmountUsage'] as num?)?.toInt(),
      drugFrequencyUsageId: (json['drugFrequencyUsageId'] as num?)?.toInt(),
      main: json['main'] as bool?,
      firstYearUsage: (json['firstYearUsage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DrugUsageBeforeEntityToJson(
        DrugUsageBeforeEntity instance) =>
    <String, dynamic>{
      'order': instance.order,
      'drugId': instance.drugId,
      'drugApproachId': instance.drugApproachId,
      'gramPerDay': instance.gramPerDay,
      'drugUnitId': instance.drugUnitId,
      'qtyAmountUsage': instance.qtyAmountUsage,
      'drugFrequencyUsageId': instance.drugFrequencyUsageId,
      'main': instance.main,
      'firstYearUsage': instance.firstYearUsage,
    };

FileElementdataEntity _$FileElementdataEntityFromJson(
        Map<String, dynamic> json) =>
    FileElementdataEntity(
      documentId: (json['documentId'] as num?)?.toInt(),
      fileNameOrg: json['fileNameOrg'] as String?,
    );

Map<String, dynamic> _$FileElementdataEntityToJson(
        FileElementdataEntity instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'fileNameOrg': instance.fileNameOrg,
    };

PlanEntity _$PlanEntityFromJson(Map<String, dynamic> json) => PlanEntity(
      order: (json['order'] as num?)?.toInt(),
      planType: json['planType'] as String?,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      other: json['other'] as String?,
      subDistrictId: (json['subDistrictId'] as num?)?.toInt(),
      villageId: (json['villageId'] as num?)?.toInt(),
      planEvalResults: (json['planEvalResults'] as List<dynamic>?)
          ?.map((e) => PlanEvalResultEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanEntityToJson(PlanEntity instance) =>
    <String, dynamic>{
      'order': instance.order,
      'planType': instance.planType,
      'endDate': instance.endDate?.toIso8601String(),
      'other': instance.other,
      'subDistrictId': instance.subDistrictId,
      'villageId': instance.villageId,
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

HistoryEntity _$HistoryEntityFromJson(Map<String, dynamic> json) =>
    HistoryEntity(
      subDivisionId: (json['subDivisionId'] as num?)?.toInt(),
      times: (json['times'] as num?)?.toInt(),
      lastestUsedDate: json['lastestUsedDate'] == null
          ? null
          : DateTime.parse(json['lastestUsedDate'] as String),
    );

Map<String, dynamic> _$HistoryEntityToJson(HistoryEntity instance) =>
    <String, dynamic>{
      'subDivisionId': instance.subDivisionId,
      'times': instance.times,
      'lastestUsedDate': instance.lastestUsedDate?.toIso8601String(),
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

FileElementdataEntityEntity _$FileElementdataEntityEntityFromJson(
        Map<String, dynamic> json) =>
    FileElementdataEntityEntity(
      documentId: (json['documentId'] as num?)?.toInt(),
      fileNameOrg: json['fileNameOrg'] as String?,
    );

Map<String, dynamic> _$FileElementdataEntityEntityToJson(
        FileElementdataEntityEntity instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'fileNameOrg': instance.fileNameOrg,
    };

NewFileEntity _$NewFileEntityFromJson(Map<String, dynamic> json) =>
    NewFileEntity(
      fileNameOrg: json['fileNameOrg'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$NewFileEntityToJson(NewFileEntity instance) =>
    <String, dynamic>{
      'fileNameOrg': instance.fileNameOrg,
      'content': instance.content,
    };
