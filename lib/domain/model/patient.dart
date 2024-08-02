import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

@freezed
class PatientAll with _$PatientAll {
  const factory PatientAll({
    required List<Patient> content,
    required int totalPages,
    required int totalElements,
  }) = _PatientAll;
}

@freezed
class Patient with _$Patient {
  const factory Patient({
    required int patientId,
    required String fullName,
    required String nationalId,
    required String cycle,
    required String status,
  }) = _Patient;
}
