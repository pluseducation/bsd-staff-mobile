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

// --------Screening----------
@freezed
class Screening with _$Screening {
  const factory Screening({
    required String screeningDate,
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
    required String mentalTreatmentOther,
    required String hadChronicContagious,
    required String chronicContagious,
    required String chronicContagiousOther,
    required String hadCriminalCase,
    required String criminalCase,
    required String criminalCaseOther,
    required String homeless,
    required String disabledPerson,
    required String disabledCertificateNo,
  }) = _Screening;
}

// --------Screening----------
@freezed
class Treatment with _$Treatment {
  const factory Treatment({
    required String treatmentDate,
    required String mentalEvalLevel,
    required int drugEvalScore,
    required String levelOfAddicted,
    required String treatmentResult,
    required String evaluationDate,
    required String evaluationResult,
    required String mentalTreatmentResult,
    required String physicalTreatmentResult,
  }) = _Treatment;
}

@freezed
class Monitoring with _$Monitoring {
  const factory Monitoring({
    required String startDate,
    required String endDate,
    required int round,
    required String subdivision,
    required String latestResult,
    required bool finalRound,
  }) = _Monitoring;
}
