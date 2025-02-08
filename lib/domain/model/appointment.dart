import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'appointment.freezed.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required List<AppointmentEvent> events, //**  /appointments */
    required List<AppointmentDay> days, //**  /appointments
  }) = _Appointment;
}

@freezed
class AppointmentEvent with _$AppointmentEvent {
  const factory AppointmentEvent({
    required DateTime appointmentDate,
    required String appointmentDateText,
    required String appointmenTimeText,
    required AppointmentType? appointmentType,
    required int round,
    required String fullname,
    required String phoneNo,
    required String guardianFullname,
    required String guardianPhoneNo,
  }) = _AppointmentEvent;
}

@unfreezed
class AppointmentDay with _$AppointmentDay {
  factory AppointmentDay({
    required DateTime appointmentDate,
    required List<String> fullnames,
  }) = _AppointmentDay;
}
