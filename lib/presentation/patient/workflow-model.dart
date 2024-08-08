import 'package:bst_staff_mobile/data/network/entity/questionchoices-entity.dart';
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

  Future<void> testvalue() async {
    workflowRepository.findRegistering(1172);
  }

  // Future<Future<Registering>?> testvalue() async {
  //   try {
  //     return workflowRepository.findRegistering(1172);
  //   } catch (e) {
  //     if (e is NetworkException) {
  //       log.e('Network Error', error: e);
  //       throw CustomException(e.message);
  //     } else {
  //       log.e('System Error', error: e);
  //       throw CustomException(e.toString());
  //     }
  //   }
  // }

  // Future<Future<List<QuestionChoicesEntity>>> findScreening() async {
  //   try {
  //     return workflowRepository.findScreening();
  //   } catch (e) {
  //     if (e is NetworkException) {
  //       log.e('Network Error', error: e);
  //       throw CustomException(e.message);
  //     } else {
  //       log.e('System Error', error: e);
  //       throw CustomException(e.toString());
  //     }
  //   }
}

  // Future<Future<List<QuestionChoicesEntity>>> findtreatment() async {
  //   try {
  //     return workflowRepository.findtreatment();
  //   } catch (e) {
  //     if (e is NetworkException) {
  //       log.e('Network Error', error: e);
  //       throw CustomException(e.message);
  //     } else {
  //       log.e('System Error', error: e);
  //       throw CustomException(e.toString());
  //     }
  //   }
  // }
