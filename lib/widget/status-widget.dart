import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

Widget patientStatusWidget(String status) {
  String text = "";
  Color lightColor;
  Color color;

  if (status == "REGISTERING") {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "ลงทะเบียน";
  } else if (status == "SCREENING") {
    lightColor = MainColors.warningLight;
    color = MainColors.warning;
    text = "คัดกรอง";
  } else if (status == "TREATMENT") {
    lightColor = MainColors.infoLight;
    color = MainColors.info;
    text = "บำบัด";
  } else if (status == "MONITORING") {
    lightColor = MainColors.successLight;
    color = MainColors.success;
    text = "ติดตาม";
  } else if (status == "ASSISTANCE") {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "ช่วยเหลือ";
  } else if (status == "DISCHARGED") {
    lightColor = MainColors.errorLight;
    color = MainColors.error;
    text = "จำหน่าย";
  } else {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "ลงทะเบียน";
  }

  return Container(
    padding: const EdgeInsets.all(8.0), // Padding inside the Chip
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// เปลี่ยนจาก Widget เป็น Object เนื่องจากต้อง return "" เมื่อไม่เข้าเงื่อนไข
Widget mentalEvalLevelWidget(String status) {
  Color lightColor;
  Color color;
  String text;

  if (status == "NORMAL") {
    lightColor = const Color(0xFFEEFFF4);
    color = const Color(0xFF3CA468);
    text = "ไม่มีอาการ";
  } else if (status == "SEMI_URGENCY") {
    lightColor = const Color(0xFFFFFAED);
    color = const Color(0xFFF2994B);
    text = "กึ่งเร่งด่วน";
  } else if (status == "URGENCY") {
    lightColor = const Color(0xFFFFF0E5);
    color = const Color(0xFFFE6805);
    text = "เร่งด่วน";
  } else if (status == "MONITORING") {
    lightColor = const Color(0xFFFBE9E9);
    color = const Color(0xFFD82E22);
    text = "ฉุกเฉิน";
  } else {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "";
  }

  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget certificateStatusWidget(String status) {
  Color lightColor = MainColors.secondaryLight;
  Color color;
  String text;

  if (status == "REQUEST") {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "รายการขอ";
  } else if (status == "COMPLETED") {
    lightColor = MainColors.warningLight;
    color = MainColors.warning;
    text = "จัดการ Sign off";
  } else {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "";
  }

  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
