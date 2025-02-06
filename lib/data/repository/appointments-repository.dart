import 'package:bst_staff_mobile/data/network/api/appointments-api.dart';
import 'package:bst_staff_mobile/data/network/entity/appointments-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

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

    for (final entity in appointmentEntitys) {
      if (entity.reason == null) {
        final appointmentAt = convertToDatetime(entity.appointmentAt);
        final name =
            "${convertToString(entity.name)} ${convertToString(entity.surname)}";
        final phoneNo = convertToString(entity.phoneNo);

        final existingCalendar = appointmentCalendars
            .where((calendar) => calendar.appointmentDate == appointmentAt)
            .firstOrNull;

        if (existingCalendar != null) {
          final index = appointmentCalendars.indexOf(existingCalendar);
          appointmentCalendars[index].fullnames.add(name);
        } else {
          final List<String> fullnames = [name];
          final AppointmentCalendar appointmentCalendar = AppointmentCalendar(
            appointmentDate: appointmentAt,
            fullnames: fullnames,
          );
          appointmentCalendars.add(appointmentCalendar);
        }

        final AppointmentEvent appointmentModel = AppointmentEvent(
          appointmentDate: appointmentAt,
          appointmenDate: formatDate(appointmentAt),
          appointmenTime: formatTime(appointmentAt),
          appointmentType: AppointmentType.setValue(entity.appointmentType),
          round: convertToInt(entity.round),
          fullname: name,
          phoneNo: convertToString(entity.phoneNo),
          guardianFullname: (entity.guardianName != null &&
                  entity.guardianSurname != null)
              ? "${convertToString(entity.guardianName)} ${convertToString(entity.guardianSurname)}"
              : "-",
          guardianPhoneNo: entity.guardianPhoneNo != null &&
                  entity.guardianPhoneNo!.isNotEmpty
              ? convertToString(entity.guardianPhoneNo)
              : "-",
        );

        appointmentEvents.add(appointmentModel);
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
