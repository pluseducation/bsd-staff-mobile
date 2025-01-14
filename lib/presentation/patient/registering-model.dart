import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:logger/logger.dart';

class RegisteringModel {
  final Logger log;
  final WorkflowRepository workflowRepository;
  final AppService appService;

  RegisteringModel({
    required this.log,
    required this.workflowRepository,
    required this.appService,
  });

  // Future<Registering> findRegistering(int patientId) async {
  //   return workflowRepository.findRegistering(patientId);
  // }
}
