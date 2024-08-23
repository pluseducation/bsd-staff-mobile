import 'package:bst_staff_mobile/data/repository/certificate-repository.dart';
import 'package:bst_staff_mobile/domain/model/certificate.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:logger/logger.dart';

class CertificateModel {
  final Logger log;
  final CertificateRepository certificateRepository;
  final AppService appService;

  CertificateModel({
    required this.log,
    required this.certificateRepository,
    required this.appService,
  });

  late Certificate certificate;
  String name = "";

  Future<Certificate> loadDatas() async {
    return certificate = await certificateRepository.findCertificateAll(
      name: name,
    );
  }
}
