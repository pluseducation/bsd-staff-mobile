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
    required DateTime appointmentDate, //** find on where /appointments */
    required String appointmenTime, // ปี เดือน วัน
    required String roundText, //appointmentType + round roundText.where
    required String fullname, // ชื่อผู้ป่วย name +  surname // appointments
    required String phoneNo, // เบอร์โทร /appointments
    required String
        guardianFullname, // ชื่อผู้ปกครอง guardianName + guardianSurname/ / /appointments
    required String guardianPhoneNo, //เบอร์โทรผู้ปกครอง /appointments
  }) = _AppointmentEvent;
}

@freezed
class AppointmentCalendar with _$AppointmentCalendar {
  const factory AppointmentCalendar({
    required DateTime appointmentDate, //** find on  /appointments */
    required List<String> fullnames,
  }) = _AppointmentCalendar;
}
