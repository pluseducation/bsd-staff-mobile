import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow.freezed.dart';

@freezed
class Workflow with _$Workflow {
  const factory Workflow({
    required String fullname, //** find on profile name + surname */
    required String patientStatus, //** find on profile */
    required String level, //** find on profile */
    required String nationalId, //** find on patient */
    required String dateOfBirthText, //** find on patient */
    required String gender, //* find on question REGISTERING */
    required String nationalityText, //** find on master nationalityId */
    required int religionId,
    required String phoneNo,
    required int hometownProvinceId,
    required String registeredHouseNo,
    required String registeredHouseMoo,
    required int registeredVillageId,
    required String registeredHouseRoad,
    required int registeredProvinceId,
    required int registeredDistrictId,
    required int registeredSubDistrictId,
    required String registeredPostalCode,
    required bool currentAddrAsRegistered,
    required String mapLocation,
    required String currentHouseNo,
    required String currentHouseMoo,
    required int currentVillageId,
    required String currentHouseRoad,
    required int currentProvinceId,
    required int currentDistrictId,
    required int currentSubDistrictId,
    required String currentPostalCode,
    required bool haveGuardian,
    required String guardianName,
    required String guardianSurname,
    required int relationShipId,
    required String guardianPhoneNo,
    required String joinTreatmentBy,
    required String joinSentByCourt,
  }) = _Workflow;
}
