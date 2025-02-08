import 'package:bst_staff_mobile/domain/model/appointment.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appointment/appointment-status.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentEvent event;
  const AppointmentCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'เวลา ${event.appointmenTimeText} น.',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizes.medium,
                  ),
                ),
                AppointmentStatus(
                  appointmentType: event.appointmentType,
                  round: event.round,
                ),
              ],
            ),
            const Divider(color: MainColors.divider, thickness: 0.6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "ผู้ป่วย:",
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
                        event.fullname,
                        style: const TextStyle(fontSize: FontSizes.medium),
                      ),
                      Text(
                        event.phoneNo,
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "ผู้ปกครอง:",
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
                        event.guardianFullname,
                        style: const TextStyle(fontSize: FontSizes.medium),
                      ),
                      Text(
                        event.guardianPhoneNo,
                        style: const TextStyle(
                          fontSize: FontSizes.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
