import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';

@freezed
class WorkFlowCount with _$WorkFlowCount {
  const factory WorkFlowCount({
    required int countRegistering,
    required int countScreening,
    required int countTreatment,
    required int countMonitoring,
    required int countAssistance,
    required int countDischarged,
  }) = _WorkFlowCount;
}

@freezed
class ReferCount with _$ReferCount {
  const factory ReferCount({
    required int sender,
    required int receiver,
  }) = _ReferCount;
}

// @freezed
// class StatYear with _$StatYear {
//   const factory StatYear({
//     required int year,
//     required int total,
//     required double register,
//     required double screening,
//     required double treatment,
//     required double monitoring,
//     required double discharged,
//   }) = _StatYear;
// }

// @freezed
// class StatPatientWeek with _$StatPatientWeek {
//   const factory StatPatientWeek({
//     required int newPatientWeek,
//     required List<double> dataWeek,
//   }) = _StatPatientWeek;
// }

// @freezed
// class StatPatientMonth with _$StatPatientMonth {
//   const factory StatPatientMonth({
//     required int newPatientMonth,
//     required List<double> dataMonth,
//   }) = _StatPatientMonth;
// }

// @freezed
// class Level with _$Level {
//   const factory Level({
//     required int year,
//     required int screeningTotal,
//     required int screeningUrgencyCount,
//     required double screeningUrgencyPercent,
//     required int screeningEmergencyCount,
//     required double screeningEmergencyPercent,
//     required int screeningSemiUrgencyCount,
//     required double screeningSemiUrgencyPercent,
//     required int screeningNormalCount,
//     required double screeningNormalPercent,
//     required int treatmentTotal,
//     required int treatmentUrgencyCount,
//     required double treatmentUrgencyPercent,
//     required int treatmentEmergencyCount,
//     required double treatmentEmergencyPercent,
//     required int treatmentSemiUrgencyCount,
//     required double treatmentSemiUrgencyPercent,
//     required int treatmentNormalCount,
//     required double treatmentNormalPercent,
//   }) = _Level;
// }

// @freezed
// class ReportData with _$ReportData {
//   const factory ReportData({
//     required String name,
//     required String register,
//     required String screening,
//     required String treatment,
//     required String monitoring,
//     required String retentionRate,
//     required int districtId,
//     required int healthServiceId,
//   }) = _ReportData;
// }
