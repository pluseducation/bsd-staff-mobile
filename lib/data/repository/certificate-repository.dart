import 'dart:math';

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
        cycle: convertToString(item.cycle),
        requestedDateText: finalRequestedDateText,
        certificateStatus: CertificateStatus.setValue(item.status),
      );
    }).toList();

    return models;
  }

  Future<CertificateDetail> findCertificateById({
    required int certificateById,
  }) async {
    final entity = await certificateApi.findCertificateById(
      certificateById: certificateById,
    );

    final fullname =
        '${convertToString(entity.name)} ${convertToString(entity.surname)}';
    final fullNameApproved = (convertToString(entity.approvedName).isEmpty &&
            convertToString(entity.approvedSurname).isEmpty)
        ? '-'
        : "${convertToString(entity.approvedName)} ${convertToString(entity.approvedSurname)}";

    final model = CertificateDetail(
      id: convertToInt(entity.id),
      fullName: fullname,
      nationalId: convertToString(entity.nationalId),
      cycle: convertToString(entity.cycle),
      phoneNo: convertToString(entity.phoneNo),
      workFlowStatus: WorkFlowStatus.setValue(entity.workflowType),
      drugEvalResult: DrugEvalResult.setValue(entity.drugEvalResult),
      levelType: LevelType.setValue(entity.mentalEvalResult),
      fullNameApproved: fullNameApproved,
    );

    return model;
  }

  Future<bool> updateCertificateStatus({
    required int id,
    required CertificateStatus status,
    required String fileNameOrg,
    required String content,
  }) async {
    final result = await certificateApi.updateCertificateStatus(
      id: id,
      status: status.value ?? '',
      fileNameOrg: fileNameOrg,
      content: content,
    );
    return result;
  }
}
