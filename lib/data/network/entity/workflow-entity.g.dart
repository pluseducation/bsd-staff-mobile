// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteringEntity _$RegisteringEntityFromJson(Map<String, dynamic> json) =>
    RegisteringEntity(
      patientId: json['patientId'] as int?,
      nationalId: json['nationalId'] as String?,
      name: json['name'] as String?,
      middleName: json['middleName'] as String?,
      surname: json['surname'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      nationalityId: json['nationalityId'] as int?,
      religionId: json['religionId'] as int?,
      phoneNo: json['phoneNo'] as String?,
      hometownProvinceId: json['hometownProvinceId'] as int?,
      registeredHouseNo: json['registeredHouseNo'] as String?,
      registeredHouseMoo: json['registeredHouseMoo'] as String?,
      registeredVillageId: json['registeredVillageId'] as int,
      registeredHouseRoad: json['registeredHouseRoad'] as String?,
      registeredProvinceId: json['registeredProvinceId'] as int?,
      registeredDistrictId: json['registeredDistrictId'] as int?,
      registeredSubDistrictId: json['registeredSubDistrictId'] as int?,
      registeredPostalCode: json['registeredPostalCode'] as String?,
      currentAddrAsRegistered: json['currentAddrAsRegistered'] as bool?,
      mapLocation: json['mapLocation'] as String?,
      currentHouseNo: json['currentHouseNo'] as String?,
      currentHouseMoo: json['currentHouseMoo'] as String?,
      currentVillageId: json['currentVillageId'] as int?,
      currentHouseRoad: json['currentHouseRoad'] as String?,
      currentProvinceId: json['currentProvinceId'] as int?,
      currentDistrictId: json['currentDistrictId'] as int?,
      currentSubDistrictId: json['currentSubDistrictId'] as int?,
      currentPostalCode: json['currentPostalCode'] as String?,
      haveGuardian: json['haveGuardian'] as bool?,
      guardianName: json['guardianName'] as String?,
      guardianSurname: json['guardianSurname'] as String?,
      relationShipId: json['relationShipId'] as int?,
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
