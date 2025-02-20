import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/data/repository/home-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart' as logger;

class DashboardModel extends ChangeNotifier {
  final logger.Logger log;
  final DashboardRepository dashboardRepository;
  final AppService appService;

  late String dateNow;
  late int totalPatient;
  late double retention;
  late WorkFlowCount workflowCount;
  late ReferCount referCount;

  late StatPatientWeek statPatientWeek;
  late StatPatientMonth statPatientMonth;
  late Level level;
  late bool patient = false;
  late bool refer = false;
  late bool assistance = false;
  late bool stat = false;

  NumberFormat numberFormat = NumberFormat("#,###");

  DashboardModel({
    required this.log,
    required this.dashboardRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      final now = DateTime.now();
      dateNow = formatDate(now);
      totalPatient = await dashboardRepository.findTotalPatientDashboard();
      retention = await dashboardRepository.findRetentionDashboard();
      workflowCount = await dashboardRepository.findWorkflowDashboard();
      referCount = await dashboardRepository.findReferDashboard();

      level = await dashboardRepository.findLevel();
      statPatientWeek = await dashboardRepository.findStatPatientWeek();
      statPatientMonth = await dashboardRepository.findStatPatientMonth();

      patient = appService.patient;
      refer = appService.refer;
      assistance = appService.assistance;
      stat = appService.stat;

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
}
