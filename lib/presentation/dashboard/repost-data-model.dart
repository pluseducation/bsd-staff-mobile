import 'package:bst_staff_mobile/data/repository/dashboard-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as logger;

class ReportDataModel extends ChangeNotifier {
  final logger.Logger log;
  final DashboardRepository dashboardRepository;
  final AppService appService;

  late String name;
  late int healthServiceId;
  late int districtId;
  late List<ReportData> report;
  late Debouncer debouncer;

  ReportDataModel({
    required this.log,
    required this.dashboardRepository,
    required this.appService,
  });

  Future<bool> initData(
    String name,
    int healthServiceId,
    int districtId,
  ) async {
    try {
      this.name = name;
      this.healthServiceId = healthServiceId;
      this.districtId = districtId;

      report = await dashboardRepository.findReportData(
        name,
        districtId,
        healthServiceId,
      );

      // debouncer
      debouncer = Debouncer(milliseconds: Constant.timeDebounce);

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

  Future<bool> search(String name) async {
    try {
      debouncer.run(() async {
        this.name = name;
        report = await dashboardRepository.findReportData(
          name,
          districtId,
          healthServiceId,
        );
        notifyListeners();
      });
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
