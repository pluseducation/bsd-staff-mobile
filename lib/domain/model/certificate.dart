import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.freezed.dart';

@freezed
class Certificate with _$Certificate {
  const factory Certificate({
    required List<CertificateRequest> alls,
    required List<CertificateRequest> requests,
    required List<CertificateRequest> completes,
  }) = _CertificateAll;
}

@freezed
class CertificateRequest with _$CertificateRequest {
  const factory CertificateRequest({
    required String fullName, //  name + surname
    required String nationalId, // เลขบัตร
    required String requestedDateText, // วันที่ขอ
    required String status, // สถานะ
  }) = _CertificateRequest;
}
