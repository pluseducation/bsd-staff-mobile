import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/enum.dart';
import 'package:flutter/material.dart';

class AppointmentStatus extends StatelessWidget {
  final AppointmentType? appointmentType;
  final int round;

  const AppointmentStatus({
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
      color = PatientStatusColors.assistance;
      lightColor = PatientStatusColors.assistanceLight;
      text = 'ช่วยเหลือครั้งที่ $round';
    } else if (appointmentType == AppointmentType.monitoring) {
      color = PatientStatusColors.monitoring;
      lightColor = PatientStatusColors.monitoringLight;
      text = 'ติดตามครั้งที่ $round';
    } else if (appointmentType == AppointmentType.treatment) {
      color = PatientStatusColors.treatment;
      lightColor = PatientStatusColors.treatmentLight;
      text = 'นัดบำบัดครั้งที่ $round';
    } else if (appointmentType == AppointmentType.reject) {
      color = PatientStatusColors.discharged;
      lightColor = PatientStatusColors.dischargedLight;
      text = 'ยกเลิก';
    } else {
      color = Colors.grey;
      lightColor = MainColors.secondaryLight;
      text = '-';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: FontSizes.small,
        ),
      ),
    );
  }
}
