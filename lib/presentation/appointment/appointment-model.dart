import 'package:bst_staff_mobile/data/repository/Appointments-repository.dart';
import 'package:bst_staff_mobile/domain/exception/custom-exception.dart';
import 'package:bst_staff_mobile/domain/exception/network-exception.dart';
import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:logger/logger.dart';

class AppointmentsModel {
  final Logger log;
  final AppointmentsRepository appointmentsRepository;
  final AppService appService;

  AppointmentsModel({
    required this.log,
    required this.appointmentsRepository,
    required this.appService,
  });

  Future<Appointment> findAppointments() async {
    try {
      return await appointmentsRepository.findAppointments();
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
