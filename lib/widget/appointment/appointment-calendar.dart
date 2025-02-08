import 'package:bst_staff_mobile/domain/model/appointment.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/constant.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final List<AppointmentDay> appointmentDays;
  final Function(DateTime) onSelectedDate;

  const AppointmentCalendar({
    required this.appointmentDays,
    required this.selectedDate,
    required this.onSelectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final endDateNow = DateTime(year, 12, 31);
    final startDate = appointmentDays.isNotEmpty
        ? DateTime(appointmentDays.first.appointmentDate.year)
        : DateTime(year);
    DateTime endDate = appointmentDays.isNotEmpty
        ? DateTime(appointmentDays.last.appointmentDate.year, 12, 31)
        : DateTime(year, 12, 31);

    if (endDate.isBefore(endDateNow)) {
      endDate = endDateNow;
    }

    return Column(
      children: [
        SingleChildScrollView(
          child: TableCalendar(
            firstDay: startDate,
            lastDay: endDate,
            focusedDay: selectedDate,
            locale: Constant.locale,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDate, convertToDateOnly(day));
            },
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            onDaySelected: (selectedDay, focusedDay) {
              onSelectedDate(selectedDay);
            },
            eventLoader: (day) {
              final objList = appointmentDays
                  .where((t) => t.appointmentDate == convertToDateOnly(day))
                  .toList();
              if (objList.isNotEmpty) {
                return objList;
              } else {
                return [];
              }
            },
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: MainColors.primary500,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: MainColors.primary700,
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
                return formatThaiFullDate(date);
              },
            ),
          ),
        ),
      ],
    );
  }
}
