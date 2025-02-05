import 'package:bst_staff_mobile/data/network/api/appointments-api.dart';
import 'package:bst_staff_mobile/data/network/entity/appointments-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class AppointmentsRepository {
  final Appointments appointmentsApi;
  final NetworkMapper networkMapper;

  AppointmentsRepository({
    required this.appointmentsApi,
    required this.networkMapper,
  });

  Future<Appointment> findAppointments() async {
    final List<AppointmentsEntity> appointmentEntitys =
        await appointmentsApi.findAppointments();

    final List<AppointmentEvent> appointmentEvents = [];
    final List<AppointmentCalendar> appointmentCalendars = [];

    for (final appointmentEntity in appointmentEntitys) {
      if (appointmentEntity.appointmentAt != null &&
          appointmentEntity.reason == null) {
        final DateTime appointmentAt =
            convertToDatetime(appointmentEntity.appointmentAt);

        final formattedDate = convertThaiDate(appointmentAt);
        final String formattedTime = convertToThaiTimes(appointmentAt);

        final String roundText = _getappointmentStatus(
          appointmentEntity.appointmentType,
          appointmentEntity.round,
        );

        final String fullname =
            "${convertToString(appointmentEntity.name)} ${convertToString(appointmentEntity.surname)}";

        final String phoneNo = convertToString(appointmentEntity.phoneNo);

        final String guardianFullname = (appointmentEntity.guardianName !=
                    null &&
                appointmentEntity.guardianSurname != null)
            ? "${convertToString(appointmentEntity.guardianName)} ${convertToString(appointmentEntity.guardianSurname)}"
            : "-";

        final String guardianPhoneNo =
            appointmentEntity.guardianPhoneNo != null &&
                    appointmentEntity.guardianPhoneNo!.isNotEmpty
                ? convertToString(appointmentEntity.guardianPhoneNo)
                : "-";

        // group calendar

        final existingCalendar = appointmentCalendars
            .where((calendar) => calendar.appointmentDate == appointmentAt)
            .firstOrNull;

        if (existingCalendar != null) {
          final index = appointmentCalendars.indexOf(existingCalendar);
          appointmentCalendars[index].fullnames.add(fullname);
        } else {
          final List<String> fullnames = [fullname];

          final AppointmentCalendar appointmentCalendar = AppointmentCalendar(
            appointmentDate: appointmentAt,
            fullnames: fullnames,
          );
          appointmentCalendars.add(appointmentCalendar);
        }

        final AppointmentEvent appointmentEvent = networkMapper.toAppointment(
          appointmentDate: appointmentAt,
          appointmenDate: formattedDate,
          appointmenTime: formattedTime,
          roundText: roundText,
          fullname: fullname,
          phoneNo: phoneNo,
          guardianFullname: guardianFullname,
          guardianPhoneNo: guardianPhoneNo,
        );

        appointmentEvents.add(appointmentEvent);
      }
    }

    return Appointment(
      calendars: appointmentCalendars,
      events: appointmentEvents,
    );
  }

  String _getappointmentStatus(
    String? appointmentType,
    int? round,
  ) {
    if (appointmentType == "MONITORING") {
      const appointmentType = "นัดติดตาม";
      return convertToString("$appointmentTypeครั้งที่ $round");
    } else if (appointmentType == "TREATMENT") {
      const appointmentType = "นัดบำบัด";
      return convertToString("$appointmentTypeครั้งที่ $round");
    } else if (appointmentType == "ASSISTANCE") {
      const appointmentType = "นัดช่วยเหลือ";
      return convertToString("$appointmentTypeครั้งที่ $round");
    } else {
      return "";
    }
  }
}
