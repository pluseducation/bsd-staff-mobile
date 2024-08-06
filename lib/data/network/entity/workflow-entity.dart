import 'package:json_annotation/json_annotation.dart';

part 'workflow-entity.g.dart';

// WorkflowEntity

@JsonSerializable()
class WorkflowEntity {
  int? patientId;
  String? nationalId;
  String? name;
  String? middleName;
  String? surname;
  DateTime? dateOfBirth;
  String? gender;
  int? nationalityId;
  int? religionId;
  String? phoneNo;
  int? hometownProvinceId;
  String? registeredHouseNo;
  String? registeredHouseMoo;
  int registeredVillageId;
  String? registeredHouseRoad;
  int? registeredProvinceId;
  int? registeredDistrictId;
  int? registeredSubDistrictId;
  String? registeredPostalCode;
  bool? currentAddrAsRegistered;
  String? mapLocation;
  String? currentHouseNo;
  String? currentHouseMoo;
  int? currentVillageId;
  String? currentHouseRoad;
  int? currentProvinceId;
  int? currentDistrictId;
  int? currentSubDistrictId;
  String? currentPostalCode;
  bool? haveGuardian;
  String? guardianName;
  String? guardianSurname;
  int? relationShipId;
  String? guardianPhoneNo;
  String? joinTreatmentBy;
  String? joinSentByCourt;

  WorkflowEntity({
    required this.patientId,
    required this.nationalId,
    required this.name,
    required this.middleName,
    required this.surname,
    required this.dateOfBirth,
    required this.gender,
    required this.nationalityId,
    required this.religionId,
    required this.phoneNo,
    required this.hometownProvinceId,
    required this.registeredHouseNo,
    required this.registeredHouseMoo,
    required this.registeredVillageId,
    required this.registeredHouseRoad,
    required this.registeredProvinceId,
    required this.registeredDistrictId,
    required this.registeredSubDistrictId,
    required this.registeredPostalCode,
    required this.currentAddrAsRegistered,
    required this.mapLocation,
    required this.currentHouseNo,
    required this.currentHouseMoo,
    required this.currentVillageId,
    required this.currentHouseRoad,
    required this.currentProvinceId,
    required this.currentDistrictId,
    required this.currentSubDistrictId,
    required this.currentPostalCode,
    required this.haveGuardian,
    required this.guardianName,
    required this.guardianSurname,
    required this.relationShipId,
    required this.guardianPhoneNo,
    required this.joinTreatmentBy,
    required this.joinSentByCourt,
  });

  factory WorkflowEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkflowEntityFromJson(json);
  Map<String, dynamic> toJson() => _$WorkflowEntityToJson(this);
}
