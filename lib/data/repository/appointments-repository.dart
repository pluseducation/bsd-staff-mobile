import 'package:bst_staff_mobile/data/network/api/appointments-api.dart';
import 'package:bst_staff_mobile/data/network/api/master-api.dart';
import 'package:bst_staff_mobile/data/network/entity/appointments-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class AppointmentsRepository {
  final Appointments appointmentsApi;
  final MasterApi masterApi;
  final NetworkMapper networkMapper;

  AppointmentsRepository({
    required this.appointmentsApi,
    required this.masterApi,
    required this.networkMapper,
  });

  Future<Appointment> findAppointments() async {
    final List<AppointmentsEntity> appointmentEntitys =
        await appointmentsApi.findAppointments();

    final List<AppointmentEvent> appointmentEvents = [];
    final List<AppointmentCalendar> appointmentCalendars = [];

    for (final appointmentEntity in appointmentEntitys) {
      if (appointmentEntity.appointmentAt != null) {
        final DateTime appointmentAt =
            convertToDatetime(appointmentEntity.appointmentAt);

        final String roundText = _getappointmentStatus(
          appointmentEntity.appointmentType,
          appointmentEntity.round,
        );

        final String fullname =
            "${convertToString(appointmentEntity.name)} ${convertToString(appointmentEntity.surname)}";

        final String phoneNo = convertToString(appointmentEntity.phoneNo);

        final String guardianFullname =
            "${convertToString(appointmentEntity.guardianName)} ${convertToString(appointmentEntity.guardianSurname)}";

        final String guardianPhoneNo =
            convertToString(appointmentEntity.guardianPhoneNo);

        final AppointmentEvent appointmentModel = AppointmentEvent(
          appointmentDate: null,
          appointmenTime: '',
          roundText: roundText,
          fullname: fullname,
          phoneNo: phoneNo,
          guardianFullname: guardianFullname,
          guardianPhoneNo: guardianPhoneNo,
        );
        appointmentEvents.add(appointmentModel);

        // group calendar
        final first = appointmentCalendars
            .where((t) => t.appointmentDate == appointmentAt)
            .firstOrNull;
        if (first != null) {
          first.fullnames.add(fullname);
        } else {
          final List<String> fullnames = [];
          fullnames.add(fullname);

          final AppointmentCalendar appointmentCalendar = AppointmentCalendar(
            appointmentDate: appointmentAt,
            fullnames: fullnames,
          );
          appointmentCalendars.add(appointmentCalendar);
        }
      }
    }

    print("finish");

    return Appointment(
        calendars: appointmentCalendars, events: appointmentEvents);
  }

  String _getappointmentStatus(
    String? appointmentType,
    int? round,
  ) {
    if (appointmentType == "MONITORING") {
      const appointmentType = "ติดตาม";
      return convertToString("$appointmentType $round");
    } else if (appointmentType == "TREATMENT") {
      const appointmentType = "บำบัด";
      return convertToString("$appointmentType $round");
    } else if (appointmentType == "ASSISTANCE") {
      const appointmentType = "ช่วยเหลือ";
      return convertToString("$appointmentType $round");
    } else {
      return "";
    }
  }
}
