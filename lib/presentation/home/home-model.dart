import 'package:bst_staff_mobile/data/repository/home-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class HomeModel extends ChangeNotifier {
  final Logger log;
  final HomeRepository homeRepository;
  final AppService appService;

  late String dateNow;
  late int totalPatient;
  late double retention;
  late WorkFlowCount workflowCount;
  late ReferCount referCount;

  NumberFormat numberFormat = NumberFormat("#,###");

  HomeModel({
    required this.log,
    required this.homeRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      final now = DateTime.now();
      dateNow = formatDate(now);
      totalPatient = await homeRepository.findTotalPatientDashboard();
      retention = await homeRepository.findRetentionDashboard();
      workflowCount = await homeRepository.findWorkflowDashboard();
      referCount = await homeRepository.findReferDashboard();

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
