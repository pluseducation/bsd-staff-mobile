import 'package:bst_staff_mobile/data/repository/appointment-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/appointment.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppointmentModel extends ChangeNotifier {
  final Logger log;
  final AppointmentRepository appointmentRepository;
  final AppService appService;
  late Appointment appointment;
  late DateTime selectedDate;

  AppointmentModel({
    required this.log,
    required this.appointmentRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      appointment = await appointmentRepository.findAppointments();
      selectedDate = DateTime.now();
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

  Future<bool> setSelectedDate(DateTime date) async {
    try {
      selectedDate = date;
      notifyListeners();
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
