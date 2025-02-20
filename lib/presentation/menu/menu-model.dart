import 'package:bst_staff_mobile/data/repository/home-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/dashboard.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class MenuModel extends ChangeNotifier {
  final Logger log;
  final AppService appService;

  bool appointment = false;
  bool patient = false;
  bool assistance = false;
  bool certificate = false;
  bool refer = false;
  bool dashboard = false;
  bool user = false;

  MenuModel({
    required this.log,
    required this.appService,
  });

  Future<bool> initData() async {
    appointment = appService.appointment;
    patient = appService.patient;
    assistance = appService.assistance;
    certificate = appService.certificate;
    refer = appService.refer;
    dashboard = appService.dashboard;
    user = appService.user;
    try {
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
