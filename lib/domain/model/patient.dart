import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

@unfreezed
class SearchPatient with _$SearchPatient {
  factory SearchPatient({
    required String searchVal,
    required List<WorkFlowStatus> workFlowStatus,
    required List<LevelType> levelTypes,
    required List<DrugEvalResult> drugEvalResults,
    required List<TreatmentType> treatmentTypes,
    required List<SmivType> smivTypes,
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _SearchPatient;
}

@freezed
class Patient with _$Patient {
  const factory Patient({
    required int patientId,
    required String fullName,
    required String nationalId,
    required String cycle,
    required WorkFlowStatus? workFlowStatus,
    DrugEvalResult? drugEvalResult,
    LevelType? levelType,
    TreatmentType? treatmentType,
    SmivType? smivType,
  }) = _Patient;
}
