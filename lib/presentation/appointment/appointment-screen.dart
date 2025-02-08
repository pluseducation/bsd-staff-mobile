import 'package:bst_staff_mobile/data/repository/appointment-repository.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/appointment/appointment-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/convert.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/appointment/appointment-calendar.dart';
import 'package:bst_staff_mobile/widget/appointment/appointment-card.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: MainColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: const AppointmentContent(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentContent extends StatefulWidget {
  const AppointmentContent({super.key});

  @override
  State<AppointmentContent> createState() => _AppointmentContentState();
}

class _AppointmentContentState extends State<AppointmentContent> {
  late final AppointmentModel _model;

  @override
  void initState() {
    super.initState();
    _model = AppointmentModel(
      log: Provider.of<Logger>(context, listen: false),
      appointmentRepository:
          Provider.of<AppointmentRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppointmentModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            final appointment = snapshot.data!;
            return Consumer<AppointmentModel>(
              builder: (context, model, child) {
                final appointment = model.appointment;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    AppointmentCalendar(
                      appointmentDays: appointment.days,
                      selectedDate: model.selectedDate,
                      onSelectedDate: model.setSelectedDate,
                    ),
                    const SizedBox(height: 16),
                    if (model.selectedEvents.isNotEmpty) ...[
                      Text(
                        '${formatThaiFullDate(model.selectedDate)} (${model.selectedEvents.length} นัดหมาย)',
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 250.0,
                          aspectRatio: 1.0,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.9,
                          padEnds: false,
                        ),
                        items: model.selectedEvents
                            .map(
                              (event) => AppointmentCard(
                                event: event,
                              ),
                            )
                            .toList(),
                      ),
                    ] else ...[
                      Text(
                        '${formatThaiFullDate(model.selectedDate)} (ไม่มีนัดหมาย)',
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
