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
    Color textcolor;

    if (appointmentType == AppointmentType.assistance) {
      color = PatientStatusColors.assistance;
      textcolor = PatientStatusColors.assistanceLight;
      text = 'ช่วยเหลือครั้งที่ $round';
    } else if (appointmentType == AppointmentType.monitoring) {
      color = PatientStatusColors.monitoring;
      textcolor = PatientStatusColors.monitoringLight;
      text = 'ติดตามครั้งที่ $round';
    } else if (appointmentType == AppointmentType.treatment) {
      color = PatientStatusColors.treatment;
      textcolor = PatientStatusColors.treatmentLight;
      text = 'นัดบำบัดครั้งที่ $round';
    } else if (appointmentType == AppointmentType.reject) {
      color = PatientStatusColors.discharged;
      textcolor = PatientStatusColors.dischargedLight;
      text = 'ยกเลิก';
    } else {
      textcolor = MainColors.secondaryLight;
      color = Colors.grey;
      text = 'unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textcolor,
              fontSize: FontSizes.small,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
