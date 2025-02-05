import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class AppointmentStatusType extends StatelessWidget {
  final AppointmentType appointmentType;
  final int round;

  const AppointmentStatusType({
    super.key,
    required this.appointmentType,
    required this.round,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    Color lightColor;

    if (appointmentType == AppointmentType.assistance) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.primary500;
      text = 'ช่วยเหลือครั้งที่ $round';
    } else if (appointmentType == AppointmentType.monitoring) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.success;
      text = 'ติดตามครั้งที่ $round';
    } else if (appointmentType == AppointmentType.treatment) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.warning;
      text = 'นัดบำบัดครั้งที่ $round';
    } else if (appointmentType == AppointmentType.reject) {
      lightColor = MainColors.secondaryLight;
      color = MainColors.error;
      text = 'ยกเลิก';
    } else {
      lightColor = MainColors.secondaryLight;
      color = Colors.grey;
      text = 'unknown';
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: FontSizes.small,
                  color: MainColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
