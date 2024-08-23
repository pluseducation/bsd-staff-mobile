import 'package:bst_staff_mobile/data/network/api/certificate-api.dart';
import 'package:bst_staff_mobile/data/network/entity/certificate-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:intl/intl.dart';

class CertificateRepository {
  final CertificateApi certificateApi;
  final NetworkMapper networkMapper;

  CertificateRepository({
    required this.certificateApi,
    required this.networkMapper,
  });

  Future<Certificate> findCertificateAll({
    required String name,
  }) async {
    final CertificateEntity certificateEntity =
        await certificateApi.findCertificateAll(name: name);

    final List<CertificateRequest> certificateRequests = [];
    final List<CertificateRequest> certificateCompletes = [];

    for (final content in certificateEntity.content ?? []) {
      final String fullname =
          "${convertToString(content.name)} ${convertToString(content.surname)}";
      final String nationalId = convertToString(content.nationalId);

      final DateTime? requestedDate = content.requestedDate as DateTime?;
      final String requestedDateText = convertThaiDate(requestedDate);
      final DateTime currentDate = DateTime.now();
      final Duration difference =
          currentDate.difference(requestedDate ?? currentDate);
      final int sum = difference.inDays;

      final String finalRequestedDateText =
          "$requestedDateText ($sum วันที่แล้ว)";

      final String status = convertToString(content.status);

      final certificateRequest = CertificateRequest(
        fullName: fullname,
        nationalId: nationalId,
        requestedDateText: finalRequestedDateText,
        status: status,
      );

      if (status == 'COMPLETED') {
        certificateCompletes.add(certificateRequest);
      } else if (status == 'REQUEST') {
        certificateRequests.add(certificateRequest);
      }
    }
    print("finish");

    return Certificate(
      requests: certificateRequests,
      completes: certificateCompletes,
    );
  }
}
