import 'package:bst_staff_mobile/data/repository/Appointments-repository.dart';
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

  Future<void> findAppointments() async {
    appointmentsRepository.findAppointments();
  }

  // Future<Appointment> findAppointments() async {
  //   appointmentsRepository.findAppointments();
  //   throw Exception('ไม่สามารถหา Appointments ได้');
  // }
}
