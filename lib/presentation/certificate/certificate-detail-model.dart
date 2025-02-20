import 'dart:io';

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

  late int certificateId;
  late CertificateDetail certificateDetail;
  CertificateStatus? status;
  late bool isRequest;

  late bool isShowImage = false;
  late String fileType; //'NETWORK' , 'LOCAL'
  String? networkPath;
  String? localPath;

  File? file;
  bool isApproved = false;
  bool isRejected = false;

  CertificateDetailModel({
    required this.log,
    required this.certificateRepository,
    required this.appService,
  });

  Future<bool> initData(int certificateId, CertificateStatus? status) async {
    try {
      this.certificateId = certificateId;
      this.status = status;
      final officerId = await appService.preferencesRepo.getOfficerId();
      certificateDetail = await certificateRepository.findCertificateById(
        certificateId: certificateId,
        officerId: officerId,
      );

      isShowImage = false;
      if (this.status == CertificateStatus.request) {
        isRequest = true;
      } else {
        isRequest = false;
      }

      // if (certificateDetail.fileName.isNotEmpty) {
      //   fileType = "NETWORK";
      //   networkPath = certificateDetail.fileName;
      //   isShowImage = true;
      // } else {
      //   isShowImage = false;
      // }

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

  Future<void> approve() async {
    isApproved = true;
    isRejected = false;
    status = CertificateStatus.completed;
    notifyListeners();
  }

  Future<void> reject() async {
    isApproved = false;
    isRejected = true;
    status = CertificateStatus.denied;
    notifyListeners();
  }

  Future<void> setLocalFile(File addFile) async {
    isShowImage = true;
    fileType = "LOCAL";
    localPath = addFile.path;
    file = addFile;
    notifyListeners();
  }

  Future<void> updateCertificateStatus() async {
    try {
      if (status != null && file != null) {
        await certificateRepository.updateCertificateStatus(
          id: certificateId,
          status: status!,
          imageFile: file!,
        );
      }
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
