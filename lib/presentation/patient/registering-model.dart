// class WorkflowdModel {
//   final Logger log;
//   final WorkflowRepository workflowRepository;
//   final AppService appService;

//   WorkflowdModel({
//     required this.log,
//     required this.workflowRepository,
//     required this.appService,
//   });

//   Future<RegisteringEntity> findQuestionChoices() async {
//     const int patientsId = 1190;

//     try {
//       return workflowRepository.findPatientAllID(patientsid: patientsId);
//     } catch (e) {
//       if (e is NetworkException) {
//         log.e('Network Error', error: e);
//         throw CustomException(e.message);
//       } else {
//         log.e('System Error', error: e);
//         throw CustomException(e.toString());
//       }
//     }
//   }
// }

import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
import 'package:bst_staff_mobile/data/network/entity/workflow-entity.dart';
import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
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
}
