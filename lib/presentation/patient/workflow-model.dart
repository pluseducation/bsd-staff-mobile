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

  Future<Registering> findRegistering(int patientId) async {
    try {
      return workflowRepository.findRegistering(patientId);
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

  Future<void> testvalue() async {
    workflowRepository.findRegistering(1190);
    workflowRepository.findScreenings(1191);
  }
}
