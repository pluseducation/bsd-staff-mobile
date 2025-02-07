import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

@unfreezed
class Search with _$Search {
  factory Search({
    required String searchVal,
    required List<WorkFlowStatus> workFlowStatus,
    required List<LevelType> levelType,
    required List<DrugEvalResult> drugEvalResult,
    required List<TreatmentType> treatmentType,
    required List<SmivType> smivType,
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _Search;
}

@freezed
class Patient with _$Patient {
  factory Patient({
    required List<PatientContent> content,
  }) = _Patient;
}

@freezed
class PatientContent with _$PatientContent {
  const factory PatientContent({
    required int patientId,
    required String fullName,
    required String nationalId,
    required String cycle,
    required WorkFlowStatus workFlowStatus,
    DrugEvalResult? drugEvalResult,
    LevelType? levelType,
    TreatmentType? treatmentType,
    SmivType? smivType,
  }) = _PatientContent;
}
