import 'dart:developer';

import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as lg;

class DashboardModel {
  final lg.Logger log;
  final DashboardRepository dashboardRepository;
  final AppService appService;

  DashboardModel({
    required this.log,
    required this.dashboardRepository,
    required this.appService,
  });

  Future<WorkFlowTotal> findWorkFlowTotal() async {
    try {
      return dashboardRepository.findWorkFlowTotal();
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

  Future<Refer> findTotalRefer() async {
    try {
      return dashboardRepository.findTotalRefer();
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

  Future<int> findTotalRetention() async {
    try {
      final result = await dashboardRepository.findTotalRetention();
      return result;
    } catch (e) {
      if (e is NetworkException) {
        log.e('Network Error', error: e);
        return 0; //throw CustomException(e.message);
      } else {
        log.e('System Error', error: e);
        throw CustomException(e.toString());
      }
    }
  }

  Future<int> findpatients() async {
    try {
      return dashboardRepository.findpatients();
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

  Future<Level> findLevel() async {
    try {
      return await dashboardRepository.findLevel();
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

  Future<StatPatientWeek> findStatPatientWeek() async {
    try {
      return await dashboardRepository.findStatPatientWeek();
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

  Future<StatPatientMonth> findStatPatientMonth() async {
    try {
      return await dashboardRepository.findStatPatientMonth();
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

class ReportDataProvider extends ChangeNotifier {
  final lg.Logger log;
  final DashboardRepository dashboardRepository;
  final AppService appService;

  // condition
  String name = "";
  int districtId = 0;
  int healthServiceId = 0;

  List<ReportData> reportDatas = [];

  ReportDataProvider({
    required this.log,
    required this.dashboardRepository,
    required this.appService,
  });

  Future<void> initData(
    int searchDistrictId,
    int searchHealthServiceId,
  ) async {
    districtId = searchDistrictId;
    healthServiceId = searchHealthServiceId;
  }

  Future<bool> findReportData() async {
    try {
      reportDatas = await dashboardRepository.findReportData(
        name: name,
        districtId: districtId,
        healthServiceId: healthServiceId,
      );
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

  Future<void> search(String searchName) async {
    name = searchName;
    await findReportData();
    notifyListeners();
  }
}
