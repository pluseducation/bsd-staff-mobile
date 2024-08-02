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

  return Chip(
    label: Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    ),
    side: BorderSide(
      color: lightColor,
    ),
    elevation: 0.5,
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: lightColor,
  );
}
