import 'dart:ui';
import 'package:flutter/material.dart';

class MainColors {
  // Black
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color primary50 = Color(0xFFfcfcfc);
  static const Color primary100 = Color(0xFFd3e0fb);
  static const Color primary300 = Color(0xFF7ca1f3);
  static const Color primary500 = Color(0xFF2563eb);
  static const Color primary700 = Color(0xFF163b8d);
  static const Color primary900 = Color(0xFF07142f);

  static const Color secondaryDark = Color(0XFF1f1f1f);
  static const Color secondary = Color(0XFF333333);
  static const Color secondaryLight = Color(0XFFd6d6d6);

  static const Color background = Color(0xFFfbfbfb);
  static const Color backgroundProfile = Color.fromARGB(255, 239, 237, 237);

  static const Color text = Color(0xFF616161);
  static const Color text600 = Color(0xFF232323);
  static const Color text400 = Color(0xFF3D4245);

  static const Color warningLight = Color(0XFFfff2de);
  static const Color warning = Color(0XFFcc9747);
  static const Color infoLight = Color(0XFFECFDFF);
  static const Color info = Color(0XFF06AED4);
  static const Color successLight = Color(0XFFdbf5ee);
  static const Color success = Color(0XFF4cceac);
  static const Color errorLight = Color(0XFFf8dcdb);
  static const Color error = Color(0XFFF04438);
  static const Color semiurgencybg = Color(0x29919EAB);
}

//--------------------------------------------
//1
class PatientStatusColors {
  static const Color registering = Color(0XFF333333);
  static const Color screening = Color(0XFFcc9747);
  static const Color treatment = Color(0XFF06AED4);
  static const Color monitoring = Color(0XFF4cceac);
  static const Color assistance = Color(0XFF333333);
  static const Color discharged = Color(0XFFF04438);

  static const Color registeringLight = Color(0XFFd6d6d6);
  static const Color screeningLight = Color(0XFFfff2de);
  static const Color treatmentLight = Color(0XFFECFDFF);
  static const Color monitoringLight = Color(0XFFdbf5ee);
  static const Color assistanceLight = Color(0XFFd6d6d6);
  static const Color dischargedLight = Color(0XFFf8dcdb);
}

//2
class PatientLevelTypeColors {
  static const Color normal = Color(0xff0EB366);
  static const Color semiUrgency = Color(0xFFFBBB58);
  static const Color urgency = Color(0xFFFF8F50);
  static const Color emergency = Color(0xFFEF5350);

  static const Color normalLight = Color(0xFF0EB366);
  static const Color semiUrgencyLight = Color(0xFFFFAB00);
  static const Color urgencyLight = Color(0xFFFF8F50);
  static const Color emergencyLight = Color(0xFFC00F0C);
}
//2

class PatientDrugEvalResultColors {
  static const Color drugUser = Color(0xFFFBBB58);
  static const Color drugAbuse = Color(0xFFFF8F50);
  static const Color drugDependence = Color(0xFFEF5350);

  static const Color drugUserLight = Color(0xFFFFAB00);
  static const Color drugAbuseLight = Color(0xFFFF8F50);
  static const Color drugDependenceLight = Color(0xFFC00F0C);
}
