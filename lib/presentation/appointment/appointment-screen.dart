import 'package:bst_staff_mobile/data/repository/Appointments-repository.dart';
import 'package:bst_staff_mobile/domain/model/appointments.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/appointment/appointment-model.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/appointment/calendar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: const BaseAppBarContent(
        title: 'นัดหมาย',
      ),
      body: Stack(
        children: [
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
        ],
      ),
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
