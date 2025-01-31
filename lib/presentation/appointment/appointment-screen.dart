import 'package:bst_staff_mobile/data/repository/Appointments-repository.dart';
import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/appointment/appointment-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      //   appBar: const AppointmentAppbar(),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MainColors.primary500,
                Colors.white,
              ],
              stops: [-0.017, 1.2193],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(280 * (3.14159 / 50)),
            ),
            color: Colors.white12,
          ),
          child: Column(
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
                  child: const AppointmentGrop(),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class AppointmentGrop extends StatefulWidget {
  const AppointmentGrop({super.key});

  @override
  State<AppointmentGrop> createState() => _AppointmentGropState();
}

class _AppointmentGropState extends State<AppointmentGrop> {
  late final AppointmentsModel model;

  @override
  void initState() {
    super.initState();
    model = AppointmentsModel(
      log: Provider.of<Logger>(context, listen: false),
      appointmentsRepository:
          Provider.of<AppointmentsRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Appointment>(
      future: model.findAppointments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('ไม่พบข้อมูล'));
        } else {
          final appointment = snapshot.data!;

          return AppointmentMonth(appointment: appointment);
        }
      },
    );
  }
}

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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AppointmentEvent(
                events: _selectedEvents,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppointmentEvent extends StatefulWidget {
  final List<Map<String, String>> events;
  const AppointmentEvent({super.key, this.events = const []});

  @override
  State<AppointmentEvent> createState() => _AppointmentEventState();
}

class _AppointmentEventState extends State<AppointmentEvent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            widget.events.isNotEmpty && widget.events[0]['roundText'] != null
                ? widget.events[0]['appointmenDate'] ?? ''
                : 'ไม่มีนัดหมาย',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        if (widget.events.isNotEmpty)
          Column(
            children: widget.events.map((event) {
              return Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event['appointmenTime'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontSizes.medium,
                            ),
                          ),
                          Text(
                            event['roundText'] ?? '',
                            style: const TextStyle(
                              fontSize: FontSizes.medium,
                            ),
                          ),
                          const Divider(
                            color: Color(0xFFDEE2E4),
                            thickness: 0.8,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'ผู้ป่วย:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes.medium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event['fullname'] ?? '',
                                      style: const TextStyle(
                                        fontSize: FontSizes.medium,
                                      ),
                                    ),
                                    Text(
                                      event['phoneNo'] ?? '',
                                      style: const TextStyle(
                                        fontSize: FontSizes.medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'ผู้ปกครอง:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes.medium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event['guardianFullname'] ?? '',
                                      style: const TextStyle(
                                        fontSize: FontSizes.medium,
                                      ),
                                    ),
                                    Text(
                                      event['guardianPhoneNo'] ?? '',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            }).toList(),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(''),
          ),
      ],
    );
  }
}
