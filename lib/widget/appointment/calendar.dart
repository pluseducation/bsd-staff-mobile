import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/widget/appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentMonth extends StatefulWidget {
  final Appointment appointment;

  const AppointmentMonth({
    super.key,
    required this.appointment,
  });

  @override
  State<AppointmentMonth> createState() => _AppointmentMonthState();
}

class _AppointmentMonthState extends State<AppointmentMonth> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Map<String, String>> _selectedEvents = [];
  Map<String, List<Map<String, String>>> _events = {};

  @override
  void initState() {
    super.initState();
    _events = {};
    for (final event in widget.appointment.events) {
      final appointmentDate = event.appointmentDate;
      final dateString = convertDateY(appointmentDate);
      if (_events[dateString] == null) {
        _events[dateString] = [];
      }
      _events[dateString]!.add({
        'appointmenDate': convertToThaiDatetimes(appointmentDate),
        'appointmenTime': event.appointmenTime,
        'roundText': event.roundText,
        'fullname': event.fullname,
        'phoneNo': event.phoneNo,
        'guardianFullname': event.guardianFullname,
        'guardianPhoneNo': event.guardianPhoneNo,
      });
    }
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    final dateString = DateFormat('yyyy-MM-dd').format(day);
    return _events[dateString] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            locale: "th_TH",
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents = _getEventsForDay(selectedDay);
              });
            },
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: MainColors.primary500,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: MainColors.primary500,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              markersMaxCount: 1,
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextFormatter: (date, locale) {
                return formatheader(date);
              },
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: AppointmentsEvent(
              events: _selectedEvents,
            ),
          ),
        ),
      ],
    );
  }
}
