import 'package:bst_staff_mobile/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'appointments.freezed.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required List<AppointmentEvent> events, //**  /appointments */
    required List<AppointmentCalendar> calendars, //**  /appointments
  }) = _Appointment;
}

@freezed
class AppointmentEvent with _$AppointmentEvent {
  const factory AppointmentEvent({
    required DateTime appointmentDate,
    required String appointmenDate,
    required String appointmenTime,
    required AppointmentType? appointmentType,
    required int round,
    required String fullname,
    required String phoneNo,
    required String guardianFullname,
    required String guardianPhoneNo,
  }) = _AppointmentEvent;
}

@unfreezed
class AppointmentCalendar with _$AppointmentCalendar {
  factory AppointmentCalendar({
    required DateTime appointmentDate,
    required List<String> fullnames,
  }) = _AppointmentCalendar;
}
