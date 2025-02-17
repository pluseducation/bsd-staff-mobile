import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.freezed.dart';

@unfreezed
class SearchCertificate with _$SearchCertificate {
  factory SearchCertificate({
    required String name,
    required int page,
    required int totalPages,
    required int totalElements,
    required int size,
  }) = _SearchCertificate;
}

@freezed
class Certificate with _$Certificate {
  const factory Certificate({
    required int id,
    required String fullName, //  name + surname
    required String nationalId, // เลขบัตร
    required String cycle,
    required String requestedDateText, // วันที่ขอ
    required CertificateStatus? certificateStatus,
  }) = _Certificate;
}

@freezed
class CertificateDetail with _$CertificateDetail {
  const factory CertificateDetail({
    required int id,
    required String fullName,
    required String nationalId,
    required String cycle,
    required String phoneNo,
    required WorkFlowStatus? workFlowStatus,
    DrugEvalResult? drugEvalResult,
    LevelType? levelType,
    required String fullNameApproved,
  }) = _CertificateDetail;
}
