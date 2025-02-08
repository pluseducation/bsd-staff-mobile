import 'package:bst_staff_mobile/data/network/api/appointment-api.dart';
import 'package:bst_staff_mobile/data/network/entity/appointment-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/appointment.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/util/enum.dart';

class AppointmentRepository {
  final AppointmentApi appointmentsApi;
  final NetworkMapper networkMapper;

  AppointmentRepository({
    required this.appointmentsApi,
    required this.networkMapper,
  });

  Future<Appointment> findAppointments() async {
    final List<AppointmentEntity> appointmentEntitys =
        await appointmentsApi.findAppointment();

    final List<AppointmentEvent> appointmentEvents = [];
    final List<AppointmentDay> appointmentDays = [];

    for (final entity in appointmentEntitys) {
      if (entity.reason == null) {
        final appointmentAt = convertToDatetime(entity.appointmentAt);
        final name =
            "${convertToString(entity.name)} ${convertToString(entity.surname)}";
        final phoneNo = convertToString(entity.phoneNo);

        final existingCalendar = appointmentDays
            .where(
              (calendar) =>
                  calendar.appointmentDate == convertToDateOnly(appointmentAt),
            )
            .firstOrNull;

        if (existingCalendar != null) {
          final index = appointmentDays.indexOf(existingCalendar);
          appointmentDays[index].fullnames.add(name);
        } else {
          final List<String> fullnames = [name];
          final AppointmentDay appointmentDay = AppointmentDay(
            appointmentDate: convertToDateOnly(appointmentAt),
            fullnames: fullnames,
          );
          appointmentDays.add(appointmentDay);
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
      days: appointmentDays,
      events: appointmentEvents,
    );
  }
}
