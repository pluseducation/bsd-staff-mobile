import 'package:bst_staff_mobile/data/network/api/certificate-api.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

class CertificateRepository {
  final CertificateApi certificateApi;
  final NetworkMapper networkMapper;

  CertificateRepository({
    required this.certificateApi,
    required this.networkMapper,
  });

  Future<List<Certificate>> findCertificateAll({
    required SearchCertificate search,
  }) async {
    final entity = await certificateApi.findCertificateAll(
      searchCertificate: search,
    );

    search.totalElements = entity.totalElements!;
    search.totalPages = entity.totalPages!;

    final models = entity.content!.map((item) {
      final String fullname =
          "${convertToString(item.name)} ${convertToString(item.surname)}";
      final String finalRequestedDateText = formatTimegone(item.requestedDate);

      return Certificate(
        id: convertToInt(item.id),
        fullName: fullname,
        nationalId: convertToString(item.nationalId),
        cycle: 'รอ:field', //convertToString(item.cycle)
        requestedDateText: finalRequestedDateText,
        certificateStatus: CertificateStatus.setValue(item.status),
      );
    }).toList();

    return models;
  }
}
