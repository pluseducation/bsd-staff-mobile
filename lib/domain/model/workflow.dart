import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'workflow.freezed.dart';

@freezed
class Registering with _$Registering {
  const factory Registering({
    required String imagePath,
    required String fullname,
    required String nationalId,
    required String phoneNo,
    required String dateOfBirth,
    required String age,
    required String genderText,
    required String nationality,
    required String religion,
    required String registereAddress,
    required String currentAddress,
    required String maritalStatus,
    required String education,
    required String occupation,
    required String income,
    required String guardianfullName,
    required String guardianPhoneNo,
    required String livingWithText,
    required String joinTreatmentByText,
    required String joinSentByCourtText,
  }) = _Registering;
}

@freezed
class Screening with _$Screening {
  const factory Screening({
    required String? screeningDate,
    required LevelType? levelType,
    required DrugEvalResult? drugEvalResult,
    required String isToBeNumberOneMember,
    required String toBeNumberOneDate,
    required String drugUsageApproach,
    required String injectableDrug,
    required String mainDrug,
    required String secondaryDrug,
    required String hadMentalTreatment,
    required String mentalTreatment,
    required String hadChronicContagious,
    required String chronicContagious,
    required String hadCriminalCase,
    required String criminalCase,
    required String homeless,
    required String disabledPerson,
    required String disabledCertificateNo,
  }) = _Screening;
}

@freezed
class Treatment with _$Treatment {
  const factory Treatment({
    required String? treatmentDate,
    required LevelType? mentalEvalLevel,
    required DrugEvalResult? treatmentResult,
    required String usageReasons,
    required String firstAgeUsage,
    required String firstDrugUsage,
    required String currentDrugUsages,
    required String totalUsage,
    required String hadTreatmentText,
    required List<TreatmentHistory> inHistories,
    required List<TreatmentHistory> outHistoryies,
    required List<String> joinReasons,
    required List<DrugUsageBefore> drugUsageBefores,
    required List<Plan> plans,
    required List<String> dosings,
    required List<String> techniques,
    required List<String> programmes,
    required bool harmReduction,
    required List<String> harmItems,
    required String evaluationDate,
    required TreatmentStatus? evaluationResult,
    required String completedReasonText,
    required String mentalTreatmentResultText,
    required String physicalTreatmentResultText,
    required String incompletedReasonText,
  }) = _Treatment;
}

@freezed
class TreatmentHistory with _$TreatmentHistory {
  const factory TreatmentHistory({
    required String subDivisionName,
    required int times,
    required String lastestUsedDate,
  }) = _TreatmentHistory;
}

@freezed
class DrugUsageBefore with _$DrugUsageBefore {
  const factory DrugUsageBefore({
    required int order,
    required String drug,
    required String firstYearUsage,
  }) = _DrugUsageBefore;
}

@freezed
class Plan with _$Plan {
  const factory Plan({
    required String planType,
    required String subDivisionName,
    required String startDate,
    required String endDate,
    required String round,
    required LastedEvalResult? lastedEvalResult,
  }) = _Plan;
}

@freezed
class Monitoring with _$Monitoring {
  const factory Monitoring({
    required String latestResultDate,
    required String startDate,
    required String endDate,
    required int round,
    required String subdivision,
    required UsingDrugStatus? latestResult,
    required bool finalRound,
  }) = _Monitoring;
}
