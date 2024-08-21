import 'package:bst_staff_mobile/data/repository/Appointments-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/appointment/appointment-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/layout/base-layout.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: MainColors.primary500,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "นัดหมาย",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const BaseLayout(
                maxWidth: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppointmentMonth(),
                    SizedBox(
                      height: 10,
                    ),
                    AppointmentEvent(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentMonth extends StatefulWidget {
  const AppointmentMonth({super.key});

  @override
  State<AppointmentMonth> createState() => _AppointmentMonthState();
}

class _AppointmentMonthState extends State<AppointmentMonth> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _selectedEvents = [];
  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();

    _events = {
      DateTime.utc(2024, 8, 7): ['สวัสดีครับ1', 'สวัสดีครับ2'],
      DateTime.utc(2024, 8, 15): ['สวัสดีครับ3'],
      DateTime.utc(2024, 8, 21): ['สวัสดีครับ4', 'สวัสดีครับ5', 'สวัสดีครับ6'],
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
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
        print("events===>> ${_selectedEvents}");
      },
      eventLoader: _getEventsForDay,
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: MainColors.primary300,
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
        markersMaxCount: 2,
        markerSizeScale: 0.2,
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}

class AppointmentEvent extends StatefulWidget {
  final List<String> events;
  const AppointmentEvent({super.key, this.events = const []});

  @override
  State<AppointmentEvent> createState() => _AppointmentEventState();
}

class _AppointmentEventState extends State<AppointmentEvent> {
  late final AppointmentsModel model;

  @override
  void initState() {
    super.initState();
    model = AppointmentsModel(
      log: Provider.of<Logger>(super.context, listen: false),
      appointmentsRepository:
          Provider.of<AppointmentsRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );

    model.findAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            widget.events.isNotEmpty ? widget.events.first : 'ไม่มีนัดหมาย',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10:00',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('นัดติดตามครั้งที่ 1'),
                      Divider(
                        color: Color(0xFFDEE2E4),
                        thickness: 0.8,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'ผู้ป่วย:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('เจนนี่  ปาหนัน'),
                                Text('02-222-2222'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'ผู้ปกครอง:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ธัชพล มหาสาร (บิดา)'),
                                Text('02-222-2222'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
