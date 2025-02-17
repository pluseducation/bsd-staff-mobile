import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CertificateDetailModel extends ChangeNotifier {
  final Logger log;
  final CertificateRepository certificateRepository;
  final AppService appService;

  late CertificateDetail certificateDetail;
  bool isApprovedClicked = true;
  bool isRejectedClicked = false;

  CertificateDetailModel({
    required this.log,
    required this.certificateRepository,
    required this.appService,
  });

  Future<bool> initData(int certificateById) async {
    try {
      certificateDetail = await certificateRepository.findCertificateById(
        certificateById: certificateById,
      );
      return true;
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    }
  }

  Future<void> approve(CertificateStatus status) async {
    isApprovedClicked = true;
    isRejectedClicked = false;
    notifyListeners();
    await updateCertificateStatus(
      id: certificateDetail.id,
      status: status,
      fileNameOrg: 'assets/images/image_login.png',
      contentBase64: 'contentBase64',
    );
  }

  Future<void> reject(CertificateStatus status) async {
    isApprovedClicked = false;
    isRejectedClicked = true;
    notifyListeners();
    await updateCertificateStatus(
      id: certificateDetail.id,
      status: status,
      fileNameOrg: 'assets/images/image_login.png',
      contentBase64: 'contentBase64',
    );
  }

  Future<void> updateCertificateStatus({
    required int id,
    required CertificateStatus status,
    required String fileNameOrg,
    required String contentBase64,
  }) async {
    try {
      await certificateRepository.updateCertificateStatus(
        id: id,
        status: status,
        fileNameOrg: fileNameOrg,
        contentBase64: contentBase64,
      );
      appService.intervalWebAuth();
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    }
  }
}
