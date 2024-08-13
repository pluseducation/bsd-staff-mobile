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
      registeredVillageId: (json['registeredVillageId'] as num).toInt(),
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
      refFilePath: json['refFilePath'] as String?,
      refFileName: json['refFileName'] as String?,
      maritalStatusId: (json['maritalStatusId'] as num?)?.toInt(),
      educationId: (json['educationId'] as num?)?.toInt(),
      occupationId: (json['occupationId'] as num?)?.toInt(),
      occupationOther: json['occupationOther'] as String?,
      incomeId: (json['incomeId'] as num?)?.toInt(),
      parentRelationshipId: (json['parentRelationshipId'] as num?)?.toInt(),
      livingWithLast30Days: (json['livingWithLast30Days'] as List<dynamic>?)
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
          ?.map((e) => FileElementEntity.fromJson(e as Map<String, dynamic>))
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
      'refFilePath': instance.refFilePath,
      'refFileName': instance.refFileName,
      'maritalStatusId': instance.maritalStatusId,
      'educationId': instance.educationId,
      'occupationId': instance.occupationId,
      'occupationOther': instance.occupationOther,
      'incomeId': instance.incomeId,
      'parentRelationshipId': instance.parentRelationshipId,
      'livingWithLast30Days': instance.livingWithLast30Days,
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

AnswerEntity _$AnswerEntityFromJson(Map<String, dynamic> json) => AnswerEntity(
      answer: json['answer'] as String?,
      other: json['other'] as String?,
    );

Map<String, dynamic> _$AnswerEntityToJson(AnswerEntity instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'other': instance.other,
    };

FileElementEntity _$FileElementEntityFromJson(Map<String, dynamic> json) =>
    FileElementEntity(
      documentId: (json['documentId'] as num?)?.toInt(),
      fileNameOrg: json['fileNameOrg'] as String?,
    );

Map<String, dynamic> _$FileElementEntityToJson(FileElementEntity instance) =>
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
