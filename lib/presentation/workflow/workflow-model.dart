import 'package:bst_staff_mobile/data/repository/workflow-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/workflow.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class WorkflowModel extends ChangeNotifier {
  final Logger log;
  final WorkflowRepository workflowRepository;
  final AppService appService;

  late int patientId;
  late Registering? registering;
  late Screening? screening;
  late Treatment? treatment;
  late List<Monitoring> monitorings;

  WorkflowModel({
    required this.log,
    required this.workflowRepository,
    required this.appService,
  });

  Future<bool> initData(int id) async {
    try {
      patientId = id;
      registering = await workflowRepository.findRegistering(patientId);
      screening = await workflowRepository.findScreening(patientId);
      treatment = await workflowRepository.findTreatment(patientId);
      monitorings = await workflowRepository.findMonitoring(patientId);
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

  // Future<Registering> findRegistering(int patientId) async {
  //   return workflowRepository.findRegistering(patientId);
  // }
}
