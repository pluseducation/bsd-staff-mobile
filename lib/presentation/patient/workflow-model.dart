import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:logger/logger.dart';

class WorkflowdModel {
  final Logger log;
  final WorkflowRepository workflowRepository;
  final AppService appService;

  WorkflowdModel({
    required this.log,
    required this.workflowRepository,
    required this.appService,
  });

  Future<Registering?> findRegistering(int patientId) async {
    try {
      return null; //workflowRepository.findRegistering(patientId);
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

  Future<Screening?> findScreening(int patientId) async {
    try {
      return null; //workflowRepository.findScreening(patientId);
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

  Future<Treatment?> findTreatment(int patientId) async {
    try {
      return null; //workflowRepository.findTreatment(patientId);
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

  int getLength(String status) {
    int length = 0;
    if (isHaveRegistering(status)) {
      length = 1;
    }

    if (isHaveScreening(status)) {
      length = 2;
    }

    if (isHaveTreatment(status)) {
      length = 3;
    }

    return length;
  }

  bool isHaveRegistering(String status) {
    bool isHave = false;
    if ([
      "REGISTERING",
      "SCREENING",
      "TREATMENT",
      "MONITORING",
      "ASSISTANCE",
      "DISCHARGED"
    ].contains(status)) {
      isHave = true;
    }

    return isHave;
  }

  bool isHaveScreening(String status) {
    bool isHave = false;
    if (["SCREENING", "TREATMENT", "MONITORING", "ASSISTANCE", "DISCHARGED"]
        .contains(status)) {
      isHave = true;
    }

    return isHave;
  }

  bool isHaveTreatment(String status) {
    bool isHave = false;
    if (["TREATMENT", "MONITORING", "ASSISTANCE", "DISCHARGED"]
        .contains(status)) {
      isHave = true;
    }

    return isHave;
  }
}
