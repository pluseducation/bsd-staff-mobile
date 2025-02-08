import 'package:bst_staff_mobile/data/repository/appointment-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/appointment.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppointmentModel extends ChangeNotifier {
  final Logger log;
  final AppointmentRepository appointmentRepository;
  final AppService appService;
  late Appointment appointment;

  late DateTime selectedDate;
  late List<AppointmentEvent> selectedEvents;

  AppointmentModel({
    required this.log,
    required this.appointmentRepository,
    required this.appService,
  });

  Future<bool> initData() async {
    try {
      appointment = await appointmentRepository.findAppointment();
      final now = DateTime.now();
      selectedDate = convertToDateOnly(now);

      selectedEvents = appointment.events
          .where((element) => element.appointmentDate == selectedDate)
          .toList();

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
      selectedDate = convertToDateOnly(date);
      selectedEvents = appointment.events
          .where((element) => element.appointmentDate == selectedDate)
          .toList();

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
