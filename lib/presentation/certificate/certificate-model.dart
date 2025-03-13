import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/debouncer.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CertificateModel extends ChangeNotifier {
  final Logger log;
  final CertificateRepository certificateRepository;
  final AppService appService;

  bool isLoading = false;
  TextEditingController valueController = TextEditingController();

  late ValueNotifier<int> dataNotifier;
  late SearchCertificate search;
  late List<Certificate> certificate;
  late List<Certificate> certificateRequest;
  late List<Certificate> certificateCompleted;
  late List<Certificate> certificateDenied;
  late Debouncer debouncer;

  CertificateModel({
    required this.log,
    required this.certificateRepository,
    required this.appService,
  });

  Future<bool> initData(ValueNotifier<int> dataNotifier) async {
    try {
      this.dataNotifier = dataNotifier;
      search = initSearch();
      certificate = await certificateRepository.findCertificateAll(
        search: search,
      );

      certificateRequest = certificate
          .where(
            (item) => item.certificateStatus == CertificateStatus.request,
          )
          .toList();

      certificateCompleted = certificate
          .where(
            (item) => item.certificateStatus == CertificateStatus.completed,
          )
          .toList();

      certificateDenied = certificate
          .where(
            (item) => item.certificateStatus == CertificateStatus.denied,
          )
          .toList();

      this.dataNotifier.value = search.totalElements;

      // debouncer
      debouncer = Debouncer(milliseconds: Constant.timeDebounce);

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

  SearchCertificate initSearch() {
    try {
      return SearchCertificate(
        name: '',
        page: 0,
        totalPages: 0,
        totalElements: 0,
        size: Constant.size,
      );
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

  Future<void> loadData(int page) async {
    try {
      search.page = page;
      certificate = await certificateRepository.findCertificateAll(
        search: search,
      );
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchByValue(String value) async {
    try {
      debouncer.run(() async {
        search = initSearch();
        search.name = value;

        certificate = await certificateRepository.findCertificateAll(
          search: search,
        );

        certificateRequest = certificate
            .where(
              (item) => item.certificateStatus == CertificateStatus.request,
            )
            .toList();

        certificateCompleted = certificate
            .where(
              (item) => item.certificateStatus == CertificateStatus.completed,
            )
            .toList();

        certificateDenied = certificate
            .where(
              (item) => item.certificateStatus == CertificateStatus.denied,
            )
            .toList();

        dataNotifier.value = search.totalElements;
        notifyListeners();
      });
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
